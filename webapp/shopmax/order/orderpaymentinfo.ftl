<#--
Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.
-->

<table cellpadding="0" cellspacing="0" border="0" class="table table_1">
    <thead>
        <tr>
            <th>Payment information</th>
        </tr>
    </thead>
    <tbody>
        <#list orderPaymentPreferences as orderPaymentPreference>
            <#assign payments = orderPaymentPreference.getRelated("Payment", null, null, false)>
            <#list payments as payment>
                <#assign statusItem = payment.getRelatedOne("StatusItem", false)>
                <#assign partyName = delegator.findOne("PartyNameView", {"partyId" : payment.partyIdTo}, true)>
                <tr><td>${partyName.groupName?if_exists}${partyName.lastName?if_exists} ${partyName.firstName?if_exists} ${partyName.middleName?if_exists}</td></tr>
                <tr><td><@ofbizCurrency amount=payment.amount?if_exists/></td></tr>
                <tr><td>Status: ${statusItem.description}</td></tr>
            </#list>
        </#list>
    </tbody>
</table>
