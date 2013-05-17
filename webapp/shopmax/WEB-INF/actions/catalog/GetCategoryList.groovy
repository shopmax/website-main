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

import java.io.ObjectOutputStream.DebugTraceInfoStack;
import java.security.Policy.Parameters;
import org.ofbiz.product.catalog.*;
import org.ofbiz.product.category.*;

tenantId = delegator.getDelegatorTenantId();

if (tenantId == "default" || tenantId == "shopmax" || tenantId == null) {
    CategoryWorker.getRelatedCategories(request, "subLevelList", parameters.parentProductCategoryId, true, false);
    categoryList = request.getAttribute("subLevelList");
    context.categoryList = categoryList;
}
else {
    CategoryWorker.getRelatedCategories(request, "subLevelList", parameters.parentProductCategoryId, true, false);
    categoryList = request.getAttribute("subLevelList");
    context.categoryList = categoryList;
    //categoryList = org.ofbiz.shopmax.product.category.CategoryWorker.getRelatedValidCategoriesRet(delegator, "subLevelList", CatalogWorker.getCatalogTopCategoryId(request, CatalogWorker.getCurrentCatalogId(request)), true, true, false);
    //context.categoryList = categoryList;
}
