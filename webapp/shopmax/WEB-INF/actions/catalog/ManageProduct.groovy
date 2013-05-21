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

productList = [];
if (productCategoryId) {
    context.productCategoryId = productCategoryId;
    
    viewSize = parameters.VIEW_SIZE;
    viewIndex = parameters.VIEW_INDEX;
    currentCatalogId = CatalogWorker.getCurrentCatalogId(request);
    
    // set the default view size
    defaultViewSize = request.getAttribute("defaultViewSize") ?: 20;
    context.defaultViewSize = defaultViewSize;
    
    // set the limit view
    limitView = request.getAttribute("limitView") ?: true;
    context.limitView = limitView;
    
    // get the product category & members
    andMap = [productCategoryId : productCategoryId,
            viewIndexString : viewIndex,
            viewSizeString : viewSize,
            defaultViewSize : defaultViewSize,
            limitView : limitView];
    andMap.put("prodCatalogId", currentCatalogId);
    andMap.put("checkViewAllow", true);
    if (context.orderByFields) {
        andMap.put("orderByFields", context.orderByFields);
    } else {
        andMap.put("orderByFields", ["sequenceNum", "productId"]);
    }
    catResult = dispatcher.runSync("getProductCategoryAndLimitedMembers", andMap);
    
    productCategory = catResult.productCategory;
    productCategoryMembers = catResult.productCategoryMembers;
    productCategoryMembers.each { productCategoryMember ->
        productMap = [:];
        categoryMemberList = delegator.findByAnd("ProductCategoryMember" , [productId : productCategoryMember.productId], null, false);
        categoryMemberNameList = [];
        for (categoryMember in categoryMemberList) {
            categoryMemberName = delegator.findByAnd("ProductCategory", [productCategoryId : categoryMember.productCategoryId], null, false);
            categoryMemberNameList.add(categoryMemberName[0].description);
        }
        productMap.categoryMember = categoryMemberNameList;
        
        product = delegator.findOne("Product", [productId : productCategoryMember.productId], true);
        productMap.productId = product.productId;
        productMap.productName = product.productName;
        productMap.description = product.description;
        
        productPriceDefault = EntityUtil.getFirst(EntityUtil.filterByDate(delegator.findByAnd("ProductPrice", [productId : product.productId, productPricePurposeId : "PURCHASE", productPriceTypeId : "DEFAULT_PRICE"], null, false)));
        if (productPriceDefault) {
            productMap.defaultPrice = productPriceDefault.price;
        }
        
        productPricePromo = EntityUtil.getFirst(EntityUtil.filterByDate(delegator.findByAnd("ProductPrice", [productId : product.productId, productPricePurposeId : "PURCHASE", productPriceTypeId : "PROMO_PRICE"], null, false)));
        if (productPricePromo) {
            productMap.promoPrice = productPricePromo.price;
            productMap.productPricePromo = productPricePromo;
        }
        
        /*productContentAndInfoDefault= EntityUtil.getFirst(EntityUtil.filterByDate(delegator.findByAnd("ProductContentAndInfo", ["productId": product.productId, productContentTypeId : "DEFAULT_IMAGE", "statusId" : "IM_APPROVED", "drIsPublic" : "Y"])));
        if (UtilValidate.isNotEmpty(productContentAndInfoDefault)) {
            productMap.productImage = productContentAndInfoDefault.drObjectInfo;
            contentAssocThumb = EntityUtil.getFirst(delegator.findByAnd("ContentAssocDataResourceViewTo", [contentIdStart : productContentAndInfoDefault.contentId, caContentAssocTypeId : "IMAGE_THUMBNAIL"]));
            if (contentAssocThumb) {
                productMap.productImageThumb = contentAssocThumb.drObjectInfo;
            }
        } else {
            productContentAndInfoImage = EntityUtil.getFirst(EntityUtil.filterByDate(delegator.findByAnd("ProductContentAndInfo", ["productId": product.productId, productContentTypeId : "IMAGE", "statusId" : "IM_APPROVED", "drIsPublic" : "Y"], ["sequenceNum"])));
            if (productContentAndInfoImage) {
                productMap.productImage = productContentAndInfoImage.drObjectInfo;
                contentAssocThumb = EntityUtil.getFirst(delegator.findByAnd("ContentAssocDataResourceViewTo", [contentIdStart : productContentAndInfoImage.contentId, caContentAssocTypeId : "IMAGE_THUMBNAIL"]));
                if (contentAssocThumb) {
                    productMap.productImageThumb = contentAssocThumb.drObjectInfo;
                }
            }
        }*/
        
        productImageList = [];
        productContentAndInfoImageManamentList = delegator.findByAnd("ProductContentAndInfo", ["productId": product.productId, productContentTypeId : "IMAGE", "statusId" : "IM_APPROVED", "drIsPublic" : "Y"], ["sequenceNum"]);
        if (productContentAndInfoImageManamentList) {
            productContentAndInfoImageManamentList.each { productContentAndInfoImageManament ->
                productImageMap = [:];
                contentAssocThumb = EntityUtil.getFirst(delegator.findByAnd("ContentAssocDataResourceViewTo", [contentIdStart : productContentAndInfoImageManament.contentId, caContentAssocTypeId : "IMAGE_THUMBNAIL"]));
                if (contentAssocThumb) {
                    productImageMap.productImage = productContentAndInfoImageManament.drObjectInfo;
                    productImageMap.productImageThumb = contentAssocThumb.drObjectInfo;
                    productImageMap.sequenceNum = productContentAndInfoImageManament.sequenceNum;
                }
                productImageList.add(productImageMap);
            }
        }
        productMap.productImageList = productImageList;
        
        inventorySummary = dispatcher.runSync("getInventoryAvailableByFacility", UtilMisc.toMap("productId", product.productId, "facilityId", "SellerWarehouse"));
        productMap.stock = inventorySummary.availableToPromiseTotal;
        
        productAttribute = delegator.findOne("ProductAttribute", [productId : product.productId, attrName : "SHIPPING_SIZE"], true);
        if (productAttribute) {
            productMap.shippingSize = productAttribute.attrValue;
        }
        
        productList.add(productMap);
    }
    
    context.productCategory = productCategory;
    context.productCategoryMembers = productCategoryMembers;
    context.productList = productList;
    context.viewIndex = catResult.viewIndex;
    context.viewSize = catResult.viewSize;
    context.lowIndex = catResult.lowIndex;
    context.highIndex = catResult.highIndex;
    context.listSize = catResult.listSize;
    
    // set this as a last viewed
    // DEJ20070220: WHY is this done this way? why not use the existing CategoryWorker stuff?
    LAST_VIEWED_TO_KEEP = 10; // modify this to change the number of last viewed to keep
    lastViewedCategories = session.getAttribute("lastViewedCategories");
    if (!lastViewedCategories) {
        lastViewedCategories = [];
        session.setAttribute("lastViewedCategories", lastViewedCategories);
    }
    lastViewedCategories.remove(productCategoryId);
    lastViewedCategories.add(0, productCategoryId);
    while (lastViewedCategories.size() > LAST_VIEWED_TO_KEEP) {
        lastViewedCategories.remove(lastViewedCategories.size() - 1);
    }
    
    // set the content path prefix
    contentPathPrefix = CatalogWorker.getContentPathPrefix(request);
    context.put("contentPathPrefix", contentPathPrefix);
    
    CategoryContentWrapper categoryContentWrapper = new CategoryContentWrapper(productCategory, request);
    context.put("categoryContentWrapper", categoryContentWrapper);
}