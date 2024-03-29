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
package org.ofbiz.shopmax.order.shoppingcart;

import java.util.Enumeration;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.ofbiz.base.util.StringUtil;
import org.ofbiz.base.util.UtilGenerics;
import org.ofbiz.base.util.UtilHttp;
import org.ofbiz.base.util.UtilValidate;
import org.ofbiz.entity.Delegator;
import org.ofbiz.entity.GenericValue;
import org.ofbiz.entity.condition.EntityCondition;
import org.ofbiz.entity.util.EntityUtil;
import org.ofbiz.order.shoppingcart.ShoppingCart;
import org.ofbiz.order.shoppingcart.ShoppingCartItem;
import org.ofbiz.service.DispatchContext;
import org.ofbiz.service.ServiceUtil;

public class ShoppingCartServices {

    public final static String module = ShoppingCartServices.class.getName();

    public static Map<String, Object> getSupplierShoppingCartItemsMap(DispatchContext ctx, Map<String, ? extends Object> context) {
        Delegator delegator = ctx.getDelegator();
        ShoppingCart shoppingCart = UtilGenerics.cast(context.get("shoppingCart"));
        
        String MAP_KEY = "SUPPLIER_SHOPPING_CART_ITEMS_MAP";
        
        try {
            // prepare Map
            Map<String, List<ShoppingCartItem>> supplierShoppingCartItemsMap = UtilGenerics.cast(shoppingCart.getAttribute(MAP_KEY));
            if (UtilValidate.isEmpty(supplierShoppingCartItemsMap)) {
                supplierShoppingCartItemsMap = new LinkedHashMap<String, List<ShoppingCartItem>>();
                shoppingCart.setAttribute(MAP_KEY, supplierShoppingCartItemsMap);
            } else {
                supplierShoppingCartItemsMap.clear();
            }
            
            // find shopping cart items per supplier
            List<ShoppingCartItem> shoppingCartItems = shoppingCart.items();
            for (ShoppingCartItem shoppingCartItem : shoppingCartItems) {
                List<EntityCondition> conds = new LinkedList<EntityCondition>();
                conds.add(EntityCondition.makeCondition("productId", shoppingCartItem.getProductId()));
                conds.add(EntityCondition.makeCondition("currencyUomId", shoppingCart.getCurrency()));
                conds.add(EntityUtil.getFilterByDateExpr("availableFromDate", "availableThruDate"));
                List<GenericValue> supplierProducts = delegator.findList("SupplierProduct", EntityCondition.makeCondition(conds), null, null, null, false);
                if (UtilValidate.isNotEmpty(supplierProducts)) {
                    GenericValue supplierProduct = EntityUtil.getFirst(supplierProducts);
                    String partyId = supplierProduct.getString("partyId");
                    
                    List<ShoppingCartItem> supplierShoppingCartItems = UtilGenerics.cast(supplierShoppingCartItemsMap.get(partyId));
                    if (UtilValidate.isEmpty(supplierShoppingCartItems)) {
                        supplierShoppingCartItems = new LinkedList<ShoppingCartItem>();
                        supplierShoppingCartItemsMap.put(partyId, supplierShoppingCartItems);
                    }
                    
                    supplierShoppingCartItems.add(shoppingCartItem);
                }
            }
            Map<String, Object> results = ServiceUtil.returnSuccess();
            results.put("supplierShoppingCartItemsMap", supplierShoppingCartItemsMap);
            return results;
        } catch (Exception e) {
            return ServiceUtil.returnError(e.getMessage());
        }
    }

    public static Map<String, Object> getSupplierCarrierShippingMethodTypeMap(DispatchContext ctx, Map<String, ? extends Object> context) {
        HttpServletRequest request = UtilGenerics.cast(context.get("request"));
        
        Set<String> supplierPartyIds = new HashSet<String>();
        Map<String, String> supplierCarrierMap = new LinkedHashMap<String, String>();
        Map<String, String> supplierShipmentMethodTypeMap = new LinkedHashMap<String, String>();
        
        int rowCount = UtilHttp.getMultiFormRowCount(request);
        for (int i = 0; i < rowCount; i++) {
            Enumeration<String> parameterNames = UtilGenerics.cast(request.getParameterNames());
            while(parameterNames.hasMoreElements()) {
                String parameterName = parameterNames.nextElement();
                if (parameterName.contains(":")) {
                    List<String> tokens = StringUtil.split(parameterName, ":");
                    String paramName = tokens.get(0);
                    String paramSuffix = tokens.get(1);
                    String partyId = paramSuffix.substring(0, paramSuffix.indexOf(UtilHttp.MULTI_ROW_DELIMITER));
                    supplierPartyIds.add(partyId);
                    
                    if ("shipmentCarrierPartyId".equals(paramName)) {
                        String carrierPartyId = request.getParameter(parameterName);
                        supplierCarrierMap.put(partyId, carrierPartyId);
                    } else if ("shipmentMethodTypeId".equals(paramName)) {
                        String shipmentMethodTypeId = request.getParameter(parameterName);
                        supplierShipmentMethodTypeMap.put(partyId, shipmentMethodTypeId);
                    }
                }
            }
        }
        
        Map<String, Object> results = ServiceUtil.returnSuccess();
        results.put("supplierPartyIds", supplierPartyIds);
        results.put("supplierCarrierMap", supplierCarrierMap);
        results.put("supplierShipmentMethodTypeMap", supplierShipmentMethodTypeMap);
        return results;
    }
}
