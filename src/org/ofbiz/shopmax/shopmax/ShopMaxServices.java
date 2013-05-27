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
        String tenantId = (String) context.get("tenantId");
        String messageSMS = "You&nbsp;have&nbsp;sale&nbsp;order&nbsp;from&nbsp;Shopmax";
        String contactNumber = null;
        
        Map<String, Object> result = FastMap.newInstance();
        
        String sellerSMS = UtilProperties.getPropertyValue("shopmax.properties", "shopmax.seller.sms");
        if (sellerSMS.equals("Y")) {
            String response = null;
            
            GenericValue phoneMobileNumber = EntityUtil.getFirst(EntityUtil.filterByDate(delegator.findByAnd("PartyContactDetailByPurpose", UtilMisc.toMap("partyId", tenantId, "contactMechPurposeTypeId", "PHONE_MOBILE"), null, false)));
            if (!UtilValidate.isEmpty(phoneMobileNumber)) {
                contactNumber = phoneMobileNumber.getString("contactNumber");
            }
            
            if (UtilValidate.isNotEmpty(contactNumber)) {
                String confirmationSMSUrl = "http://shopmax.dyndns.biz:9710/http/send-message?username=" + "admin" + "&password=" + "admin" + "&to=%2B" + contactNumber + "&message-type=sms.automatic" + "&message=" + messageSMS;
                Debug.log("------------------------- SMS URL ------------------------- : " + confirmationSMSUrl);
                
                try {
                    HttpClient http = new HttpClient(confirmationSMSUrl);
                    response = http.get();
                    Debug.log("------------------------- Response Data ------------------------- : " + response);
                } catch (HttpClientException e) {
                    Debug.logError(e, module);
                }
            }
            
            if (UtilValidate.isNotEmpty(response)) {
                result.put(ModelService.RESPONSE_MESSAGE, ModelService.RESPOND_SUCCESS);
            }
        }
        
        return result;
    }
}
