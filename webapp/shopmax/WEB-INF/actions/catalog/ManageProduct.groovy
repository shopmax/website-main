/*
* Licensed to the Apache Software Foundation (ASF) under one
* or more contributor license agreements.  See the NOTICE file
* distributed with this work for additional information
* regarding copyright ownership.  The ASF licenses this file
* to you under the Apache License, Version 2.0 (the
* "License"); you may not use this file except in compliance
* with the License.  You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing,
* software distributed under the License is distributed on an
* "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
* KIND, either express or implied.  See the License for the
* specific language governing permissions and limitations
* under the License.
*/

import org.ofbiz.base.util.*;
import org.ofbiz.entity.*;
import org.ofbiz.entity.condition.*;
import org.ofbiz.entity.util.*;
import org.ofbiz.service.*;
import org.ofbiz.product.catalog.*;
import org.ofbiz.product.category.CategoryContentWrapper;
import org.ofbiz.product.store.ProductStoreWorker;
import java.util.Iterator;

/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

import java.util.List;

import org.ofbiz.base.util.*;
import org.ofbiz.base.util.cache.UtilCache;
import org.ofbiz.entity.*;
import org.ofbiz.entity.condition.*;
import org.ofbiz.entity.util.*;
import org.ofbiz.service.*;
import org.ofbiz.product.catalog.*;
import org.ofbiz.product.category.*;
import org.ofbiz.product.store.ProductStoreWorker;

productMemberList = [];
productCategoryMembers = [];

if (breadcrumbTitle) {
    context.breadcrumbTitle = breadcrumbTitle;
} else {
    categoryList = [];
    if (productCategoryId) {
        getParentCategory(productCategoryId);
        context.categoryBreadcrumbList = categoryList;
    }
    
}

// Cache
productMemberListCache = null;
useCacheForMembers = UtilProperties.getPropertyValue("shopmax.properties", "shopmax.product.category.cache");
if (useCacheForMembers == "Y") {
    productListCache = UtilCache.findCache("productListCache");
    if (productListCache == null) {
        productListCache = UtilCache.createUtilCache("productListCache");
    }
    
    if (productCategoryId) {
        productMemberListCache = productListCache.get("productListCache_" + productCategoryId);
    } else {
        productMemberListCache = productListCache.get("manageProductListCache");
    }
    
    if (productMemberListCache != null) {
        productMemberList = productMemberListCache;
    }
}

viewSize = parameters.VIEW_SIZE;
viewIndex = parameters.VIEW_INDEX;

// set the default view size
defaultViewSize = 20;
context.defaultViewSize = defaultViewSize;

// set the limit view
limitView = true;
context.limitView = limitView;

if (viewIndex) {
    viewIndex = Integer.valueOf(viewIndex).intValue();
} else {
    viewIndex = 0;
}

if (viewSize) {
    viewSize = Integer.valueOf(viewSize).intValue();
} else {
    viewSize = defaultViewSize
}

listSize = 0;
lowIndex = 0;
highIndex = 0;

if (limitView) {
    // get the indexes for the partial list
    lowIndex = ((viewIndex * viewSize) + 1);
    highIndex = (viewIndex + 1) * viewSize;
} else {
    lowIndex = 0;
    highIndex = 0;
}

if (productMemberList.size() == 0) {
    if (productCategoryId) {
        productCategoryMembers = EntityUtil.filterByDate(delegator.findByAnd("ProductCategoryMember", [productCategoryId : productCategoryId], null, true));
        if (!productCategoryMembers) {
            CategoryWorker.getRelatedCategories(request, "subLevelList", productCategoryId, true, false);
            subLevelList = request.getAttribute("subLevelList");
            if (subLevelList) {
                getProductMember(subLevelList);
            }
        }
    } else {
        List productConditionList = [];
        productConditionList.add(EntityCondition.makeCondition("salesDiscontinuationDate", EntityOperator.EQUALS, null));
        productConditionList.add(EntityCondition.makeCondition("salesDiscontinuationDate", EntityOperator.GREATER_THAN, UtilDateTime.nowTimestamp()));
        productCategoryMembers = delegator.findList("Product", EntityCondition.makeCondition(productConditionList, EntityOperator.OR), null, null, null, false);
    }
} else {
    productCategoryMembers = productMemberList;
}

