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
import org.ofbiz.order.order.*;
import org.ofbiz.party.party.*;
import org.ofbiz.entity.*;
import org.ofbiz.entity.util.*;
import org.ofbiz.entity.condition.*;
import org.ofbiz.entity.util.EntityUtil;
import javolution.util.FastList;

recentList = [];
pendingList = [];
processingList = [];
completedList = [];
returnedList = [];
searchResultList = [];

if (userLogin) {
    partyId = userLogin.partyId;
    roleTypeId = "BILL_TO_CUSTOMER"
    partyRole = delegator.findOne("PartyRole", [partyId : partyId, roleTypeId : "SELLER"], false);
    if (partyRole) {
        partyRelationships = delegator.findByAnd("PartyRelationship", [partyIdTo : partyId, roleTypeIdFrom : "INTERNAL_ORGANIZATIO", roleTypeIdTo : "EMPLOYEE", partyRelationshipTypeId : "EMPLOYMENT"], null, false);
        if (partyRelationships) {
            partyRelationship = EntityUtil.getFirst(partyRelationships);
            partyId = partyRelationship.partyIdFrom;
            roleTypeId = "BILL_FROM_VENDOR"
        }
    }
    
    recentOrderList = delegator.findByAnd("OrderHeaderAndRoles", [roleTypeId : roleTypeId, partyId : partyId, orderTypeId : "SALES_ORDER"], ["-orderDate"], false);
    if (recentOrderList) {
        recentOrderList.each { recentOrder ->
            orderInfoMap = [:];
            orderReadHelper = new OrderReadHelper(recentOrder);
            orderInfoMap.orderDate = recentOrder.orderDate;
            orderInfoMap.orderId = recentOrder.orderId;
            orderInfoMap.grandTotal = recentOrder.grandTotal;
            billingParty = orderReadHelper.getBillToParty();
            orderInfoMap.customerName = PartyHelper.getPartyName(billingParty);
            orderInfoMap.statusId = recentOrder.statusId;
            recentList.add(orderInfoMap);
        }
    }
    
    pendingOrderList = delegator.findByAnd("OrderHeaderAndRoles", [roleTypeId : roleTypeId, partyId : partyId, orderTypeId : "SALES_ORDER", statusId : "ORDER_CREATED"], ["-orderDate"], false);
    if (pendingOrderList) {
        pendingOrderList.each { pendingOrder ->
            orderInfoMap = [:];
            orderReadHelper = new OrderReadHelper(pendingOrder);
            orderInfoMap.orderDate = pendingOrder.orderDate;
            orderInfoMap.orderId = pendingOrder.orderId;
            orderInfoMap.grandTotal = pendingOrder.grandTotal;
            billingParty = orderReadHelper.getBillToParty();
            orderInfoMap.customerName = PartyHelper.getPartyName(billingParty);
            orderInfoMap.statusId = pendingOrder.statusId;
            pendingList.add(orderInfoMap);
        }
    }
    
    processingOrderList = delegator.findByAnd("OrderHeaderAndRoles", [roleTypeId : roleTypeId, partyId : partyId, orderTypeId : "SALES_ORDER", statusId : "ORDER_APPROVED"], ["-orderDate"], false);
    if (processingOrderList) {
        processingOrderList.each { processingOrder ->
            orderInfoMap = [:];
            orderReadHelper = new OrderReadHelper(processingOrder);
            orderInfoMap.orderDate = processingOrder.orderDate;
            orderInfoMap.orderId = processingOrder.orderId;
            orderInfoMap.grandTotal = processingOrder.grandTotal;
            billingParty = orderReadHelper.getBillToParty();
            orderInfoMap.customerName = PartyHelper.getPartyName(billingParty);
            orderInfoMap.statusId = processingOrder.statusId;
            processingList.add(orderInfoMap);
        }
    }
    
    completedOrderList = delegator.findByAnd("OrderHeaderAndRoles", [roleTypeId : roleTypeId, partyId : partyId, orderTypeId : "SALES_ORDER", statusId : "ORDER_COMPLETED"], ["-orderDate"], false);
    if (completedOrderList) {
        completedOrderList.each { completedOrder ->
            orderInfoMap = [:];
            orderReadHelper = new OrderReadHelper(completedOrder);
            orderInfoMap.orderDate = completedOrder.orderDate;
            orderInfoMap.orderId = completedOrder.orderId;
            orderInfoMap.grandTotal = completedOrder.grandTotal;
            billingParty = orderReadHelper.getBillToParty();
            orderInfoMap.customerName = PartyHelper.getPartyName(billingParty);
            orderInfoMap.statusId = completedOrder.statusId;
            completedList.add(orderInfoMap);
        }
    }
    
    if (roleTypeId == "BILL_TO_CUSTOMER") {
        returnHeaders = delegator.findByAnd("ReturnHeader", [fromPartyId : partyId], ["-entryDate"], false);
    } else {
        returnHeaders = delegator.findByAnd("ReturnHeader", [toPartyId : partyId], ["-entryDate"], false);
    }
    if (returnHeaders) {
        returnHeaders.each { returnHeader ->
            returnItems = delegator.findByAnd("ReturnItem", [returnId : returnHeader.returnId], false);
            if (returnItems) {
                returnItems.each { returnItem ->
                    returnInfoMap = [:];
                    orderHeader = delegator.findOne("OrderHeader", [orderId : returnItem.orderId], false);
                    orderReadHelper = new OrderReadHelper(orderHeader);
                    returnInfoMap.orderDate = returnHeader.entryDate;
                    returnInfoMap.orderId = returnItem.orderId;
                    returnInfoMap.returnTotal = returnItem.returnQuantity * returnItem.returnPrice;
                    billingParty = orderReadHelper.getBillToParty();
                    returnInfoMap.customerName = PartyHelper.getPartyName(billingParty);
                    returnInfoMap.statusId = returnItem.statusId;
                    returnedList.add(returnInfoMap);
                }
            }
        }
    }
    
    /*if (searchOrderId) {
        orderHeader = delegator.findOne("OrderHeader", [orderId : searchOrderId], false);
        orderInfoMap = [:];
        orderReadHelper = new OrderReadHelper(orderHeader);
        orderInfoMap.orderDate = orderHeader.orderDate;
        orderInfoMap.orderId = orderHeader.orderId;
        orderInfoMap.grandTotal = orderHeader.grandTotal;
        billingParty = orderReadHelper.getBillToParty();
        orderInfoMap.customerName = PartyHelper.getPartyName(billingParty);
        orderInfoMap.statusId = orderHeader.statusId;
        searchResultList.add(orderInfoMap);
    } else {
        
    }*/
    
    context.recentOrderList = recentList;
    context.pendingOrderList = pendingList;
    context.processingOrderList = processingList;
    context.completedOrderList = completedList;
    context.returnedOrderList = returnedList;
    context.searchResultOrderList = searchResultList;
}
