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
        $("#cartLoginButton").fancybox({
            'titlePosition'     : 'inside',
            'transitionIn'      : 'none',
            'transitionOut'     : 'none'
        });
        
        $('#createUserAccount').click(function(){
            if($(this).is(":checked")){
                $('#sendEmail').val('Y');
            }
            else{
                $('#sendEmail').val('N');
            }
        });
        
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
<div class="container content shopping-cart">
    <!-- include breadcrumb -->
    ${screens.render("component://shopmax/widget/ShopMaxScreens.xml#Breadcrumbs")}
    <div class="row">
        <#include "component://shopmax/webapp/shopmax/order/ordersummary.ftl" />
        <form id="orderSummarySubmitForm" action="<@ofbizUrl>onePageProcess</@ofbizUrl>" method="post">
            <#-- Shipping Options -->
            <#list supplierCarrierMap.keySet() as partyId>
                <#assign carrierPartyId = supplierCarrierMap.get(partyId)/>
                <input name="carrierPartyId:${partyId}" value="${carrierPartyId}" type="hidden"/>
            </#list>
            <#list supplierShipmentMethodTypeMap.keySet() as partyId>
                <#assign shipmentMethodTypeId = supplierShipmentMethodTypeMap.get(partyId)/>
                <input name="shipmentMethodTypeId:${partyId}" value="${shipmentMethodTypeId}" type="hidden"/>
            </#list>
            
            <div class="span9 main-content">
                <ul class="sc-step">
                    <li><span class="badge badge-inactive">1</span>&nbsp;&nbsp;Shopping Cart</li>
                    <li  class="step-active"><span class="badge badge-active">2</span>&nbsp;&nbsp;Billing & Delivery</li>
                    <li><span class="badge badge-inactive">3</span>&nbsp;&nbsp;Complete</li>
                </ul>
                <br />
                <div class="message-wrapper">
                    <div class="message-inner">
                        <a href="#">
                        <div class="message-box georgia">
                            Do you already have an account?&nbsp;&nbsp;<img src="<@ofbizContentUrl>/shopmax-default/img/icon-hand-right.gif</@ofbizContentUrl>" />&nbsp;&nbsp;<a id="cartLoginButton" href="#inline1">Login now !</a>
                        </div>
                        </a>
                    </div>
                </div>
                <div class="red">or</div>
                <div class="message-wrapper">
                    <div class="message-inner">
                        <a href="#">
                        <div class="message-box georgia">
                            Checkout without account
                        </div>
                        </a>
                    </div>
                </div>
                
                <#-- Shipping Information -->
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
                                <input type="text" class="input-xxxlarge" name="shipToAddress2" placeholder="Additional Address Info (optional)" />
                                <select name="shipToCity" class="drop-select chosen combo" data-search-bar="true">
                                    <option value="" selected="selected">Zip Return City, State</option>
                                    <option value="Auckland">Auckland</option>
                                    <option value="Christ Church">Christ Church</option>
                                    <option value="Wellington">Wellington</option>
                                </select>
                            </div>
                        </td>
                    </tr>
                  </tbody>
                </table>
                
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
                                    <option value="Auckland">Auckland</option>
                                    <option value="Christ Church">Christ Church</option>
                                    <option value="Wellington">Wellington</option>
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
                
                <#-- Account -->
                <input type="hidden" id="sendEmail" name="sendEmail" value="N"/>
                <table class="table table-condensed sc-table sc-table-shipping">
                  <thead>
                    <tr class="sc-table-product-header">
                      <th class="col1"><div class="pull-left">Account</div>
                          <label class="same-as">
                            <input type="checkbox" id="createUserAccount">Create a user account
                          </label>
                      </th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                        <td class="col1">
                            <p>This email address you entered in your shipping information will be used as the user name of your account.</p>
                            <p class="form-inline">
                                <input type="text" class="input-xxlarge required" placeholder="First Name" />
                                <input type="text" class="input-xxlarge required" placeholder="Last Name" />
                            </p>
                        </td>
                    </tr>
                  </tbody>
                </table>
                <div class="shipp_info">
                    <#include "component://shopmax/webapp/shopmax/order/ordersummarydetail.ftl" />
                </div>
                <input type="button" id="processOrderSummaryButton" name="processOrderSummaryButton" class="btn-general pull-right" value="Place Order" />
                <input type="button" style="display: none;" id="processingOrderSummaryButton" name="processingOrderSummaryButton" value="${uiLabelMap.OrderSubmittingOrder}" />
            </form>
        </div><!-- /.span9 -->
    </div><!-- /.row -->
</div> <!-- /container -->
