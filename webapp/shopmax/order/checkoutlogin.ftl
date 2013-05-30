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
<script type="text/javascript">
    $(document).ready(function() {
        $('#sameAsShipping').click(function(){
            if($(this).is(":checked")){
                $('#tr-shipping-address').addClass('hidden');
                $('#tr-shipping-contact').addClass('hidden');
                $('#useShippingAddressForBilling').val('Y');
            }
            else{
                $('#tr-shipping-address').removeClass('hidden');
                $('#tr-shipping-contact').removeClass('hidden');
                $('#useShippingAddressForBilling').val('N');
            }
        });
    });
</script>

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
            <#list supplierShipmentMethodTypeMap.keySet() as partyId>
                <#assign supplierIndex = supplierIndex + 1/>
                <#assign shipmentMethodTypeId = supplierShipmentMethodTypeMap.get(partyId)/>
                <input name="shipmentMethodTypeId:${partyId}_o_${supplierIndex}" value="${shipmentMethodTypeId}" type="hidden"/>
            </#list>
            
            <div class="span9 main-content">
                <ul class="sc-step">
                    <li><span class="badge badge-inactive">1</span>&nbsp;&nbsp;Shopping Cart</li>
                    <li class="step-active"><span class="badge badge-active">2</span>&nbsp;&nbsp;Billing & Delivery</li>
                    <li><span class="badge badge-inactive">3</span>&nbsp;&nbsp;Complete</li>
                </ul>
                <br />
                <div class="billing_de">
                    <#if contactMechList?has_content>
                        <div class="shipp_info">
                            <div class="tital_1">Shipping Information</div>
                            <div class="row">
                                <div class="span5">
                                    <div class="column_1">
                                        <select name="shipToContactMechId" class="span4">
                                            <option value="">Please Select Shipping Address</option>
                                            <#if contactMechList?has_content>
                                                <#list contactMechList as contactMech>
                                                    <#assign postalAddress = contactMech.getRelatedOne("PostalAddress", false)?if_exists/>
                                                    <#assign stateProvinceGeo = postalAddress.getRelatedOne("StateProvinceGeo", false)?if_exists>
                                                    <option value="${postalAddress.contactMechId}">${postalAddress.toName?default("No Contact Name")} - ${postalAddress.address1?if_exists} ${stateProvinceGeo.geoName?if_exists} </option>
                                                </#list>
                                            </#if>
                                        </select>
                                        <h5>ship to</h5>
                                        <ul>
                                            <li>${shipToName?if_exists}</li>
                                            <li>${shipToAddress1?if_exists}</li>
                                            <li>${shipToAddress2?if_exists}</li>
                                            <li>${shipToStateProvinceGeo?if_exists}</li>
                                            <li>Phone number ${shipToTelecomNumber.countryCode?if_exists} <#if shipToTelecomNumber.areaCode?exists>${shipToTelecomNumber.areaCode}-</#if>${shipToTelecomNumber.contactNumber}</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="span4">
                                    <div class="column_2"><a href="#" class="pull-right">Edit Shipping Address</a></div>
                                </div>
                            </div>
                        </div>
                    <#else>
                        <input type="hidden" name="shipMethod" value="NO_SHIPPING"/>
                        <input type="hidden" value="1" name="shipToCountryCode">
                        <input type="hidden" value="801" name="shipToAreaCode">
                        <input type="hidden" value="" name="shipToExtension">
                        
                        <table class="table table-condensed sc-table sc-table-shipping">
                          <thead>
                            <tr class="sc-table-product-header">
                              <th class="col1">Shipping Information</th>
                            </tr>
                          </thead>
                          <tbody>
                            <tr>
                                <td class="col1">
                                    <h5 class="heading">Shipping Contact</h5>
                                    
                                    <div class="form-inline">
                                        <input type="text" class="input-xxlarge required" name="USER_FIRST_NAME" placeholder="First Name" />
                                        <input type="text" class="input-xxlarge required" name="USER_LAST_NAME" placeholder="Last Name" />
                                    </div>
                                    <div class="form-inline">
                                        <input name="shipToContactNumber" type="text" class="input-xxlarge required" placeholder="Phone Number" />
                                        <input name="CUSTOMER_EMAIL" type="text" class="input-xxlarge required" placeholder="Email Address" />
                                        <input type="text" class="input-xxlarge" placeholder="Fax Number (optional)" />
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="col1">
                                    <h5 class="heading">Shipping Address</h5>
                                    <input type="hidden" name="shipMethod" value="NO_SHIPPING"/>
                                    <div class="form-inline">
                                        <input type="text" class="input-xxxlarge required" name="shipToAddress1" placeholder="Street Address" />
                                        <input type="text" class="input-xxlarge" name="shipToPostalCode" placeholder="Zip/ Postal Code" />
                                    </div>
                                    <div class="form-inline">
                                        <input type="text" class="input-xxxlarge" placeholder="Additional Address Info (optional)" />
                                        <select name="shipToCity" class="drop-select chosen combo" data-search-bar="true">
                                            <option value="" selected="selected">Zip Return City, State</option>
                                            <option value="1">Option 1</option>
                                            <option value="2">Option 2</option>
                                        </select>
                                    </div>
                                </td>
                            </tr>
                          </tbody>
                        </table>
                    </#if>
                    
                    <#if billPaymentMethod?has_content>
                        <#-- Billing Informatioin -->
                        <input name="billToContactMechId" value="${billToContactMechId?if_exists}" type="hidden"/>
                        <input name="billToName" value="${billToName?if_exists}" type="hidden"/>
                        <input name="billToAttnName" value="${billToAttnName?if_exists}" type="hidden"/>
                        <input name="billToAddress1" value="${billToAddress1?if_exists}" type="hidden"/>
                        <input name="billToAddress2" value="${billToAddress2?if_exists}" type="hidden"/>
                        <input name="billToCity" value="${billToCity?if_exists}" type="hidden"/>
                        <input name="billToPostalCode" value="${billToPostalCode?if_exists}" type="hidden"/>
                        <input name="billToStateProvinceGeoId" value="${billToStateProvinceGeoId?if_exists}" type="hidden"/>
                        <input name="billToContactNumber" value="${billToTelecomNumber.contactNumber?if_exists}" type="hidden"/>
                        <input name="billToAreaCode" value="${billToTelecomNumber.areaCode?if_exists}" type="hidden"/>
                        <input name="billToCountryCode" value="${billToTelecomNumber.countryCode?if_exists}" type="hidden"/>
                        <div class="shipp_info">
                            <div class="tital_1">Billing Information</div>
                            <div class="row">
                                <div class="span5">
                                    <div class="column_1">
                                        <select name="paymentMethodId" class="span3">
                                            <option value="">Please Select Billing Address</option>
                                            <#if billPaymentMethod?has_content>
                                                <#list billPaymentMethod as paymentMethod>
                                                    <#assign creditCard = paymentMethod.getRelatedOne("CreditCard", false)?if_exists/>
                                                    <option value="${creditCard.paymentMethodId}"><@maskSensitiveNumber cardNumber=cardNumber?if_exists/> Exp: ${(creditCard.expireDate).substring(0, 2)}/${(creditCard.expireDate).substring(3)}</option><#--Visa ••••••••••••1234 Exp: 03/03/2013-->
                                                </#list>
                                            </#if>
                                        </select>
                                        <h5>bill to</h5>
                                        <ul>
                                            <li>${billToName?if_exists}</li>
                                            <li>${billToAddress1?if_exists}</li>
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
                                            <li></li>
                                            <li><@maskSensitiveNumber cardNumber=cardNumber?if_exists/></li><#--••••••••••••1234 -->
                                            <li>Exp:</li>
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
                    <#else>
                        <#-- Billing Information -->
                        <input type="hidden" id="paymentMethodId" name="paymentMethodId" value="${paymentMethodId?if_exists}" />
                        <input type="hidden" id="paymentMethodTypeId" name="paymentMethodTypeId" value="${paymentMethodTypeId?default("CREDIT_CARD")}" />
                        <input type="hidden" value="Y" name="keepAddressBook">
                        <input type="hidden" value="Y" name="setDefaultBilling">
                        <input type="hidden" value="1" name="billToCountryCode">
                        <input type="hidden" value="801" name="billToAreaCode">
                        <input type="hidden" value="" name="billToExtension">
                        <input type="hidden" value="N" name="useShippingAddressForBilling" id="useShippingAddressForBilling">
                        
                        <table class="table table-condensed sc-table sc-table-shipping">
                          <thead>
                            <tr class="sc-table-product-header">
                              <th class="col1"><div class="pull-left">Billing Information</div>
                                  <label class="same-as">
                                    <input type="checkbox" id="sameAsShipping">Same as shipping information
                                  </label>
                              </th>
                            </tr>
                          </thead>
                          <tbody>
                            <tr id="tr-shipping-contact">
                                <td class="col1">
                                    <h5 class="heading">Shipping Contact</h5>
                                    
                                    <div class="form-inline">
                                        <input type="text" name="billToName" class="input-xxlarge required" placeholder="First Name" />
                                        <input type="text" name="billToLastName" class="input-xxlarge required" placeholder="Last Name" />
                                    </div>
                                    <div class="form-inline">
                                        <input name="billToContactNumber" type="text" class="input-xxlarge required" placeholder="Phone Number" />
                                        <input type="text" class="input-xxlarge required" placeholder="Email Address" />
                                        <input type="text" class="input-xxlarge" placeholder="Fax Number (optional)" />
                                    </div>
                                </td>
                            </tr>
                            <tr id="tr-shipping-address">
                                <td class="col1">
                                    <h5 class="heading">Shipping Address</h5>
                                    
                                    <div class="form-inline">
                                        <input type="text" class="input-xxxlarge required" name="billToAddress1" placeholder="Street Address" />
                                        <input type="text" class="input-xxlarge" name="billToPostalCode" placeholder="Zip/ Postal Code" />
                                    </div>
                                    <div class="form-inline">
                                        <input type="text" class="input-xxxlarge" placeholder="Additional Address Info (optional)" />
                                        <select name="billToCity" class="drop-select chosen combo" data-search-bar="true">
                                            <option value="" selected="selected">Zip Return City, State</option>
                                            <option value="1">Option 1</option>
                                            <option value="2">Option 2</option>
                                        </select>
                                    </div>
                                </td>
                            </tr>
                            
                            <#-- Payment Information -->
                            
                            <tr>
                                <td class="col1">
                                    <h5 class="heading">Payment Information</h5>
                                    <div class="form-inline">
                                        <select name="cardType" class="drop-select chosen combo" data-search-bar="true">
                                            <option value="" selected="selected">Select Card Type</option>
                                            <option value="Visa" selected="selected">Visa</option>
                                            <option value="2">Option 2</option>
                                        </select>
                                        <#-- Example card number: 4111111111111111 -->
                                        <input name="cardNumber" type="text" class="input-xxlarge required" placeholder="Card Number" />
                                    </div>
                                    <div class="form-inline">
                                        <strong class="grey">Expires</strong>&nbsp;
                                        <#assign expMonth = "">
                                        <#assign expYear = "">
                                        <#if creditCard?exists && creditCard.expireDate?exists>
                                            <#assign expDate = creditCard.expireDate>
                                            <#if (expDate?exists && expDate.indexOf("/") > 0)>
                                                <#assign expMonth = expDate.substring(0,expDate.indexOf("/"))>
                                                <#assign expYear = expDate.substring(expDate.indexOf("/")+1)>
                                            </#if>
                                        </#if>
                                        <select name="expMonth" id="expMonth" class="chosen expireDate">
                                            <option value="">Month</option>
                                            ${screens.render("component://common/widget/CommonScreens.xml#ccmonths")}
                                        </select>
                                        <select name="expYear" id="expYear" class="chosen expireDate">
                                            <option value="">Year</option>
                                            ${screens.render("component://common/widget/CommonScreens.xml#ccyears")}
                                        </select>
                                        <input name="billToCardSecurityCode" type="text" class="input-medium required" placeholder="Security Code" />
                                        <img src="<@ofbizContentUrl>/shopmax-default/img/icon-card.gif</@ofbizContentUrl>" />
                                        <a href="#">What is this?</a>
                                    </div>
                                </td>
                            </tr>
                          </tbody>
                        </table>
                    </#if>
                    <div class="shipp_info">
                        <#include "component://shopmax/webapp/shopmax/order/ordersummarydetail.ftl" />
                    </div>
                </div>
                <input type="button" id="processOrderSummaryButton" name="processOrderSummaryButton" class="btn-general pull-right" value="Place Order" />
                <input type="button" style="display: none;" id="processingOrderSummaryButton" name="processingOrderSummaryButton" value="${uiLabelMap.OrderSubmittingOrder}" />
            </div><!-- /.span9 -->
        </form>
    </div><!-- /.row -->
</div> <!-- /container -->
