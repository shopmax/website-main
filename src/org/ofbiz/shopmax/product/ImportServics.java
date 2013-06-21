/**
 * 
 */
package org.ofbiz.shopmax.product;

/**
 * @author Sumit Pandit & Harsha Chadhar
 */

import java.io.FileReader;
import java.math.BigDecimal;
import java.sql.Timestamp; 
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ofbiz.base.util.Debug;
import org.ofbiz.base.util.UtilDateTime;
import org.ofbiz.base.util.UtilMisc;
import org.ofbiz.base.util.UtilValidate;
import org.ofbiz.entity.Delegator;
import org.ofbiz.entity.GenericEntityException;
import org.ofbiz.entity.GenericValue;
import org.ofbiz.entity.condition.EntityCondition;
import org.ofbiz.entity.condition.EntityOperator;
import org.ofbiz.entity.util.EntityUtil;
import org.ofbiz.service.DispatchContext;
import org.ofbiz.service.ModelService;
import org.ofbiz.service.ServiceUtil;
import org.supercsv.cellprocessor.Optional;
import org.supercsv.cellprocessor.ParseBigDecimal;
import org.supercsv.cellprocessor.ParseDate;
import org.supercsv.cellprocessor.ParseInt;
import org.supercsv.cellprocessor.constraint.NotNull;
import org.supercsv.cellprocessor.ift.CellProcessor;
import org.supercsv.exception.SuperCsvConstraintViolationException;
import org.supercsv.io.CsvBeanReader;
import org.supercsv.io.ICsvBeanReader;
import org.supercsv.prefs.CsvPreference;

public class ImportServics {

    private static final String CSV_FILENAME = "C:/development/runfang/ofbiz/products.csv";
    private static final String CSV_CATEGORY_FILENAME = "C:/development/runfang/ofbiz/categories.csv";
    public static final String module = ImportServics.class.getName();

    /*
     * @return the Product cellProcessor
     */
    private static CellProcessor[] getProductProcessors() {
        final CellProcessor[] processors = new CellProcessor[] { new NotNull(), // Product Name
                new NotNull(), // product Description
                new NotNull(), // categoryPath
                new NotNull(new ParseBigDecimal()), // List Price
                new NotNull(new ParseBigDecimal()), // Discounted Price
                new Optional(new ParseDate("dd/MM/yyyy")), // price Start Date
                new Optional(new ParseDate("dd/MM/yyyy")), // price End Date
                new Optional(new ParseInt()), // stock
                new Optional(new ParseInt()), // shipping Size
                new Optional(), // product Image File Name, From csv it may be null but then store default value in the database.
                new Optional(), // SKU
                new Optional(), // product thimbnail Image File Name
                new NotNull () // SellerSubdomainName
        };
        return processors;
    }
    
    /*
     * @return the category cellProcessor
     */
    private static CellProcessor[] getCategoryProcessors() {
        final CellProcessor[] processors = new CellProcessor[] {
                new NotNull(), // product Category Id                
                new NotNull(), // Category Name
                new NotNull() // Show On Home Page
        };
        return processors;
    }
    