if (productMemberListCache == null) {
    productIds = [];
    if (productCategoryMembers) {
        for (productCategoryMember in productCategoryMembers) {
            productIds.add(productCategoryMember.productId);
        }
        if (productIds.size > 0) {
            productIds = getUniques(productIds);
            productCategoryMembers = getProductDetail(productIds);
        }
    }
    if (useCacheForMembers == "Y") {
        if (productCategoryId) {
            productListCache.put("productListCache_" + productCategoryId, productCategoryMembers);
        } else {
            productListCache.put("manageProductListCache", productCategoryMembers);
        }
    }
}

if (productCategoryMembers.size() < defaultViewSize) {
    defaultViewSize = productCategoryMembers.size();
}

if (UtilValidate.isNotEmpty(parameters.sortBy)) {
    def sortBy = parameters.sortBy;
    if (sortBy.equals("price")) {
        productCategoryMembers = UtilMisc.sortMaps(productCategoryMembers, UtilMisc.toList("price"));
    } else if (sortBy.equals("name")) {
        productCategoryMembers = UtilMisc.sortMaps(productCategoryMembers, UtilMisc.toList("productName"));
    } else if (sortBy.equals("stock")) {
        productCategoryMembers = UtilMisc.sortMaps(productCategoryMembers, UtilMisc.toList("stock"));
    }
}

// set the index and size
listSize = productCategoryMembers.size();
if (highIndex > listSize) {
    highIndex = listSize;
}

// get only between low and high indexes
if (limitView) {
    if (UtilValidate.isNotEmpty(productCategoryMembers)) {
        productCategoryMembers = productCategoryMembers.subList(lowIndex-1, highIndex);
    }
} else {
    lowIndex = 1;
    highIndex = listSize;
}

context.productCategoryId = productCategoryId;
context.productCategoryMembers = productCategoryMembers;
context.viewIndex = Integer.valueOf(viewIndex);
context.viewSize = Integer.valueOf(viewSize);
context.lowIndex = Integer.valueOf(lowIndex);
context.highIndex = Integer.valueOf(highIndex);
context.listSize = Integer.valueOf(listSize);

