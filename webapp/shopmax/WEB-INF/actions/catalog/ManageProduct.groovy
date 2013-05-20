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
import org.ofbiz.order.shoppingcart.ShoppingCartEvents;
import javolution.util.FastList;

productCategoryId = parameters.productCategoryId;
if (productCategoryId) {
    productCategory = delegator.findOne("ProductCategory", [productCategoryId : productCategoryId], true);
    
    def productList = [];
    def categoryMemberMap = [];
    def productCategoryMembers;
    productLists = delegator.findByAnd("ProductCategoryMemberAndPrice", [productCategoryId : productCategoryId , priceProductPriceTypeId : "LIST_PRICE"], null, false);
    productLists.each { product ->
        categoryMemberList = delegator.findByAnd("ProductCategoryMember" , [productId : product.productId], null, false);
        categoryMemberNameList = [];
        for (categoryMember in categoryMemberList) {
            categoryMemberName = delegator.findByAnd("ProductCategory", [productCategoryId : categoryMember.productCategoryId], null, false);
            categoryMemberNameList.add(categoryMemberName[0].description);
        }
        productMap = [:];
        productMap.productName = product.productProductName;
        productMap.description = product.productDescription;
        productMap.listPrice = product.pricePrice;
        productMap.categoryMember = categoryMemberNameList;
        
        productImageList = [];
        productContentAndInfoImageManamentList = delegator.findByAnd("ProductContentAndInfo", ["productId": product.productId, productContentTypeId : "IMAGE", "statusId" : "IM_APPROVED", "drIsPublic" : "Y"], ["sequenceNum"]);
        if (productContentAndInfoImageManamentList) {
            productContentAndInfoImageManamentList.each { productContentAndInfoImageManament ->
                contentAssocThumb = EntityUtil.getFirst(delegator.findByAnd("ContentAssocDataResourceViewTo", [contentIdStart : productContentAndInfoImageManament.contentId, caContentAssocTypeId : "IMAGE_THUMBNAIL"]));
                if (contentAssocThumb) {
                    productMap.productImage = productContentAndInfoImageManament.drObjectInfo;
                    productMap.productImageThumb = contentAssocThumb.drObjectInfo;
                }
            }
        }
        productList.add(productMap);
    }
    context.productList = productList;
    println "===================productList======================"+productList;
}