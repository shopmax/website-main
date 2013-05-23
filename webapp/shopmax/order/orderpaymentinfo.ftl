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

<#macro maskSensitiveNumber cardNumber>
  <#assign cardNumberDisplay = "">
  <#if cardNumber?has_content>
    <#assign size = cardNumber?length - 4>
    <#if (size > 0)>
      <#list 0 .. size-1 as foo>
        <#assign cardNumberDisplay = cardNumberDisplay + "*">
      </#list>
      <#assign cardNumberDisplay = cardNumberDisplay + cardNumber[size .. size + 3]>
    <#else>
      <#-- but if the card number has less than four digits (ie, it was entered incorrectly), display it in full -->
      <#assign cardNumberDisplay = cardNumber>
    </#if>
  </#if>
  ${cardNumberDisplay?if_exists}
</#macro>

<table cellpadding="0" cellspacing="0" border="0" class="table table_1">
    <thead>
        <tr>
            <th>Payment information</th>
        </tr>
    </thead>
    <tbody>
        <#list orderPaymentPreferences as orderPaymentPreference>
            <tr>
                <td>
                    <#assign paymentMethod = orderPaymentPreference.getRelatedOne("PaymentMethod", false)?if_exists>
                    <#if paymentMethod.paymentMethodTypeId?if_exists == "CREDIT_CARD">
                        <#assign gatewayResponses = orderPaymentPreference.getRelated("PaymentGatewayResponse", null, null, false)>
                        <#assign creditCard = paymentMethod.getRelatedOne("CreditCard", false)?if_exists>
                        <#if creditCard?has_content>
                            <#assign pmBillingAddress = creditCard.getRelatedOne("PostalAddress", false)?if_exists>
                        </#if>
                        <#if creditCard?has_content>
                            ${creditCard.cardType} <@maskSensitiveNumber cardNumber=creditCard.cardNumber?if_exists/><br/>
                            Exp: ${creditCard.expireDate}
                        </#if>
                    </#if>
                <td>
            </tr>
        </#list>
    </tbody>
</table>