productList = [];
if (productCategoryMembers) {
    productCategoryMembers.each { productCategoryMember ->
        productMap = [:];
        categoryMemberList = EntityUtil.filterByDate(delegator.findByAnd("ProductCategoryMember" , [productId : productCategoryMember.productId], null, true));
        categoryMemberNameList = [];
        for (categoryMember in categoryMemberList) {
            categoryMemberName = delegator.findOne("ProductCategory", [productCategoryId : categoryMember.productCategoryId], true);
            categoryMemberNameList.add(categoryMemberName.categoryName);
        }
        productMap.categoryMember = categoryMemberNameList;
        
        product = delegator.findOne("Product", [productId : productCategoryMember.productId], true);
        productMap.productId = product.productId;
        productMap.productName = product.productName;
        productMap.description = product.longDescription;
        
        productPriceDefault = EntityUtil.getFirst(EntityUtil.filterByDate(delegator.findByAnd("ProductPrice", [productId : product.productId, productPricePurposeId : "PURCHASE", productPriceTypeId : "DEFAULT_PRICE"], null, false)));
        if (productPriceDefault) {
            productMap.defaultPrice = productPriceDefault.price;
        }
        
        productPricePromo = EntityUtil.getFirst(delegator.findByAnd("ProductPrice", [productId : product.productId, productPricePurposeId : "PURCHASE", productPriceTypeId : "SPECIAL_PROMO_PRICE"], null, false));
        if (productPricePromo) {
            productMap.promoPrice = productPricePromo.price;
            productMap.productPricePromo = productPricePromo;
        }
        
        productContentAndInfoDefault= EntityUtil.getFirst(EntityUtil.filterByDate(delegator.findByAnd("ProductContentAndInfo", ["productId": product.productId, productContentTypeId : "DEFAULT_IMAGE", "statusId" : "IM_APPROVED", "drIsPublic" : "Y"], null, false)));
        if (UtilValidate.isNotEmpty(productContentAndInfoDefault)) {
            productMap.productImage = productContentAndInfoDefault.drObjectInfo;
            contentAssocThumb = EntityUtil.getFirst(delegator.findByAnd("ContentAssocDataResourceViewTo", [contentIdStart : productContentAndInfoDefault.contentId, caContentAssocTypeId : "IMAGE_THUMBNAIL"], null, false));
            if (contentAssocThumb) {
                productMap.productImageThumb = contentAssocThumb.drObjectInfo;
            }
        } else {
            productContentAndInfoImage = EntityUtil.getFirst(EntityUtil.filterByDate(delegator.findByAnd("ProductContentAndInfo", ["productId": product.productId, productContentTypeId : "IMAGE", "statusId" : "IM_APPROVED", "drIsPublic" : "Y"], ["sequenceNum"], false)));
            if (productContentAndInfoImage) {
                productMap.productImage = productContentAndInfoImage.drObjectInfo;
                contentAssocThumb = EntityUtil.getFirst(delegator.findByAnd("ContentAssocDataResourceViewTo", [contentIdStart : productContentAndInfoImage.contentId, caContentAssocTypeId : "IMAGE_THUMBNAIL"], null, false));
                if (contentAssocThumb) {
                    productMap.productImageThumb = contentAssocThumb.drObjectInfo;
                }
            }
        }
        
        productImageList = [];
        imageSequenceList = [];
        imageSeqEmpty = [1,2,3,4];
        productContentAndInfoImageManamentList = delegator.findByAnd("ProductContentAndInfo", ["productId": product.productId, productContentTypeId : "IMAGE", "statusId" : "IM_APPROVED", "drIsPublic" : "Y"], ["sequenceNum"], false);
        if (productContentAndInfoImageManamentList) {
            productContentAndInfoImageManamentList.each { productContentAndInfoImageManament ->
                productImageMap = [:];
                contentAssocThumb = EntityUtil.getFirst(delegator.findByAnd("ContentAssocDataResourceViewTo", [contentIdStart : productContentAndInfoImageManament.contentId, caContentAssocTypeId : "IMAGE_THUMBNAIL"], null, false));
                if (contentAssocThumb) {
                    productImageMap.productImage = productContentAndInfoImageManament.drObjectInfo;
                    productImageMap.productImageThumb = contentAssocThumb.drObjectInfo;
                    productImageMap.contentId = productContentAndInfoImageManament.contentId;
                    productImageMap.fromDate = productContentAndInfoImageManament.fromDate;
                    productImageMap.sequenceNum = productContentAndInfoImageManament.sequenceNum;
                    imageSequenceList.add(productContentAndInfoImageManament.sequenceNum);
                }
                i = imageSeqEmpty.iterator()
                while (i.hasNext()) {
                    if (i.next() == productContentAndInfoImageManament.sequenceNum) {
                        i.remove()
                        break
                    }
                }
                productImageList.add(productImageMap);
            }
        }
        productMap.imageSequenceList = imageSequenceList;
        productMap.seqNumNoImage = imageSeqEmpty
        productMap.productImageList = productImageList;
        
        inventorySummary = dispatcher.runSync("getInventoryAvailableByFacility", UtilMisc.toMap("productId", product.productId, "facilityId", "SellerWarehouse"));
        productMap.stock = inventorySummary.availableToPromiseTotal;
        
        productAttribute = delegator.findOne("ProductAttribute", [productId : product.productId, attrName : "SHIPPING_SIZE"], true);
        if (productAttribute) {
            productMap.shippingSize = productAttribute.attrValue;
        }
        
        goodIdentification = delegator.findOne("GoodIdentification", [goodIdentificationTypeId : "SKU", productId : product.productId], true);
        if (goodIdentification) {
            productMap.productSKU = goodIdentification.idValue;
        }
        
        productList.add(productMap);
    }
    context.productList = productList;
}

