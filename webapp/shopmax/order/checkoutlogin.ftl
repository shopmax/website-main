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

<div class="container content shopping-cart">
    <!-- include breadcrumb -->
    ${screens.render("component://shopmax/widget/ShopMaxScreens.xml#Breadcrumbs")}
    <div class="row">
        <#include "component://shopmax/webapp/shopmax/order/ordersummary.ftl" />
        <form id="orderSummarySubmitForm" action="<@ofbizUrl>onePageProcess</@ofbizUrl>" method="post">
            <#-- Shipping Options -->
            <#assign supplierIndex = -1/>
            <#list supplierCarrierMap.keySet() as partyId>
                <#assign supplierIndex = supplierIndex + 1/>
                <#assign carrierPartyId = supplierCarrierMap.get(partyId)/>
                <input name="shipmentCarrierPartyId:${partyId}_o_${supplierIndex}" value="${carrierPartyId}" type="hidden"/>
            </#list>
            <#assign supplierIndex = -1/>
            <#list supplierShippingMethodTypeMap.keySet() as partyId>
                <#assign supplierIndex = supplierIndex + 1/>
                <#assign shippingMethodTypeId = supplierShippingMethodTypeMap.get(partyId)/>
                <input name="shipmentMethodTypeId:${partyId}_o_${supplierIndex}" value="${shippingMethodTypeId}" type="hidden"/>
            </#list>
            
            <div class="span9 main-content">
                <ul class="sc-step">
                    <li><span class="badge badge-inactive">1</span>&nbsp;&nbsp;Shopping Cart</li>
                    <li class="step-active"><span class="badge badge-active">2</span>&nbsp;&nbsp;Billing & Delivery</li>
                    <li><span class="badge badge-inactive">3</span>&nbsp;&nbsp;Complete</li>
                </ul>
                <br />
                <div class="billing_de">
                    <div class="shipp_info">
                        <div class="tital_1">Shipping Information</div>
                        <div class="row">
                            <div class="span5">
                                <div class="column_1">
                                    <select class="span4">
                                        <#list contactMechList as contactMech>
                                            <#assign postalAddress = contactMech.getRelatedOne("PostalAddress", false)?if_exists/>
                                            <#assign stateProvinceGeo = postalAddress.getRelatedOne("StateProvinceGeo", false)?if_exists>
                                            <option value="${postalAddress.contactMechId}">${postalAddress.toName?default("No Contact Name")} - ${postalAddress.address1?if_exists} ${stateProvinceGeo.geoName?if_exists} </option>
                                        </#list>
                                    </select>
                                    <h5>ship to</h5>
                                    <ul>
                                        <li>${shipToName?default("No Contact Name")}</li><#--Contact Name-->
                                        <li>${shipToAddress1?if_exists}</li><#--Street Address Line one -->
                                        <li>${shipToAddress2?if_exists}</li><#--Street Address Line two-->
                                        <li>${shipToStateProvinceGeo?if_exists}</li><#--State-->
                                        <li>Phone number ${shipToTelecomNumber.countryCode?if_exists} <#if shipToTelecomNumber.areaCode?exists>${shipToTelecomNumber.areaCode}-</#if>${shipToTelecomNumber.contactNumber}</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="span4">
                                <div class="column_2"><a href="#" class="pull-right">Edit Shipping Address</a></div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="shipp_info">
                        <div class="tital_1">Billing Information</div>
                        <div class="row">
                            <div class="span5">
                                <div class="column_1">
                                    <select class="span3">
                                        <#list billPaymentMethod as paymentMethod>
                                            <#assign creditCard = paymentMethod.getRelatedOne("CreditCard", false)?if_exists/>
                                            <option value="${creditCard.paymentMethodId}"><@maskSensitiveNumber cardNumber=cardNumber?if_exists/> Exp: ${(creditCard.expireDate).substring(0, 2)}/${(creditCard.expireDate).substring(3)}</option><#--Visa ••••••••••••1234 Exp: 03/03/2013-->
                                        </#list>
                                    </select>
                                    <h5>bill to</h5>
                                    <ul>
                                        <li>${billToName?default("No Contact Name")}</li>
                                        <li>${billToAddress1?if_exists} </li>
                                        <li>${billToAddress2?if_exists}</li>
                                        <li>${billToStateProvinceGeo?if_exists}</li>
                                        <li>Phone number ${billToTelecomNumber.countryCode?if_exists} <#if billToTelecomNumber.areaCode?exists>${billToTelecomNumber.areaCode}-</#if>${billToTelecomNumber.contactNumber}</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="span4">
                                <div class="column_2">
                                    <a href="#" class="pull-right clearfix">Edit Billing information</a>
                                    <div class="clearfix"></div>
                                    <h5>Payment Information</h5>
                                    <ul>
                                        <li>${cardType?if_exists?upper_case}</li>
                                        <li><@maskSensitiveNumber cardNumber=cardNumber?if_exists/></li><#--••••••••••••1234 -->
                                        <li>Exp: ${expMonth}/${expYear}</li>
                                        <li class="lastbox">
                                            <input type="text" class="span1 textb">
                                            <div class="card"><img src="<@ofbizContentUrl>img/icon-card.gif</@ofbizContentUrl>" alt=""></div>
                                            <a href="#" class="what">What is this ?</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="shipp_info">
                        <#include "component://shopmax/webapp/shopmax/order/ordersummarydetail.ftl" />
                    </div>
                </div>
                <input type="button" id="processOrderSummaryButton" name="processOrderSummaryButton" class="btn-general pull-right" value="Place Order" />
                <input type="button" style="display: none;" id="processingOrderSummaryButton" name="processingOrderSummaryButton" value="${uiLabelMap.OrderSubmittingOrder}" />
            </form>
        </div><!-- /.span9 -->
    </div><!-- /.row -->
</div> <!-- /container -->
