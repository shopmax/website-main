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

import org.ofbiz.order.shoppingcart.shipping.*;

def getShipmentCarriers(carrierShipmentMethodList) {
    def shipmentCarrierMap = [:];
    for (carrierShipmentMethod in carrierShipmentMethodList) {
        if (!shipmentCarrierMap.containsKey(carrierShipmentMethod.partyId)) {
            def partyNameView = delegator.findOne("PartyNameView", ["partyId": carrierShipmentMethod.partyId], false);
            shipmentCarrierMap.put(carrierShipmentMethod.partyId, partyNameView);
        }
    }
    return shipmentCarrierMap.values();
}

def getShipmentMethodTypes(carrierShipmentMethodList) {
    def shipmentMethodTypeMap = [:];
    for (carrierShipmentMethod in carrierShipmentMethodList) {
        if (!shipmentMethodTypeMap.containsKey(carrierShipmentMethod.shipmentMethodTypeId)) {
            shipmentMethodTypeMap.put(carrierShipmentMethod.shipmentMethodTypeId, carrierShipmentMethod);
        }
    }
    return shipmentMethodTypeMap.values();
}

cart = session.getAttribute("shoppingCart");

if (cart) {
    shippingEstWpr = new ShippingEstimateWrapper(dispatcher, cart, 0);
    context.shippingEstWpr = shippingEstWpr;
    def carrierShipmentMethodList = shippingEstWpr.getShippingMethods();
    context.shipmentCarriers = getShipmentCarriers(carrierShipmentMethodList);
    context.shipmentMethodTypes = getShipmentMethodTypes(carrierShipmentMethodList);
}
