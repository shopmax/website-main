import org.ofbiz.entity.condition.*;

import org.ofbiz.base.util.UtilValidate;
import org.ofbiz.entity.util.EntityUtil;
import org.ofbiz.manufacturing.jobshopmgt.ProductionRun;
import org.ofbiz.product.store.ProductStoreWorker;

def productStore = ProductStoreWorker.getProductStore(request);
context.productStoreId = productStore.productStoreId;
context.productStore = productStore;
