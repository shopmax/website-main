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
import org.ofbiz.entity.util.*;
import org.ofbiz.product.catalog.*;
import org.ofbiz.product.category.*;
import javolution.util.FastMap;

breadcrumbTitle = parameters.breadcrumbTitle;
productCategoryId = parameters.productCategoryId;

if (breadcrumbTitle) {
    context.breadcrumbTitle = breadcrumbTitle;
} else {
    categoryList = [];
    if (productCategoryId) {
        getParentCategory(productCategoryId);
        context.categoryBreadcrumbList = categoryList;
    }
    
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
