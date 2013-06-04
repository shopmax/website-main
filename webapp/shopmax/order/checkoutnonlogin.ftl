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
    $(function(){
        $('.cardNumber').change(function(){
            $('#cardNumber').val($('#cardNumber-0').val()+$('#cardNumber-1').val()+$('#cardNumber-2').val()+$('#cardNumber-3').val());
        });
        $('.main-content').find('input.check,.chzn-container-single').each(function(){
            $('input.check').focus(function(){
                $('#'+this.id).removeClass('required');
            });
            $('.chzn-container-single').click(function(){
                $('#'+this.id).css({'background-color':'#FFFFFF'});
                $(this).removeClass('required');
                $('#'+this.id).find('.chzn-single').each(function(){
                    $(this).css({'background-color':'#FFFFFF'});
                });
                /*if($('#'+this.id).find('span').text() == 'Zip Return City, State' || $('#'+this.id).find('span').text() == 'Select Card Type' || $('#'+this.id).find('span').text() == 'Month' || $('#'+this.id).find('span').text() == 'Year'){
                $('#'+this.id).css({'background-color':'#FEF2EE'});
                $('#'+this.id).find('.chzn-single').each(function(){
                    $(this).css({'background-color':'#FEF2EE'});
                });
                }*/
            });
        });
        $('#processOrderSummaryButton').click(function(){
            $('.main-content').find('input.check').each(function(){
                var valid = false;
                var x=document.forms["orderSummarySubmitForm"]["CUSTOMER_EMAIL"].value;
                var atpos=x.indexOf("@");
                var dotpos=x.lastIndexOf(".");
                var y=document.forms["orderSummarySubmitForm"]["CUSTOMER_EMAILS"].value;
                var atpos1=y.indexOf("@");
                var dotpos1=y.lastIndexOf(".");
                
                if(!$(this).val().length){
                    $(this).addClass('required');
                    $('html, body').animate({ scrollTop: 0 }, 0);
                    valid = false;
                    if($('#shipDropDown1_chzn').find('span').text() == 'Zip Return City, State'){
                        $('#shipDropDown1_chzn').css({'background-color':'#FEF2EE'});
                        $('#shipDropDown1_chzn').find('.chzn-single').each(function(){
                        $(this).css({'background-color':'#FEF2EE'});
                        });
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if($('#shipDropDown2_chzn').find('span').text() == 'Zip Return City, State'){
                        $('#shipDropDown2_chzn').css({'background-color':'#FEF2EE'});
                        $('#shipDropDown2_chzn').find('.chzn-single').each(function(){
                        $(this).css({'background-color':'#FEF2EE'});
                        });
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if($('#paymentDropDown_chzn').find('span').text() == 'Select Card Type'){
                        $('#paymentDropDown_chzn').css({'background-color':'#FEF2EE'});
                        $('#paymentDropDown_chzn').find('.chzn-single').each(function(){
                        $(this).css({'background-color':'#FEF2EE'});
                        });
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if($('#expMonth_chzn').find('span').text() == 'Month'){
                        $('#expMonth_chzn').css({'background-color':'#FEF2EE'});
                        $('#expMonth_chzn').find('.chzn-single').each(function(){
                        $(this).css({'background-color':'#FEF2EE'});
                        });
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if($('#expYear_chzn').find('span').text() == 'Year'){
                        $('#expYear_chzn').css({'background-color':'#FEF2EE'});
                        $('#expYear_chzn').find('.chzn-single').each(function(){
                        $(this).css({'background-color':'#FEF2EE'});
                        });
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                }
                else{
                    $(this).removeClass('required');
                    if($('.required').length == 0){
                        valid = true;
                    }
                    if(atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length){
                        $('#shipEmail').addClass('required');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if(atpos1<1 || dotpos1<atpos1+2 || dotpos1+2>=y.length){
                        $('#billEmail').addClass('required');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if(!$('#shipFirstName').val().length){
                        $('#shipFirstName').addClass('required');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if(!$('#shipLastName').val().length){
                        $('#shipLastName').addClass('required');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if(!$('#shipPhone').val().length){
                        $('#shipPhone').addClass('required');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if(!$('#shipEmail').val().length){
                        $('#shipEmail').addClass('required');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if(!$('#shipStreetAddress').val().length){
                        $('#shipStreetAddress').addClass('required');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if(!$('#shipPostal').val().length){
                        $('#shipPostal').addClass('required');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if(!$('#billFirstName').val().length){
                        $('#billFirstName').addClass('required');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if(!$('#billLastName').val().length){
                        $('#billLastName').addClass('required');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if(!$('#billPhone').val().length){
                        $('#billPhone').addClass('required');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if(!$('#billEmail').val().length){
                        $('#billEmail').addClass('required');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if(!$('#billStreetAddress').val().length){
                        $('#billStreetAddress').addClass('required');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if(!$('#billPostal').val().length){
                        $('#billPostal').addClass('required');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if(!$('#cardNumber-0').val().length){
                        $('#cardNumber-0').addClass('required');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if(!$('#cardNumber-1').val().length){
                        $('#cardNumber-1').addClass('required');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if(!$('#cardNumber-2').val().length){
                        $('#cardNumber-2').addClass('required');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if(!$('#cardNumber-3').val().length){
                        $('#cardNumber-3').addClass('required');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if(!$('#secureCode').val().length){
                        $('#secureCode').addClass('required');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if(!$('#accountFirstName').val().length){
                        $('#accountFirstName').addClass('required');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if(!$('#accountLastName').val().length){
                        $('#accountLastName').addClass('required');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if($('#shipDropDown1_chzn').find('span').text() == 'Zip Return City, State'){
                        $('#shipDropDown1_chzn').css({'background-color':'#FEF2EE'});
                        $('#shipDropDown1_chzn').find('.chzn-single').each(function(){
                        $(this).css({'background-color':'#FEF2EE'});
                        });
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if($('#shipDropDown2_chzn').find('span').text() == 'Zip Return City, State'){
                        $('#shipDropDown2_chzn').css({'background-color':'#FEF2EE'});
                        $('#shipDropDown2_chzn').find('.chzn-single').each(function(){
                        $(this).css({'background-color':'#FEF2EE'});
                        });
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if($('#paymentDropDown_chzn').find('span').text() == 'Select Card Type'){
                        $('#paymentDropDown_chzn').css({'background-color':'#FEF2EE'});
                        $('#paymentDropDown_chzn').find('.chzn-single').each(function(){
                        $(this).css({'background-color':'#FEF2EE'});
                        });
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if($('#expMonth_chzn').find('span').text() == 'Month'){
                        $('#expMonth_chzn').css({'background-color':'#FEF2EE'});
                        $('#expMonth_chzn').find('.chzn-single').each(function(){
                        $(this).css({'background-color':'#FEF2EE'});
                        });
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if($('#expYear_chzn').find('span').text() == 'Year'){
                        $('#expYear_chzn').css({'background-color':'#FEF2EE'});
                        $('#expYear_chzn').find('.chzn-single').each(function(){
                        $(this).css({'background-color':'#FEF2EE'});
                        });
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                }
                if(valid){
                    $('#orderSummarySubmitForm').submit();
                }
            });
        });
    });
    function isNumberKey(evt) {
        var charCode = (evt.which) ? evt.which : event.keyCode
        if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;
        return true;
     }
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
                                <input type="text" id="shipFirstName" class="input-xxlarge check required" name="USER_FIRST_NAME" placeholder="First Name" />
                                <input type="text" id="shipLastName" class="input-xxlarge check required" name="USER_LAST_NAME" placeholder="Last Name" />
                            </div>
                            <div class="form-inline">
                                <input name="shipToContactNumber" type="text" id="shipPhone" class="input-xxlarge check required" placeholder="Phone Number" />
                                <input name="CUSTOMER_EMAIL" type="text" id="shipEmail" class="input-xxlarge check required" placeholder="Email Address" />
                                <input type="text" class="input-xxlarge" placeholder="Fax Number (optional)" />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="col1">
                            <h5 class="heading">Shipping Address</h5>
                            <input type="hidden" name="shipMethod" value="NO_SHIPPING"/>
                            <div class="form-inline">
                                <input type="text" id="shipStreetAddress" class="input-xxxlarge check required" name="shipToAddress1" placeholder="Street Address" />
                                <input type="text" id="shipPostal" class="input-xxlarge check required" name="shipToPostalCode" placeholder="Zip/ Postal Code" />
                            </div>
                            <div class="form-inline">
                                <input type="text" class="input-xxxlarge" name="shipToAddress2" placeholder="Additional Address Info (optional)" />
                                <select id="shipDropDown1" name="shipToCity" class="drop-select chosen combo" data-search-bar="true">
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
                                <input type="text" name="billToName" id="billFirstName" class="input-xxlarge check required" placeholder="First Name" />
                                <input type="text" name="billToLastName" id="billLastName" class="input-xxlarge check required" placeholder="Last Name" />
                            </div>
                            <div class="form-inline">
                                <input name="billToContactNumber" type="text" id="billPhone" class="input-xxlarge check required" placeholder="Phone Number" />
                                <input type="text" id="billEmail" class="input-xxlarge check required" name="CUSTOMER_EMAILS" placeholder="Email Address" />
                                <input type="text" class="input-xxlarge" placeholder="Fax Number (optional)" />
                            </div>
                        </td>
                    </tr>
                    <tr id="tr-shipping-address">
                        <td class="col1">
                            <h5 class="heading">Shipping Address</h5>
                            
                            <div class="form-inline">
                                <input type="text" id="billStreetAddress" class="input-xxxlarge check required" name="billToAddress1" placeholder="Street Address" />
                                <input type="text" id="billPostal" class="input-xxlarge check required" name="billToPostalCode" placeholder="Zip/ Postal Code" />
                            </div>
                            <div class="form-inline">
                                <input type="text" class="input-xxxlarge" placeholder="Additional Address Info (optional)" />
                                <select id="shipDropDown2" name="billToCity" class="drop-select chosen combo" data-search-bar="true">
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
                                <select id="paymentDropDown" name="cardType" class="drop-select chosen combo" data-search-bar="true">
                                    <option value="" selected="selected">Select Card Type</option>
                                    <option value="Visa">Visa</option>
                                    <option value="2">Option 2</option>
                                </select>
                                <#-- Example card number: 4111111111111111 -->
                                <#-- <input name="cardNumber" type="text" class="input-xxlarge required" placeholder="Card Number" />-->
                                <input type="text" maxlength="4" class="input-small cardNumber check required" id="cardNumber-0" onkeypress='return isNumberKey(event)' autocomplete="off"> - <input type="text" maxlength="4" class="input-small cardNumber check required" id="cardNumber-1" onkeypress='return isNumberKey(event)' autocomplete="off"> - <input type="text" maxlength="4" class="input-small cardNumber check required" id="cardNumber-2" onkeypress='return isNumberKey(event)' autocomplete="off"> - <input type="text" maxlength="4" class="input-small cardNumber check required" id="cardNumber-3" onkeypress='return isNumberKey(event)' autocomplete="off">
                                <input type="hidden" id="cardNumber" name="cardNumber">
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
                                <input name="billToCardSecurityCode" type="text" id="secureCode" class="input-medium check required" placeholder="Security Code" />
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
                                <input type="text" id="accountFirstName" class="input-xxlarge check required" placeholder="First Name" />
                                <input type="text" id="accountLastName" class="input-xxlarge check required" placeholder="Last Name" />
                            </p>
                        </td>
                    </tr>
                  </tbody>
                </table>
                <div class="shipp_info">
                    <#include "component://shopmax/webapp/shopmax/order/ordersummarydetail.ftl" />
                </div>
                <a id="processOrderSummaryButton" name="processOrderSummaryButton" class="btn-general pull-right">Place Order</a>
                <input type="button" style="display: none;" id="processingOrderSummaryButton" name="processingOrderSummaryButton" value="${uiLabelMap.OrderSubmittingOrder}" />
            </form>
        </div><!-- /.span9 -->
    </div><!-- /.row -->
</div> <!-- /container -->
