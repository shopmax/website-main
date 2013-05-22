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
package org.ofbiz.shopmax.order;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;
import java.util.concurrent.Callable;

import javax.transaction.Transaction;

import javolution.util.FastList;
import javolution.util.FastMap;
import javolution.util.FastSet;

import org.ofbiz.base.util.Debug;
import org.ofbiz.base.util.GeneralException;
import org.ofbiz.base.util.GeneralRuntimeException;
import org.ofbiz.base.util.ObjectType;
import org.ofbiz.base.util.UtilDateTime;
import org.ofbiz.base.util.UtilFormatOut;
import org.ofbiz.base.util.UtilGenerics;
import org.ofbiz.base.util.UtilMisc;
import org.ofbiz.base.util.UtilNumber;
import org.ofbiz.base.util.UtilProperties;
import org.ofbiz.base.util.UtilValidate;
import org.ofbiz.common.DataModelConstants;
import org.ofbiz.entity.Delegator;
import org.ofbiz.entity.DelegatorFactory;
import org.ofbiz.entity.GenericEntity;
import org.ofbiz.entity.GenericEntityException;
import org.ofbiz.entity.GenericValue;
import org.ofbiz.entity.condition.EntityCondition;
import org.ofbiz.entity.condition.EntityConditionList;
import org.ofbiz.entity.condition.EntityExpr;
import org.ofbiz.entity.condition.EntityOperator;
import org.ofbiz.entity.transaction.GenericTransactionException;
import org.ofbiz.entity.transaction.TransactionUtil;
import org.ofbiz.entity.util.EntityFindOptions;
import org.ofbiz.entity.util.EntityListIterator;
import org.ofbiz.entity.util.EntityTypeUtil;
import org.ofbiz.entity.util.EntityUtil;
import org.ofbiz.order.order.OrderReadHelper;
import org.ofbiz.order.shoppingcart.CartItemModifyException;
import org.ofbiz.order.shoppingcart.CheckOutHelper;
import org.ofbiz.order.shoppingcart.ItemNotFoundException;
import org.ofbiz.order.shoppingcart.ShoppingCart;
import org.ofbiz.order.shoppingcart.ShoppingCartItem;
import org.ofbiz.order.shoppingcart.product.ProductPromoWorker;
import org.ofbiz.order.shoppingcart.shipping.ShippingEvents;
import org.ofbiz.party.contact.ContactHelper;
import org.ofbiz.party.contact.ContactMechWorker;
import org.ofbiz.party.party.PartyWorker;
import org.ofbiz.product.product.ProductWorker;
import org.ofbiz.product.store.ProductStoreWorker;
import org.ofbiz.security.Security;
import org.ofbiz.service.DispatchContext;
import org.ofbiz.service.GenericServiceException;
import org.ofbiz.service.LocalDispatcher;
import org.ofbiz.service.ModelService;
import org.ofbiz.service.ServiceContainer;
import org.ofbiz.service.ServiceUtil;

import com.ibm.icu.util.Calendar;

/**
 * Order Processing Services
 */

public class OrderServices {

    public static final String module = OrderServices.class.getName();
    public static final String resource = "OrderUiLabels";
    public static final String resource_error = "OrderErrorUiLabels";
    public static final String resourceProduct = "ProductUiLabels";
    
