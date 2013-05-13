/*******************************************************************************
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
 *******************************************************************************/
package org.ofbiz.shopmax.product.category;

import java.util.LinkedList;
import java.util.List;

import javolution.util.FastList;

import org.ofbiz.base.util.Debug;
import org.ofbiz.base.util.UtilMisc;
import org.ofbiz.base.util.UtilValidate;
import org.ofbiz.entity.Delegator;
import org.ofbiz.entity.GenericEntityException;
import org.ofbiz.entity.GenericValue;
import org.ofbiz.entity.condition.EntityCondition;
import org.ofbiz.entity.util.EntityUtil;



public class CategoryWorker {

    public final static String module = CategoryWorker.class.getName();
    
    public static List<GenericValue> getRelatedValidCategoriesRet(Delegator delegator, String attributeName, String parentId, boolean limitView, boolean excludeEmpty, boolean recursive) {
        List<GenericValue> categories = FastList.newInstance();

        if (Debug.verboseOn()) Debug.logVerbose("[CategoryWorker.getRelatedCategories] ParentID: " + parentId, module);

        List<GenericValue> rollups = null;

        try {
            rollups = delegator.findByAnd("ProductCategoryRollup",
                        UtilMisc.toMap("parentProductCategoryId", parentId),
                        UtilMisc.toList("sequenceNum"), true);
            if (limitView) {
                rollups = EntityUtil.filterByDate(rollups, true);
            }
        } catch (GenericEntityException e) {
            Debug.logWarning(e.getMessage(), module);
        }
        if (rollups != null) {
            // Debug.logInfo("Rollup size: " + rollups.size(), module);
            for (GenericValue parent: rollups) {
                // Debug.logInfo("Adding child of: " + parent.getString("parentProductCategoryId"), module);
                GenericValue cv = null;

                try {
                    cv = parent.getRelatedOne("CurrentProductCategory", true);
                } catch (GenericEntityException e) {
                    Debug.logWarning(e.getMessage(), module);
                }
                if (cv != null) {
                    if (excludeEmpty) {
                        if (!org.ofbiz.product.category.CategoryWorker.isCategoryEmpty(cv)) {
                            //Debug.logInfo("Child : " + cv.getString("productCategoryId") + " is not empty.", module);
                            if (containsProduct(cv, delegator)) {
                                categories.add(cv);
                            }
                            if (recursive) {
                                categories.addAll(getRelatedValidCategoriesRet(delegator, attributeName, cv.getString("productCategoryId"), limitView, excludeEmpty, recursive));
                            }
                        }
                    } else {
                        if (containsProduct(cv, delegator)) {
                            categories.add(cv);
                        }
                        if (recursive) {
                            categories.addAll(getRelatedValidCategoriesRet(delegator, attributeName, cv.getString("productCategoryId"), limitView, excludeEmpty, recursive));
                        }
                    }
                }
            }
        }
        return categories;
    }
    
    public static boolean containsProduct(GenericValue productCategory, Delegator delegator) {
        try {            List<EntityCondition> conds = new LinkedList<EntityCondition>();
            conds.add(EntityCondition.makeCondition("productCategoryId", productCategory.getString("productCategoryId")));
            conds.add(EntityUtil.getFilterByDateExpr());
            List<GenericValue> productCategoryMembers = delegator.findList("ProductCategoryMember", EntityCondition.makeCondition(conds), null, null, null, false);
            if (UtilValidate.isNotEmpty(productCategoryMembers)) {
                return true;
            } else {
                List<EntityCondition> rollupConds = new LinkedList<EntityCondition>();
                rollupConds.add(EntityCondition.makeCondition("parentProductCategoryId", productCategory.getString("productCategoryId")));
                rollupConds.add(EntityUtil.getFilterByDateExpr());
                List<GenericValue> productCategoryRollups = delegator.findList("ProductCategoryRollup", EntityCondition.makeCondition(rollupConds), null, null, null, false);
                
                for (GenericValue productCategoryRollup : productCategoryRollups) {
                    GenericValue currentProductCategory = productCategoryRollup.getRelatedOne("CurrentProductCategory", false);
                    if (containsProduct(currentProductCategory, delegator)) {
                        return true;
                    }
                }
                return false;
            }
        } catch (GenericEntityException e) {
            Debug.logError(e, module);
            return false;
        }
    }

}