def getProductMember(categories) {
    if (categories != null) {
        categoryList = [];
        categories.each { subLevel ->
            if (subLevel.showInSelect == "Y") {
                categoryList.add(subLevel);
            }
        }
        for (category in categoryList) {
            productCategoryMembers.addAll(EntityUtil.filterByDate(delegator.findByAnd("ProductCategoryMember", [productCategoryId : category.productCategoryId], null, true)));
            subCategories = CategoryWorker.getRelatedCategoriesRet(request, "subLevelList", category.productCategoryId, true, false, true);
            if (subCategories) {
                getProductMember(subCategories);
            }
        }
    }
}

def getProductDetail(productIds) {
    def result = null;
    resultMap = [];
    if (productIds != null) {
        productIds.each { productId ->
            productMap = [:];
            product = delegator.findOne("Product", [productId : productId], true);
            productMap.productId = product.productId;
            productMap.internalName = product.internalName;
            productMap.productName = product.productName;
            productMap.description = product.longDescription;
            productMap.isVirtual = product.isVirtual;
            
            defaultPrice = EntityUtil.getFirst(EntityUtil.filterByDate(delegator.findByAnd("ProductPrice", [productId : productId, productPriceTypeId : "LIST_PRICE"], null, false)));
            if (defaultPrice) {
                productMap.defaultPrice = defaultPrice.price;
            }
            promoPrice = EntityUtil.getFirst(EntityUtil.filterByDate(delegator.findByAnd("ProductPrice", [productId : productId, productPriceTypeId : "SPECIAL_PROMO_PRICE"], null, false)));
            if (promoPrice) {
                productMap.promoPrice = promoPrice.price;
            }
            
            productAttribute = delegator.findOne("ProductAttribute", [productId : productId, attrName : "STOCK"], true);
            if (productAttribute) {
                productMap.stock = productAttribute.attrValue;
            } else {
                inventorySummary = dispatcher.runSync("getInventoryAvailableByFacility", UtilMisc.toMap("productId", productId, "facilityId", "SellerWarehouse"));
                productMap.stock = inventorySummary.availableToPromiseTotal;
            }
            
            resultMap.add(productMap);
        }
        result = resultMap;
    }
    return result;
}

//Function check uniques list
def <T extends Object> List<T> getUniques(List<T> list) {
    List<T> uniques = new ArrayList<T>();
    HashMap<T,T> hm = new HashMap<T,T>();
    for (T t : list) {
        if (hm.get(t) == null) {
            hm.put(t,t);
            uniques.add(t);
        }
    }
    return uniques;
}

def getParentCategory(categoryId) {
    if (categoryId != null) {
        categoryMap = [:];
        productCategoryRollup = EntityUtil.getFirst(EntityUtil.filterByDate(delegator.findByAnd("ProductCategoryRollup", [productCategoryId : categoryId], null, true)));
        if (productCategoryRollup) {
            if (productCategoryRollup.parentProductCategoryId != "SHOPMAX_BROWSE_ROOT") {
                categoryList.addAll(delegator.findOne("ProductCategory", [productCategoryId : productCategoryRollup.productCategoryId], true));
                getParentCategory(productCategoryRollup.parentProductCategoryId);
            }
            else{
                categoryList.addAll(delegator.findOne("ProductCategory", [productCategoryId : productCategoryRollup.productCategoryId], true));
            }
        }
    }
}