    public static Map<String, String> salesAttributeRoleMap = FastMap.newInstance();
    public static Map<String, String> purchaseAttributeRoleMap = FastMap.newInstance();
    static {
        salesAttributeRoleMap.put("placingCustomerPartyId", "PLACING_CUSTOMER");
        salesAttributeRoleMap.put("billToCustomerPartyId", "BILL_TO_CUSTOMER");
        salesAttributeRoleMap.put("billFromVendorPartyId", "BILL_FROM_VENDOR");
        salesAttributeRoleMap.put("shipToCustomerPartyId", "SHIP_TO_CUSTOMER");
        salesAttributeRoleMap.put("endUserCustomerPartyId", "END_USER_CUSTOMER");
        
        purchaseAttributeRoleMap.put("billToCustomerPartyId", "BILL_TO_CUSTOMER");
        purchaseAttributeRoleMap.put("billFromVendorPartyId", "BILL_FROM_VENDOR");
        purchaseAttributeRoleMap.put("shipFromVendorPartyId", "SHIP_FROM_VENDOR");
        purchaseAttributeRoleMap.put("supplierAgentPartyId", "SUPPLIER_AGENT");
    }
    public static final int taxDecimals = UtilNumber.getBigDecimalScale("salestax.calc.decimals");
    public static final int taxRounding = UtilNumber.getBigDecimalRoundingMode("salestax.rounding");
    public static final int orderDecimals = UtilNumber.getBigDecimalScale("order.decimals");
    public static final int orderRounding = UtilNumber.getBigDecimalRoundingMode("order.rounding");
    public static final BigDecimal ZERO = BigDecimal.ZERO.setScale(taxDecimals, taxRounding);
    
    public static Map<String, Object> checkCreateDropShipPurchaseOrders(DispatchContext ctx, Map<String, ? extends Object> context) {
        Delegator delegator = ctx.getDelegator();
        LocalDispatcher dispatcher = ctx.getDispatcher();
        // TODO (use the "system" user)
        GenericValue userLogin = (GenericValue) context.get("userLogin");
        String orderId = (String) context.get("orderId");
        Locale locale = (Locale) context.get("locale");
        OrderReadHelper orh = new OrderReadHelper(delegator, orderId);
        // TODO: skip this if there is already a purchase order associated with the sales order (ship group)
        try {
            // if sales order
            if ("SALES_ORDER".equals(orh.getOrderTypeId())) {
                // get the order's ship groups
                for(GenericValue shipGroup : orh.getOrderItemShipGroups()) {
                    if (!UtilValidate.isEmpty(shipGroup.getString("supplierPartyId"))) {
                        // This ship group is a drop shipment: we create a purchase order for it
                        String supplierPartyId = shipGroup.getString("supplierPartyId");
                        // create the cart
                        ShoppingCart cart = new ShoppingCart(delegator, orh.getProductStoreId(), null, orh.getCurrency());
                        cart.setOrderType("PURCHASE_ORDER");
                        cart.setBillToCustomerPartyId(cart.getBillFromVendorPartyId()); //Company
                        cart.setBillFromVendorPartyId(supplierPartyId);
                        cart.setOrderPartyId(supplierPartyId);
                        // Get the items associated to it and create po
                        List<GenericValue> items = orh.getValidOrderItems(shipGroup.getString("shipGroupSeqId"));
                        if (!UtilValidate.isEmpty(items)) {
                            for(GenericValue item : items) {
                                try {
                                    int itemIndex = cart.addOrIncreaseItem(item.getString("productId"),
                                                                           null, // amount
                                                                           item.getBigDecimal("quantity"),
                                                                           null, null, null, // reserv
                                                                           item.getTimestamp("shipBeforeDate"),
                                                                           item.getTimestamp("shipAfterDate"),
                                                                           null, null, null,
                                                                           null, null, null,
                                                                           null, dispatcher);
                                    ShoppingCartItem sci = cart.findCartItem(itemIndex);
                                    sci.setAssociatedOrderId(orderId);
                                    sci.setAssociatedOrderItemSeqId(item.getString("orderItemSeqId"));
                                    sci.setOrderItemAssocTypeId("DROP_SHIPMENT");
                                } catch (Exception e) {
                                    return ServiceUtil.returnError(UtilProperties.getMessage(resource, 
                                            "OrderOrderCreatingDropShipmentsError", 
                                            UtilMisc.toMap("orderId", orderId, "errorString", e.getMessage()),
                                            locale));
                                }
                            }
                        }
                        // If there are indeed items to drop ship, then create the purchase order
                        if (!UtilValidate.isEmpty(cart.items())) {
                            // set checkout options
                            cart.setDefaultCheckoutOptions(dispatcher);
                            // the shipping address is the one of the customer
                            cart.setAllShippingContactMechId(shipGroup.getString("contactMechId"));
                            // associate ship groups of sales and purchase orders
                            ShoppingCart.CartShipInfo cartShipInfo = cart.getShipGroups().get(0);
                            cartShipInfo.setAssociatedShipGroupSeqId(shipGroup.getString("shipGroupSeqId"));
                            // create the order
                            CheckOutHelper coh = new CheckOutHelper(dispatcher, delegator, cart);
                            coh.createOrder(userLogin);
                            dispatcher.runAsync("createSaleOrderToSeller", UtilMisc.toMap("orderId", orderId, "userLogin", userLogin));
                        } else {
                            // if there are no items to drop ship, then clear out the supplier partyId
                            Debug.logWarning("No drop ship items found for order [" + shipGroup.getString("orderId") + "] and ship group [" + shipGroup.getString("shipGroupSeqId") + "] and supplier party [" + shipGroup.getString("supplierPartyId") + "].  Supplier party information will be cleared for this ship group", module);
                            shipGroup.set("supplierPartyId", null);
                            shipGroup.store();
                        }
                    }
                }
            }
        } catch (Exception exc) {
            // TODO: imporve error handling
            return ServiceUtil.returnError(UtilProperties.getMessage(resource, 
                    "OrderOrderCreatingDropShipmentsError", 
                    UtilMisc.toMap("orderId", orderId, "errorString", exc.getMessage()),
                    locale));
        }
        return ServiceUtil.returnSuccess();
    }
    
