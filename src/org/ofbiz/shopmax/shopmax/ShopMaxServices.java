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
package org.ofbiz.shopmax.shopmax;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import javolution.util.FastList;
import javolution.util.FastMap;

import org.ofbiz.base.util.HttpClient;
import org.ofbiz.base.util.HttpClientException;
import org.ofbiz.base.util.Debug;
import org.ofbiz.base.util.HttpClientException;
import org.ofbiz.base.util.UtilMisc;
import org.ofbiz.base.util.UtilProperties;
import org.ofbiz.base.util.UtilValidate;
import org.ofbiz.entity.Delegator;
import org.ofbiz.entity.GenericEntityException;
import org.ofbiz.entity.GenericValue;
import org.ofbiz.entity.condition.EntityCondition;
import org.ofbiz.order.order.OrderReadHelper;
import org.ofbiz.security.Security;
import org.ofbiz.service.DispatchContext;
import org.ofbiz.service.ModelService;
import org.ofbiz.service.ServiceUtil;
import org.ofbiz.party.party.PartyHelper;
import org.ofbiz.entity.util.EntityUtil;
import org.ofbiz.entity.util.EntityFindOptions;
import org.ofbiz.party.contact.ContactHelper;
import org.ofbiz.entity.condition.EntityExpr;
import org.ofbiz.entity.condition.EntityOperator;
import org.ofbiz.entity.util.EntityUtilProperties;

public class ShopMaxServices {

    public final static String module = ShopMaxServices.class.getName();

    public static Map<String, Object> sendOrderSMSToSeller(DispatchContext ctx, Map<String, ? extends Object> context) throws GenericEntityException {
        List<Map<String, Object>> sendSMS = FastList.newInstance();
        Delegator delegator = ctx.getDelegator();
        String orderId = (String) context.get("orderId");
        String messageSMS = "YouHaveSellOrderFromShopMax";

        GenericValue orderHeader;
        try {
            orderHeader = delegator.findOne("OrderHeader", UtilMisc.toMap("orderId", orderId), false);
        } catch (GenericEntityException e) {
            Debug.logError(e, module);
            return ServiceUtil.returnError(e.getMessage());
        }
        String contactNumber = null;
        if (orderHeader != null) {
            OrderReadHelper orh = new OrderReadHelper(orderHeader);
            GenericValue billingParty = orh.getBillToParty();
            String customerName = PartyHelper.getPartyName(billingParty);
            String partyId = billingParty.getString("partyId");
            GenericValue phoneMobileNumber = EntityUtil.getFirst(EntityUtil.filterByDate(delegator.findByAnd("PartyContactDetailByPurpose", UtilMisc.toMap("partyId", partyId, "contactMechPurposeTypeId", "PHONE_MOBILE"), null, false)));
            if (!UtilValidate.isEmpty(phoneMobileNumber)) {
                contactNumber = phoneMobileNumber.getString("contactNumber");
            }
        }
        String response = null;

        Map<String, Object> result = FastMap.newInstance();
        result.put(ModelService.RESPONSE_MESSAGE, ModelService.RESPOND_SUCCESS);
        
        String confirmationSMSUrl = "http://shopmax.dyndns.biz:9710/http/send-message?username=" + "admin" + "&password=" + "admin" + "&to=%2B" + contactNumber + "&message-type=sms.automatic" + "&message=" + messageSMS;
        Debug.log("------------------------- SMS URL ------------------------- : " + confirmationSMSUrl);

        try {
            HttpClient http = new HttpClient(confirmationSMSUrl);
            response = http.get();
            Debug.log("------------------------- Response Data ------------------------- : " + response);
        } catch (HttpClientException e) {
            Debug.logError(e, module);
            //return ServiceUtil.returnError(e.getMessage());
        }

        if (UtilValidate.isNotEmpty(response)) {
           result.put(ModelService.RESPONSE_MESSAGE, ModelService.RESPOND_SUCCESS);
        }

        return result;
    }
}
