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

import java.math.BigDecimal;
import java.util.*;
import java.sql.Timestamp;
import org.ofbiz.entity.*;
import org.ofbiz.entity.condition.*;
import org.ofbiz.entity.util.*;
import org.ofbiz.base.util.*;
import org.ofbiz.base.util.collections.*;
import org.ofbiz.order.order.*;
import org.ofbiz.party.party.*;
import org.ofbiz.party.contact.*;
import org.ofbiz.product.inventory.InventoryWorker;
import org.ofbiz.product.catalog.CatalogWorker;
import org.ofbiz.accounting.payment.*;

import javolution.util.FastMap;

orderId = parameters.orderId;
context.orderId = orderId;

if (orderId) {
    orderHeader = delegator.findOne("OrderHeader", [orderId : orderId], false);
    
    if (orderHeader) {
        orderReadHelper = new OrderReadHelper(orderHeader);
        orderItems = orderReadHelper.getOrderItems();
        orderAdjustments = orderReadHelper.getAdjustments();
        orderHeaderAdjustments = orderReadHelper.getOrderHeaderAdjustments();
        orderSubTotal = orderReadHelper.getOrderItemsSubTotal();
        orderTerms = orderHeader.getRelated("OrderTerm", null, null, false);
        
        context.orderHeader = orderHeader;
        context.orderReadHelper = orderReadHelper;
        context.orderItems = orderItems;
        context.orderAdjustments = orderAdjustments;
        context.orderHeaderAdjustments = orderHeaderAdjustments;
        context.orderSubTotal = orderSubTotal;
        context.currencyUomId = orderReadHelper.getCurrency();
        context.orderTerms = orderTerms;
        
        orderParty = orderReadHelper.getPlacingParty();
        customerName = PartyHelper.getPartyName(orderParty);
        context.customerName = customerName;
        
        billingAddress = orderReadHelper.getBillingAddress();
        context.billingAddress = billingAddress;
        
        shippingAddress = orderReadHelper.getShippingAddress();
        context.shippingAddress = shippingAddress;
        
        emailAddress = orderReadHelper.getOrderEmailString();
        context.emailAddress = emailAddress;
        
        canceledPromoOrderItem = [:];
        orderItemList = orderReadHelper.getOrderItems();
        orderItemList.each { orderItem ->
            if("Y".equals(orderItem.get("isPromo")) && "ITEM_CANCELLED".equals(orderItem.get("statusId"))) {
                canceledPromoOrderItem = orderItem;
            }
            orderItemList.remove(canceledPromoOrderItem);
        }
        context.orderItemList = orderItemList;
        
        grandTotal = OrderReadHelper.getOrderGrandTotal(orderItems, orderAdjustments);
        context.grandTotal = grandTotal;
        
        shippingAmount = OrderReadHelper.getAllOrderItemsAdjustmentsTotal(orderItems, orderAdjustments, false, false, true);
        shippingAmount = shippingAmount.add(OrderReadHelper.calcOrderAdjustments(orderHeaderAdjustments, orderSubTotal, false, false, true));
        context.shippingAmount = shippingAmount;
        
        shipGroup = EntityUtil.getFirst(delegator.findByAnd("OrderItemShipGroup", [orderId : orderId], ["shipGroupSeqId"], false));
        context.shipGroup = shipGroup;
    }
}
