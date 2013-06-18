import org.ofbiz.base.util.*;
import org.ofbiz.product.catalog.*;
import org.ofbiz.product.category.*;
import org.ofbiz.product.store.ProductStoreWorker;

import javolution.util.FastMap;
import org.ofbiz.entity.util.EntityUtil;
import java.util.List;
import org.ofbiz.entity.condition.EntityCondition;
import org.ofbiz.entity.condition.EntityOperator;
import org.ofbiz.product.product.*;
import java.util.Collections;
import java.util.Random;
import org.ofbiz.base.util.cache.UtilCache;

CategoryWorker.getRelatedCategories(request, "topLevelList", CatalogWorker.getCatalogTopCategoryId(request, "SHOPMAX_CATALOG"), true);
categoryList = request.getAttribute("topLevelList");

if (categoryList) {
    context.categoryList = categoryList;
}
if (parameters.categoryFirstId)
{
    CategoryWorker.getRelatedCategories(request, "subCategoryList", parameters.categoryFirstId, false);
    categorySecondList = request.getAttribute("subCategoryList");
    context.categorySecondList = categorySecondList;
}
if (parameters.categorySecondId)
{
    CategoryWorker.getRelatedCategories(request, "subCategoryList", parameters.categorySecondId, false);
    categoryThirdList = request.getAttribute("subCategoryList");
    context.categoryThirdList = categoryThirdList;
}
if (parameters.categoryThirdId)
{
    CategoryWorker.getRelatedCategories(request, "subCategoryList", parameters.categoryThirdId, false);
    categoryFourthList = request.getAttribute("subCategoryList");
    context.categoryFourthList = categoryFourthList;
}

if(parameters.productId){
    product = delegator.findOne("Product", [productId : parameters.productId], true);
    if(product){
        context.productId = product.productId;
        context.productName = product.productName;
        context.description = product.longDescription;
        
        categoryMemberNameList = [];
        categoryMemberList = EntityUtil.filterByDate(delegator.findByAnd("ProductCategoryMember" , [productId : product.productId], null, true));
        for (categoryMember in categoryMemberList) {
            categoryMemberMap = [:];
            categoryMemberName = delegator.findOne("ProductCategory", [productCategoryId : categoryMember.productCategoryId], true);
            categoryMemberMap.productCategoryId = categoryMember.productCategoryId;
            categoryMemberMap.categoryName = categoryMemberName.categoryName;
            categoryMemberNameList.add(categoryMemberMap);
        }
        context.categoryMemberNameList = categoryMemberNameList;
        
        productPriceDefault = EntityUtil.getFirst(EntityUtil.filterByDate(delegator.findByAnd("ProductPrice", [productId : product.productId, productPricePurposeId : "PURCHASE", productPriceTypeId : "DEFAULT_PRICE"], null, false)));
        if (productPriceDefault) {
            context.defaultPrice = productPriceDefault.price;
        }
        
        productPricePromo = EntityUtil.getFirst(delegator.findByAnd("ProductPrice", [productId : product.productId, productPricePurposeId : "PURCHASE", productPriceTypeId : "SPECIAL_PROMO_PRICE"], null, false));
        if (productPricePromo) {
            context.promoPrice = productPricePromo.price;
            context.productPricePromo = productPricePromo;
        }
        
        productImageList = [];
        imageSequenceList = [];
        imageSeqEmpty = [1,2,3,4];
        productImageAndContentLists = delegator.findByAnd("ProductContentAndInfo", ["productId": product.productId, productContentTypeId : "IMAGE", "statusId" : "IM_APPROVED", "drIsPublic" : "Y"], ["sequenceNum"], false);
        if (productImageAndContentLists) {
            productImageAndContentLists.each { productImageAndContentLists ->
                productImageMap = [:];
                contentAssocThumb = EntityUtil.getFirst(delegator.findByAnd("ContentAssocDataResourceViewTo", [contentIdStart : productImageAndContentLists.contentId, caContentAssocTypeId : "IMAGE_THUMBNAIL"], null, false));
                if (contentAssocThumb) {
                    productImageMap.productImage = productImageAndContentLists.drObjectInfo;
                    productImageMap.productImageThumb = contentAssocThumb.drObjectInfo;
                    productImageMap.contentId = productImageAndContentLists.contentId;
                    productImageMap.fromDate = productImageAndContentLists.fromDate;
                    productImageMap.sequenceNum = productImageAndContentLists.sequenceNum;
                    imageSequenceList.add(productImageAndContentLists.sequenceNum);
                }
                i = imageSeqEmpty.iterator()
                while (i.hasNext()) {
                    if (i.next() == productImageAndContentLists.sequenceNum) {
                        i.remove()
                        break
                    }
                }
                productImageList.add(productImageMap);
            }
        }
        context.imageSequenceList = imageSequenceList;
        context.seqNumNoImage = imageSeqEmpty
        context.productImageList = productImageList;
        
        inventorySummary = dispatcher.runSync("getProductInventoryAvailable", UtilMisc.toMap("productId", product.productId));
        if (inventorySummary) {
            context.stock = inventorySummary.availableToPromiseTotal;
        }
        
        productAttribute = delegator.findOne("ProductAttribute", [productId : product.productId, attrName : "SHIPPING_SIZE"], true);
        if (productAttribute) {
            context.shippingSize = productAttribute.attrValue;
        }
        
        goodIdentification = delegator.findOne("GoodIdentification", [goodIdentificationTypeId : "SKU", productId : product.productId], true);
        if (goodIdentification) {
            context.productSKU = goodIdentification.idValue;
        }
    }
}
