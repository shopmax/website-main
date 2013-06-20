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

import org.ofbiz.entity.condition.*;
import org.ofbiz.entity.util.*;

def supplierOrderItemsMap = [:];

def getSupplierName(partyId) {
    def getPartyNameForDateInMap = ["partyId": partyId, "userLogin": delegator.findOne("UserLogin", ["userLoginId": "system"], false)];
    def results = dispatcher.runSync("getPartyNameForDate", getPartyNameForDateInMap);
    def fullName = results.fullName;
    return fullName;
}

def getSupplierOrderItems(partyId, supplierOrderItemsMap) {
    def supplierOrderItems = null;
    if (supplierOrderItemsMap.containsKey(partyId)) {
        supplierOrderItems = supplierOrderItemsMap[partyId];
    } else {
        supplierOrderItems = [];
        supplierOrderItemsMap.put(partyId, supplierOrderItems);
    }
    return supplierOrderItems;
}

//Get Order Items

if(orderItems) {
    orderItems.each { orderItem ->
        def product = orderItem.getRelatedOne("Product", false);
        def productPrices = product.getRelated("ProductPrice", null, null, false);
        
        def conds = [];
        conds.add(EntityCondition.makeCondition("productId", product.productId))
        
        if (productPrices) {
            conds.add(EntityCondition.makeCondition("currencyUomId", productPrices[0].currencyUomId));
        }
        conds.add(EntityUtil.getFilterByDateExpr("availableFromDate", "availableThruDate"))
        def supplierProducts = delegator.findList("SupplierProduct", EntityCondition.makeCondition(conds), null, null, null, false);
        if (supplierProducts) {
            def partyId = supplierProducts[0].partyId;
            def supplierOrderItems = getSupplierOrderItems(partyId, supplierOrderItemsMap);
            supplierOrderItems.add(orderItem);
        }
        
    }
}

if(parameters.scBranchStoreList){
    branchStoreDetailLists = parameters.scBranchStoreList;
    branchStoreList = [];
    for(branchStoreDetailList in branchStoreDetailLists) {
        branchStoreDetail = branchStoreDetailList.split("-");
        branchStoreDetailMap = [:];
        branchStoreDetailMap.typeShipping = branchStoreDetail[0];
        branchStoreDetailMap.contactMechId = branchStoreDetail[1];
        branchStoreDetailMap.shopPartyId = branchStoreDetail[2];
        branchStoreList.add(branchStoreDetailMap);
    }
    context.branchStoreList = branchStoreList;
}
if(parameters.scBranchStores){
	branchStoreList = [];
    branchStoreDetailLists = parameters.scBranchStores;
    branchStoreDetail = branchStoreDetailLists.split("-");
    branchStoreDetailMap = [:];
    branchStoreDetailMap.typeShipping = branchStoreDetail[0];
    branchStoreDetailMap.contactMechId = branchStoreDetail[1];
    branchStoreDetailMap.shopPartyId = branchStoreDetail[2];
    branchStoreList.add(branchStoreDetailMap);
    context.branchStoreList = branchStoreList;
}

context.supplierOrderItemsMap = supplierOrderItemsMap;
context.orderContext = this;
