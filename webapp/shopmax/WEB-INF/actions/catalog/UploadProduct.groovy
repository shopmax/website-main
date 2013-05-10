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

CategoryWorker.getRelatedCategories(request, "topLevelList", CatalogWorker.getCatalogTopCategoryId(request, CatalogWorker.getCurrentCatalogId(request)), true);
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