    public static Map<String, Object> createSaleOrderToSeller(DispatchContext ctx, Map<String, ? extends Object> context) {
        Delegator delegator = ctx.getDelegator();
        LocalDispatcher dispatcher = ctx.getDispatcher();
        Map<String, Object> successResult = ServiceUtil.returnSuccess();
        // TODO (use the "system" user)
        GenericValue userLogin = (GenericValue) context.get("userLogin");
        String orderId = (String) context.get("orderId");
        Locale locale = (Locale) context.get("locale");
        OrderReadHelper orh = new OrderReadHelper(delegator, orderId);
        GenericValue billingParty = orh.getBillToParty();
        String billingPartyId = billingParty.getString("partyId");
        String tenantId = null;
        try {
            // if sales order
            if ("SALES_ORDER".equals(orh.getOrderTypeId())) {
                // get the order's ship groups
                for(GenericValue shipGroup : orh.getOrderItemShipGroups()) {
                    if (!UtilValidate.isEmpty(shipGroup.getString("supplierPartyId"))) {
                        String supplierPartyId = shipGroup.getString("supplierPartyId");
                        GenericValue partyRelationship = EntityUtil.getFirst(EntityUtil.filterByDate(delegator.findByAnd("PartyRelationship", UtilMisc.toMap("partyIdFrom", supplierPartyId, "roleTypeIdFrom", "INTERNAL_ORGANIZATIO", "roleTypeIdTo", "EMPLOYEE", "partyRelationshipTypeId", "EMPLOYMENT"), null, true), true));
                        tenantId = partyRelationship.getString("partyIdTo");
                        // create the cart
                        ShoppingCart cart = new ShoppingCart(delegator, orh.getProductStoreId(), null, orh.getCurrency());
                        cart.setOrderType("SALES_ORDER");
                        cart.setBillToCustomerPartyId(billingPartyId);
                        cart.setBillFromVendorPartyId(supplierPartyId);
                        cart.setOrderPartyId(supplierPartyId);
                        // Get the items associated to it and create order
                        List<GenericValue> items = orh.getValidOrderItems(shipGroup.getString("shipGroupSeqId"));
                        if (!UtilValidate.isEmpty(items)) {
                            for(GenericValue item : items) {
                                try {
                                    int itemIndex = cart.addOrIncreaseItem(item.getString("productId"),
                                                                           null, // amount
                                                                           item.getBigDecimal("quantity"),
                                                                           null, null, null, // reserv
                                                                           item.getTimestamp("shipBeforeDate"),
                                                                           item.getTimestamp("shipAfterDate"),
                                                                           null, null, null,
                                                                           null, null, null,
                                                                           null, dispatcher);
                                } catch (Exception e) {
                                    return ServiceUtil.returnError(UtilProperties.getMessage(resource, 
                                            "OrderOrderCreatingDropShipmentsError", 
                                            UtilMisc.toMap("orderId", orderId, "errorString", e.getMessage()),
                                            locale));
                                }
                            }
                        }
                        // If there are indeed items to drop ship, then create the purchase order
                        if (!UtilValidate.isEmpty(cart.items())) {
                            // set checkout options
                            cart.setDefaultCheckoutOptions(dispatcher);
                            // the shipping address is the one of the customer
                            cart.setAllShippingContactMechId(shipGroup.getString("contactMechId"));
                            // associate ship groups of sales and purchase orders
                            ShoppingCart.CartShipInfo cartShipInfo = cart.getShipGroups().get(0);
                            cartShipInfo.setAssociatedShipGroupSeqId(shipGroup.getString("shipGroupSeqId"));
                            // create the order
                            Delegator tenantDelegator = DelegatorFactory.getDelegator(delegator.getDelegatorBaseName() + "#" + tenantId);
                            LocalDispatcher tenantDispatcher = ServiceContainer.getLocalDispatcher(tenantDelegator.getDelegatorName(), tenantDelegator);
                            CheckOutHelper coh = new CheckOutHelper(tenantDispatcher, tenantDelegator, cart);
                            Map<String, Object> createOrder = coh.createOrder(userLogin);
                            String sellerOrderId = (String) createOrder.get("orderId");
                            
                            GenericValue orderAttribute = tenantDelegator.makeValue("OrderAttribute");
                            orderAttribute.put("orderId", sellerOrderId);
                            orderAttribute.put("attrName", "SHOPMAX_ORDER");
                            orderAttribute.put("attrValue", orderId);
                            tenantDelegator.create(orderAttribute);
                            
                            for(GenericValue item : items) {
                                List<GenericValue> sellerOrderItems = tenantDelegator.findByAnd("OrderItem", UtilMisc.toMap("orderId", sellerOrderId, "productId", item.getString("productId")), null, false);
                                if (!UtilValidate.isEmpty(sellerOrderItems)) {
                                    GenericValue sellerOrderItem = EntityUtil.getFirst(sellerOrderItems);
                                    GenericValue orderItemAttribute = tenantDelegator.makeValue("OrderItemAttribute");
                                    orderItemAttribute.put("orderId", sellerOrderId);
                                    orderItemAttribute.put("orderItemSeqId", sellerOrderItem.getString("orderItemSeqId"));
                                    orderItemAttribute.put("attrName", "SHOPMAX_ORDER");
                                    orderItemAttribute.put("attrValue", item.getString("orderItemSeqId"));
                                    tenantDelegator.create(orderItemAttribute);
                                }
                            }
                        } else {
                            // if there are no items to drop ship, then clear out the supplier partyId
                            Debug.logWarning("No drop ship items found for order [" + shipGroup.getString("orderId") + "] and ship group [" + shipGroup.getString("shipGroupSeqId") + "] and supplier party [" + shipGroup.getString("supplierPartyId") + "].  Supplier party information will be cleared for this ship group", module);
                            shipGroup.set("supplierPartyId", null);
                            shipGroup.store();
                        }
                    }
                }
            }
        } catch (Exception exc) {
            // TODO: imporve error handling
            return ServiceUtil.returnError(UtilProperties.getMessage(resource, 
                    "OrderOrderCreatingDropShipmentsError", 
                    UtilMisc.toMap("orderId", orderId, "errorString", exc.getMessage()),
                    locale));
        }
        
        successResult.put("tenantId", tenantId);
        return successResult;
    }
}
