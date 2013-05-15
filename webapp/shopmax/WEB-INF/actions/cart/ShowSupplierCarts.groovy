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
import org.ofbiz.order.shoppingcart.ShoppingCartEvents;

def supplierCartItemsMap = [:];

def getSupplierName(partyId) {
    def getPartyNameForDateInMap = ["partyId": partyId, "userLogin": delegator.findOne("UserLogin", ["userLoginId": "system"], false)];
    def results = dispatcher.runSync("getPartyNameForDate", getPartyNameForDateInMap);
    def fullName = results.fullName;
    return fullName;
}

def getSupplierCartItems(partyId, supplierCartItemsMap) {
    def supplierCartItems = null;
    if (supplierCartItemsMap.containsKey(partyId)) {
        supplierCartItems = supplierCartItemsMap[partyId];
    } else {
        supplierCartItems = [];
        supplierCartItemsMap.put(partyId, supplierCartItems);
    }
    return supplierCartItems;
}

def shoppingCart = ShoppingCartEvents.getCartObject(request);

//Get Cart Items
shoppingCartItems = shoppingCart.items();

if(shoppingCartItems) {
    shoppingCartItems.each { shoppingCartItem ->
        def productId = shoppingCartItem.getProductId();
        
        def conds = [];
        conds.add(EntityCondition.makeCondition("productId", productId))
        conds.add(EntityCondition.makeCondition("currencyUomId", shoppingCart.getCurrency()))
        conds.add(EntityUtil.getFilterByDateExpr("availableFromDate", "availableThruDate"))
        def supplierProducts = delegator.findList("SupplierProduct", EntityCondition.makeCondition(conds), null, null, null, false);
        if (supplierProducts) {
            def partyId = supplierProducts[0].partyId;
            def supplierCartItems = getSupplierCartItems(partyId, supplierCartItemsMap);
            supplierCartItems.add(shoppingCartItem);
        }
        
    }
}

context.supplierCartItemsMap = supplierCartItemsMap;
context.cartContext = this;