    public static Map<String, Object> importProductCategoryFromCSV(DispatchContext dctx, Map<String, ? extends Object> context) {
        Delegator delegator = dctx.getDelegator();
        Map<String, Object> result = new HashMap<String, Object> ();
        List<String> errorMsgList = new ArrayList<String> ();
        try {
            readAndImportCategoryData(delegator, errorMsgList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (UtilValidate.isNotEmpty(errorMsgList)) {
            result.put(ModelService.ERROR_MESSAGE_LIST, errorMsgList);
        } else {
            return ServiceUtil.returnSuccess();
        }
        return result;        
    }
    
    public static Map<String, Object> importProductsFromCSV(DispatchContext dctx, Map<String, ? extends Object> context) {
        Delegator delegator = dctx.getDelegator();
        Map<String, Object> result = new HashMap<String, Object> ();
        List<String> errorMsgList = new ArrayList<String> ();
        try {
            readAndImportProductData(delegator, errorMsgList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (UtilValidate.isNotEmpty(errorMsgList)) {
            result.put(ModelService.ERROR_MESSAGE_LIST, errorMsgList);
        } else {
            return ServiceUtil.returnSuccess();
        }
        return result;
    }
    
    private static void readAndImportCategoryData(Delegator delegator, List<String> errorMsgList) throws Exception {
        ICsvBeanReader beanReader = null;
        try {
            beanReader = new CsvBeanReader(new FileReader(CSV_CATEGORY_FILENAME), CsvPreference.STANDARD_PREFERENCE);
            final String[] header = beanReader.getHeader(true);
            final CellProcessor[] processors = getCategoryProcessors();
            CategoryImportBean productCategory;

            while ((productCategory = beanReader.read(CategoryImportBean.class, header, processors)) != null) {
                errorMsgList.addAll(prepareProductCategoryValue(productCategory, delegator));
                Debug.logError((String.format(
                        "lineNo=%s, rowNo=%s, customer=%s",
                        beanReader.getLineNumber(), beanReader.getRowNumber(), productCategory)), module );
            }
        } catch(SuperCsvConstraintViolationException ex) {
            Debug.logError(ex.getMessage(), null);
            errorMsgList.add(ex.getMessage());
        }finally {
            if (beanReader != null) {
                beanReader.close();
            }
        }

    }
    
    private static List<String> prepareProductCategoryValue (CategoryImportBean productCategoryBean, Delegator delegator) {
        String categoryName = productCategoryBean.getCategoryName();
        String categoryId = productCategoryBean.getCategoryID();
        //TODO : store value of showOnHomePage.
        String showOnHomePage = productCategoryBean.getShowOnHomePage();
        List<String> errorMsgList = new ArrayList<String>();
        
        String[]categoryIds = categoryId.split("/");
        String currentCategoryId = null;
        String previousCategoryId = null;
        
        for (int catCtr = 0; catCtr < categoryIds.length; catCtr++) {
            currentCategoryId = categoryIds[catCtr];
            if (catCtr != 0) {
                previousCategoryId =  categoryIds[catCtr - 1];
            }
            GenericValue productCategory = null;
            try {
                productCategory = delegator.findOne("ProductCategory", false, UtilMisc.toMap("productCategoryId", currentCategoryId));
                if (UtilValidate.isEmpty(productCategory)) {
                    delegator.create(delegator.makeValue("ProductCategory", UtilMisc.toMap("productCategoryId", currentCategoryId, "categoryName", categoryName)), true);
                }
                if (catCtr != 0) {
                    List<GenericValue> productCategoryRollup = delegator.findList("ProductCategoryRollup",            
                            EntityCondition.makeCondition(UtilMisc.toList(
                                    EntityCondition.makeCondition("productCategoryId", EntityOperator.EQUALS, currentCategoryId ),
                                    EntityCondition.makeCondition("parentProductCategoryId", EntityOperator.EQUALS, previousCategoryId)),
                                    EntityOperator.AND), null, null, null, false);
                    productCategoryRollup = EntityUtil.filterByDate(productCategoryRollup);
                    
                    if (UtilValidate.isEmpty(productCategoryRollup)) {
                        delegator.create(delegator.makeValue("ProductCategoryRollup", UtilMisc.toMap("productCategoryId", currentCategoryId, "parentProductCategoryId", previousCategoryId, "fromDate", UtilDateTime.nowTimestamp())), true);
                    }
                }
            } catch (GenericEntityException e) {
        	   Debug.logError(e.getMessage(), module);
            }
        }
        return errorMsgList;
    }

    private static void readAndImportProductData(Delegator delegator, List<String> errorMsgList) throws Exception {
        ICsvBeanReader beanReader = null;
        List<GenericValue> productList = new ArrayList <GenericValue>();
        List<GenericValue> entityDataList = new ArrayList <GenericValue>();
        Integer productPromoActionSeqId = 1;
        try  {
            List<GenericValue> productPromoActionTemp = delegator.findByAnd("ProductPromoAction", UtilMisc.toMap("productPromoId", "DISCOUNTED_PROMO", "productPromoRuleId", "01"),UtilMisc.toList("productPromoActionSeqId"), true);
            if (UtilValidate.isNotEmpty(productPromoActionTemp)) {
                productPromoActionSeqId = Integer.valueOf((String)productPromoActionTemp.get(0).get("productPromoActionSeqId")) + 1;
            }
        } catch (GenericEntityException e) {
            e.printStackTrace();
        }
        try {
            beanReader = new CsvBeanReader(new FileReader(CSV_FILENAME), CsvPreference.STANDARD_PREFERENCE);
            final String[] header = beanReader.getHeader(true);
            final CellProcessor[] processors = getProductProcessors();
            ProductImportBean product;

            while ((product = beanReader.read(ProductImportBean.class, header, processors)) != null) {
//                if (UtilValidate.isEmpty(product.getPThumbnailImageFileName()) && UtilValidate.isEmpty(product.getSKU()) ||
//                        UtilValidate.isEmpty(product.getImageFileName()) && UtilValidate.isEmpty(product.getSKU())) {
//                     errorMsgList.add("SKU and product image record can not be null for " + String.format(
//                            "lineNo=%s, rowNo=%s, customer=%s",
//                            beanReader.getLineNumber(), beanReader.getRowNumber(),
//                            product));
//                       return;
//                }
                errorMsgList.addAll(prepareProductValue(product, delegator, productList, entityDataList, productPromoActionSeqId));
                Debug.logError((String.format(
                        "lineNo=%s, rowNo=%s, customer=%s",
                        beanReader.getLineNumber(), beanReader.getRowNumber(), product)), module );
                productPromoActionSeqId ++;
            }
            storeProductValue(delegator, productList, entityDataList, errorMsgList);
        } catch(SuperCsvConstraintViolationException ex) {
            Debug.logError(ex.getMessage(), null);
            errorMsgList.add(ex.getMessage());
        }finally {
            if (beanReader != null) {
                beanReader.close();
            }
        }
    }
    
    private static List<String> prepareProductValue (ProductImportBean product, Delegator delegator, List<GenericValue> productList, List<GenericValue> entityDataList, Integer productPromoActionSeqId) {
        String productName = product.getProductName();
        String productDescription = product.getProductDescription();
        String productImageUrl = product.getProductImageFilename();
        String thumbnailImageFileName = product.getProductThumbnailURL();
        String categoryId = product.getCategoryPath();
        // TODO: Store shippingSize
        Integer shippingSize = product.getShippingSize();
        Timestamp now = UtilDateTime.nowTimestamp();
        List<String> errorMsgList = new ArrayList<String>();
        
        // category ids are splited by '/' required to identify correct.
        if (UtilValidate.isNotEmpty(categoryId)) {
            String[] categoryIds = categoryId.split("/");
            if (categoryIds.length > 1) {
                categoryId = categoryIds[categoryIds.length - 1];
                // Checking category existence.
                try {
                    GenericValue productCategory = delegator.findOne("ProductCategory", true, UtilMisc.toMap("productCategoryId", categoryId));
                       if (UtilValidate.isEmpty(productCategory)) {
                           productCategory = delegator.makeValue("ProductCategory", UtilMisc.toMap("productCategoryId", categoryId));
                       }
                       productList.add(productCategory);
                   } catch (GenericEntityException e) {
                       // TODO Auto-generated catch block
                       e.printStackTrace();
                   }
            }
        }
        // SKU or ProductName to identify product existed in the system,
        GenericValue productValue = null;
        String productId = null;
        try { /// "goodIdentificationTypeId", "SKU", "productId", productId, "idValue", sku));
            if (UtilValidate.isNotEmpty(product.getSKU())) {
                List<GenericValue> skus = delegator.findList("GoodIdentification",            
                        EntityCondition.makeCondition(UtilMisc.toList(
                        EntityCondition.makeCondition("goodIdentificationTypeId", EntityOperator.EQUALS, "SKU"),
                        EntityCondition.makeCondition("idValue", EntityOperator.EQUALS, product.getSKU())),
                        EntityOperator.AND), null, null, null, true);
                if (UtilValidate.isNotEmpty(skus)) {
                    GenericValue sku = skus.get(0);
                    if (UtilValidate.isNotEmpty(sku)) {
                        productId = sku.getString("productId");
                    }
                } 
            }
            if (UtilValidate.isEmpty(productId)) {
                List<GenericValue> products = delegator.findList("Product",            
                        EntityCondition.makeCondition(UtilMisc.toList(
                        EntityCondition.makeCondition("internalName", EntityOperator.EQUALS, productName ),
                        EntityCondition.makeCondition("productName", EntityOperator.EQUALS, productName)),
                        EntityOperator.OR)
                        , null, null, null, true);
                if (UtilValidate.isNotEmpty(products)) {
                    GenericValue prod = products.get(0);
                    if (UtilValidate.isNotEmpty(prod)) {
                        productId = prod.getString("productId");
                    }
                } 
            }
            
            if (UtilValidate.isNotEmpty(productId)) {
                productValue = delegator.findOne("Product", true, UtilMisc.toMap("productId", productId));
            } else {
                // create product        
                productId = delegator.getNextSeqId("Product");
                productValue = delegator.makeValue("Product", UtilMisc.toMap("productId", productId, "internalName", productName, "productName", 
                        productName, "longDescription", productDescription, "productTypeId", "FINISHED_GOOD", "primaryProductCategoryId", 
                        categoryId));
                productList.add(productValue);

            }
        } catch (GenericEntityException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        // Content record for images.
        if (UtilValidate.isEmpty(thumbnailImageFileName)) {
            thumbnailImageFileName = String.format("%s_1;%s_2;%s_3;%s_4;%s_5;%s_6;", product.getSKU(), product.getSKU(), product.getSKU(), product.getSKU(), 
                    product.getSKU(), product.getSKU());
        }
        int imageCounter=0;
        String[] thumbnailImages = thumbnailImageFileName.split(";");
        for (String image : thumbnailImages) {
            imageCounter++;
            GenericValue dataResource = delegator.makeValue("DataResource", 
                     UtilMisc.toMap("dataResourceId", productId+"_t_"+imageCounter, "dataResourceTypeId", "IMAGE_OBJECT", 
                     "dataTemplateTypeId", "NONE", "dataResourceName", image.substring(image.lastIndexOf("/"), image.length()-1), "objectInfo", image, "isPublic","Y" ));
            GenericValue content = delegator.makeValue("Content",
                    UtilMisc.toMap("contentId", productId+"_t"+imageCounter, "contentTypeId", "DOCUMENT", "contentName", dataResource.get("dataResourceName"),
                    "dataResourceId", dataResource.get("dataResourceId"), "statusId", "IM_APPROVED"));
            GenericValue productContent = delegator.makeValue("ProductContent", 
                    UtilMisc.toMap("contentId", content.get("contentId"), "productId", productId, "productContentTypeId", "ADDITIONAL_IMAGE_"+imageCounter, "fromDate", now));
            entityDataList.add(dataResource);
            entityDataList.add(content);
            entityDataList.add(productContent);
            if (imageCounter >= 6) break;
        }

        if (UtilValidate.isEmpty(productImageUrl)) {
            productImageUrl = String.format("%s_1;%s_2;%s_3;%s_4;%s_5;%s_6;", product.getSKU(), product.getSKU(), product.getSKU(), product.getSKU(), 
                    product.getSKU(), product.getSKU());
        }
        imageCounter=0;
        String[] productImageUrls = productImageUrl.split(";");
        for (String image : productImageUrls) {
            imageCounter++;
            GenericValue dataResource = delegator.makeValue("DataResource", 
                     UtilMisc.toMap("dataResourceId", productId+"_l"+imageCounter, "dataResourceTypeId", "IMAGE_OBJECT", 
                     "dataTemplateTypeId", "NONE", "dataResourceName", image.substring(image.lastIndexOf("/"), image.length()-1), "objectInfo", image, "isPublic","Y" ));
            GenericValue content = delegator.makeValue("Content",
                    UtilMisc.toMap("contentId", dataResource.get("dataResourceId"), "contentTypeId", "DOCUMENT", "contentName", dataResource.get("dataResourceName"),
                    "dataResourceId", dataResource.get("dataResourceId"), "statusId", "IM_APPROVED"));
            GenericValue productContent = delegator.makeValue("ProductContent", 
                    UtilMisc.toMap("contentId", content.get("contentId"), "productId", productId, "productContentTypeId", "ADDITIONAL_IMAGE_"+imageCounter, "fromDate", now));
            entityDataList.add(dataResource);
            entityDataList.add(content);
            entityDataList.add(productContent);
            if (imageCounter >= 6) break;
        }

        // create product prices
        BigDecimal listPrice = product.getListPrice();
        BigDecimal discountedPrice = product.getDiscountPrice();
        Timestamp discountPriceStartDate = product.getDiscountPriceStartDate();
        Timestamp discountPriceEndDate = product.getDiscountPriceEndDate();
        if (UtilValidate.isNotEmpty(listPrice)) {
            GenericValue productPrice = delegator.makeValue("ProductPrice", UtilMisc.toMap("productId", productId, "productPriceTypeId", "DEFAULT_PRICE", 
                    "productPricePurposeId", "PURCHASE", "currencyUomId", "NZD", "productStoreGroupId", "_NA_", "fromDate", now, "price", listPrice));
            entityDataList.add(productPrice);
        }
        if (UtilValidate.isNotEmpty(discountedPrice)) {
            if (UtilValidate.isEmpty(discountPriceStartDate)) {
                discountPriceStartDate = now;
            }
            GenericValue discountedProductPrice = delegator.makeValue("ProductPrice", UtilMisc.toMap("productId", productId, "productPriceTypeId", "SPECIAL_PROMO_PRICE", 
                    "productPricePurposeId", "PURCHASE", "currencyUomId", "NZD", "productStoreGroupId", "_NA_", "fromDate", discountPriceStartDate, "thruDate", discountPriceEndDate, "price", discountedPrice));
            entityDataList.add(discountedProductPrice);
            
            // ProductPromo 
            try {
                GenericValue productPromo = delegator.findOne("ProductPromo", true, UtilMisc.toMap("productPromoId", "DISCOUNTED_PROMO"));
                if (UtilValidate.isEmpty(productPromo)) {
                    productPromo = delegator.makeValue("ProductPromo", UtilMisc.toMap("productPromoId", "DISCOUNTED_PROMO", "promoName", "Product On Discounted Price", "userEntered","N", "showToCustomer","Y", "requireCode","N" ));
                    productList.add(productPromo);
                    // ProductPromoRule
                    GenericValue productPromoRule = delegator.makeValue("ProductPromoRule", UtilMisc.toMap("productPromoId", "DISCOUNTED_PROMO", "productPromoRuleId", "01", "ruleName","Product On Discounted Price"));
                    entityDataList.add(productPromoRule);
                }
                // ProductStorePromoAppl
                String productStoreId = null;
                List<GenericValue> productStoreFacilitys = delegator.findByAnd("ProductStoreFacility", UtilMisc.toMap("facilityId","WebStoreWarehouse"), null, true);
                productStoreFacilitys = EntityUtil.filterByDate(productStoreFacilitys, now);
                if(UtilValidate.isNotEmpty(productStoreFacilitys)) {
                    productStoreId = (String) productStoreFacilitys.get(0).get("productStoreId");
                }
                if (UtilValidate.isNotEmpty(productStoreId)) {
                    GenericValue productStorePromoAppl = delegator.makeValue("ProductStorePromoAppl", UtilMisc.toMap("productPromoId", "DISCOUNTED_PROMO", "productStoreId", productStoreId, "fromDate", now));
                    entityDataList.add(productStorePromoAppl);
                }
            } catch (GenericEntityException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

            // ProductPromoAction 
            GenericValue productPromoAction = delegator.makeValue("ProductPromoAction", UtilMisc.toMap("productPromoId", "DISCOUNTED_PROMO", "productPromoRuleId", "01", 
                    "productPromoActionSeqId", productPromoActionSeqId.toString(), "productId", productId, "productPromoActionEnumId", "PROMO_PROD_SPPRC", "orderAdjustmentTypeId", "PROMOTION_ADJUSTMENT", "useCartQuantity","N"));
            entityDataList.add(productPromoAction);
        }
        
        // associate product with category : 
        if (UtilValidate.isNotEmpty(categoryId)) {
            List<GenericValue> productCategoryMembers = null;
            try {
                productCategoryMembers = delegator.findList("ProductCategoryMember",
                        EntityCondition.makeCondition(UtilMisc.toList(
                        EntityCondition.makeCondition("productId", EntityOperator.EQUALS, productId ),
                        EntityCondition.makeCondition("productCategoryId", EntityOperator.EQUALS, categoryId)),
                        EntityOperator.AND)
                        , null, null, null, true);
            } catch (GenericEntityException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            productCategoryMembers = EntityUtil.filterByDate(productCategoryMembers);
            if (UtilValidate.isEmpty(productCategoryMembers)) {
                GenericValue productCategoryMember = delegator.makeValue("ProductCategoryMember", UtilMisc.toMap("productId", productId, "productCategoryId", categoryId, 
                    "fromDate", now));
                entityDataList.add(productCategoryMember);
            }
        }
        // create override rule.
        // create inventory record
        Integer stock = product.getStock();
        if (UtilValidate.isNotEmpty(stock)) {
            GenericValue inventoryItem = delegator.makeValue("InventoryItem", UtilMisc.toMap("inventoryItemId", delegator.getNextSeqId("InventoryItem"), 
                    "inventoryItemTypeId", "NON_SERIAL_INV_ITEM", "productId", productId, "ownerPartyId", "Company", "facilityId", "WebStoreWarehouse", "quantityOnHandTotal", BigDecimal.valueOf(stock), "availableToPromiseTotal", BigDecimal.valueOf(stock)));
            entityDataList.add(inventoryItem);
        }
        
        // create SKU
        String sku = product.getSKU();
        if (UtilValidate.isNotEmpty(sku)) {
            GenericValue goodIdentification = delegator.makeValue("GoodIdentification", UtilMisc.toMap("goodIdentificationTypeId", "SKU", "productId", productId, "idValue", sku));
            entityDataList.add(goodIdentification);
        }

        // create shipping size
        
        return errorMsgList;
    }

    public static void storeProductValue(Delegator delegator, List<GenericValue> productList, List<GenericValue> entityDataList, List<String> errorMsgList) {
        try {
            delegator.storeAll(productList, true);
            delegator.storeAll(entityDataList, true);
        } catch (GenericEntityException e) {
            errorMsgList.add(e.getMessage());
            e.printStackTrace();
        }
    }
    /*
    public static void storeProductCategoryValue(Delegator delegator, List<GenericValue> productCategoryList, List<String> errorMsgList) {
        try {
            delegator.storeAll(productCategoryList, true);
        } catch (GenericEntityException e) {
            errorMsgList.add(e.getMessage());
            e.printStackTrace();
        }
    }*/
}