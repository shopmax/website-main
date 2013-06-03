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

import org.ofbiz.entity.util.EntityUtil;
import org.ofbiz.party.contact.ContactHelper;
import org.ofbiz.entity.condition.EntityCondition;

if (userLogin) {
    party = userLogin.getRelatedOne("Party", false);
    context.partyId = party.partyId
    if ("PERSON".equals(party.partyTypeId)) {
        person = delegator.findOne("Person", [partyId : party.partyId], false);
        context.firstName = person.firstName;
        context.lastName = person.lastName;
    } else {
        group = delegator.findOne("PartyGroup", [partyId : party.partyId], false);
        context.firstName = group.groupName;
        context.lastName = "";
    }
    
    context.contactMechList = ContactHelper.getContactMech(party, "SHIPPING_LOCATION", "POSTAL_ADDRESS", false);
    
    context.billPaymentMethod = EntityUtil.filterByDate(delegator.findList("PaymentMethod", EntityCondition.makeCondition([partyId : party.partyId, paymentMethodTypeId : "CREDIT_CARD"]), null, ["fromDate"], false))
}
