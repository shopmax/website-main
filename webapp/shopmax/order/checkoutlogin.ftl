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
                $('#billFirstName').removeClass('check required');
                $('#billLastName').removeClass('check required');
                $('#billPhone').removeClass('check required');
                $('#billEmail').removeClass('check required');
                $('#billStreetAddress').removeClass('check required');
                $('#billPostal').removeClass('check required');
                $('.processOrderSummaryButton').attr('style','display: none;');
                $('.summaryButton2').attr('style','');
            }
            else{
                $('#tr-shipping-address').removeClass('hidden');
                $('#tr-shipping-contact').removeClass('hidden');
                $('#useShippingAddressForBilling').val('N');
                $('#billFirstName').addClass('check required');
                $('#billLastName').addClass('check required');
                $('#billPhone').addClass('check required');
                $('#billEmail').addClass('check required');
                $('#billStreetAddress').addClass('check required');
                $('#billPostal').addClass('check required');
                $('.summaryButton2').attr('style','display: none;');
                $('.processOrderSummaryButton').attr('style','');
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
        $('#shipAddressDrop').click(function(){
            $('#shipAddressDrop').css({'background-color':'#FFFFFF'});
        });
        $('#billAddressDrop').click(function(){
            $('#billAddressDrop').css({'background-color':'#FFFFFF'});
        });

        $('.summaryButton3').click(function(){
            $('.main-content').find('input.check').each(function(){
                var valid = false;
                if(!$(this).val().length){
                $(this).addClass('required');
                valid = false;
                    if($('select#shipAddressDrop option:selected').val() == 'error'){
                    $('#shipAddressDrop').css({'background-color':'#FEF2EE'});
                        valid = false;
                    }
                    if($('select#billAddressDrop option:selected').val() == 'error2'){
                        $('#billAddressDrop').css({'background-color':'#FEF2EE'});
                        valid = false;
                    }
                }
                else{
                    $(this).removeClass('required');
                    if($('.required').length == 0){
                        valid = true;
                    }
                    if($('select#shipAddressDrop option:selected').val() == 'error'){
                    $('#shipAddressDrop').css({'background-color':'#FEF2EE'});
                        valid = false;
                    }
                    if($('select#billAddressDrop option:selected').val() == 'error2'){
                        $('#billAddressDrop').css({'background-color':'#FEF2EE'});
                        valid = false;
                    }
                }
                if(valid){
                        $('#orderSummarySubmitForm').submit();
                }
            });
        });

        $('.summaryButton2').click(function(){
            $('.main-content').find('input.check').each(function(){
                var valid = false;
                var x=document.forms["orderSummarySubmitForm"]["CUSTOMER_EMAIL"].value;
                var atpos=x.indexOf("@");
                var dotpos=x.lastIndexOf(".");
                
                if(!$(this).val().length){
                $(this).addClass('required');
                $('html, body').animate({ scrollTop: 0 }, 0);
                valid = false;
                    if($('select#shipAddressDrop option:selected').val() == 'error'){
                    $('#shipAddressDrop').css({'background-color':'#FEF2EE'});
                        valid = false;
                    }
                    if($('select#billAddressDrop option:selected').val() == 'error2'){
                        $('#billAddressDrop').css({'background-color':'#FEF2EE'});
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
                }
                else{
                    $(this).removeClass('required');
                    if($('.required').length == 0){
                        valid = true;
                    }
                    if($('select#shipAddressDrop option:selected').val() == 'error'){
                    $('#shipAddressDrop').css({'background-color':'#FEF2EE'});
                        valid = false;
                    }
                    if($('select#billAddressDrop option:selected').val() == 'error2'){
                        $('#billAddressDrop').css({'background-color':'#FEF2EE'});
                        valid = false;
                    }
                    if(atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length){
                        $('#shipEmail').addClass('required');
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
                    if($('#shipDropDown1_chzn').find('span').text() == 'Zip Return City, State'){
                        $('#shipDropDown1_chzn').css({'background-color':'#FEF2EE'});
                        $('#shipDropDown1_chzn').find('.chzn-single').each(function(){
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

        $('.summaryButton1').click(function(){
            $('.main-content').find('input.check').each(function(){
                var valid = false;
                var y=document.forms["orderSummarySubmitForm"]["CUSTOMER_EMAILS"].value;
                var atpos1=y.indexOf("@");
                var dotpos1=y.lastIndexOf(".");
                
                if(!$(this).val().length){
                $(this).addClass('required');
                valid = false;
                    if($('select#shipAddressDrop option:selected').val() == 'error'){
                    $('#shipAddressDrop').css({'background-color':'#FEF2EE'});
                        valid = false;
                    }
                    if($('select#billAddressDrop option:selected').val() == 'error2'){
                        $('#billAddressDrop').css({'background-color':'#FEF2EE'});
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
                }
                else{
                    $(this).removeClass('required');
                    if($('.required').length == 0){
                        valid = true;
                    }
                    if($('select#shipAddressDrop option:selected').val() == 'error'){
                    $('#shipAddressDrop').css({'background-color':'#FEF2EE'});
                        valid = false;
                    }
                    if($('select#billAddressDrop option:selected').val() == 'error2'){
                        $('#billAddressDrop').css({'background-color':'#FEF2EE'});
                        valid = false;
                    }
                    if(atpos1<1 || dotpos1<atpos1+2 || dotpos1+2>=y.length){
                        $('#billEmail').addClass('required');
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
                    if($('#shipDropDown2_chzn').find('span').text() == 'Zip Return City, State'){
                        $('#shipDropDown2_chzn').css({'background-color':'#FEF2EE'});
                        $('#shipDropDown2_chzn').find('.chzn-single').each(function(){
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

        $('.processOrderSummaryButton').click(function(){
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
                    if(!$('#firstNameOnCard').val().length){
                        $('#firstNameOnCard').addClass('required');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if(!$('#lastNameOnCard').val().length){
                        $('#lastNameOnCard').addClass('required');
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
        var charCode = (evt.which) ? evt.which : evt.keyCode
        if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;
        return true;
     }
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
                        <input type="hidden" value="64" name="shipToCountryCode">
                        <div class="shipp_info">
                            <div class="tital_1">Shipping Information</div>
                            <div class="row">
                                <div class="span5">
                                    <div class="column_1">
                                        <select name="shipToContactMechId" id="shipAddressDrop" class="span4">
                                            <#if contactMechList?has_content>
                                                <#list contactMechList as contactMech>
                                                    <#assign postalAddress = contactMech.getRelatedOne("PostalAddress", false)?if_exists/>
                                                    <#assign stateProvinceGeo = postalAddress.getRelatedOne("StateProvinceGeo", false)?if_exists>
                                                    <option value="${postalAddress.contactMechId}">${postalAddress.toName?default("No Contact Name")} - ${postalAddress.address1?if_exists}</option>
                                                </#list>
                                            </#if>
                                        </select>
                                        <h5>ship to</h5>
                                        <ul>
                                            <li>${shipToName?if_exists}</li>
                                            <li>${shipToAddress1?if_exists}</li>
                                            <li>${shipToAddress2?if_exists}</li>
                                            <li>${shipToCity?if_exists}</li>
                                            <li>Phone number <#if shipToTelecomNumber.areaCode?exists>${shipToTelecomNumber.areaCode}-</#if>${shipToTelecomNumber.contactNumber}</li>
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
                        <input type="hidden" value="64" name="shipToCountryCode">
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
                                        <select id="shoppingPhoneNumberArea" name="shipToAreaCode" class="chosen contactNumber" style="width: 60px;">
                                            <option selected="selected">03</option>
                                            <option>04</option>
                                            <option>06</option>
                                            <option>07</option>
                                            <option>09</option>
                                            <option>020</option>
                                            <option>021</option>
                                            <option>022</option>
                                            <option>027</option>
                                            <option>028</option>
                                            <option>029</option>
                                            <option>0508</option>
                                            <option>0800</option>
                                        </select>
                                        <input name="shipToContactNumber" type="text" id="shipPhone" class="input-xxlarge check required" onkeypress="return isNumberKey(event)" placeholder="Phone Number" style="width: 135px;"/>
                                        <input name="CUSTOMER_EMAIL" type="text" id="shipEmail" class="input-xxlarge check required" placeholder="Email Address" />
                                        <select id="shipFaxNumberArea" name="shipFaxNumberArea" class="chosen contactNumber" id="shipPhoneFaxNumberArea" style="width: 60px;">
                                            <option selected="selected">03</option>
                                            <option>04</option>
                                            <option>06</option>
                                            <option>07</option>
                                            <option>09</option>
                                            <option>0508</option>
                                            <option>0800</option>
                                        </select>
                                        <input type="text" class="input-xxlarge" placeholder="Fax Number" id="shipFaxNumber" name="shipToFaxNumber" onkeypress="return isNumberKey(event)" style="width: 135px;"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="col1">
                                    <h5 class="heading">Shipping Address</h5>
                                    <input type="hidden" name="shipMethod" value="NO_SHIPPING"/>
                                    <div class="form-inline">
                                        <input type="text" id="shipStreetAddress" class="input-xxxlarge check required" name="shipToAddress1" placeholder="Street Address" />
                                        <input type="text" id="shipPostal" class="input-xxlarge check required" name="shipToPostalCode" onkeypress="return isNumberKey(event)" placeholder="Zip/ Postal Code" />
                                    </div>
                                    <div class="form-inline">
                                        <input type="text" class="input-xxxlarge" placeholder="Additional Address Info (optional)" />
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
                                        <select name="paymentMethodId" id="billAddressDrop" class="span3">
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
                                            <li>${billToCity?if_exists}</li>
                                            <li>Phone number <#if billToTelecomNumber.areaCode?exists>${billToTelecomNumber.areaCode}-</#if>${billToTelecomNumber.contactNumber}</li>
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
                                                <input type="text" id="exp" class="span1 textb check required">
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
                        <input type="hidden" value="64" name="billToCountryCode">
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
                                        <select id="billToAreaCode" name="billToAreaCode" class="chosen contactNumber" style="width: 60px;">
                                            <option selected="selected">03</option>
                                            <option>04</option>
                                            <option>06</option>
                                            <option>07</option>
                                            <option>09</option>
                                            <option>020</option>
                                            <option>021</option>
                                            <option>022</option>
                                            <option>027</option>
                                            <option>028</option>
                                            <option>029</option>
                                            <option>0508</option>
                                            <option>0800</option>
                                        </select>
                                        <input name="billToContactNumber" type="text" id="billPhone" class="input-xxlarge check required" onkeypress="return isNumberKey(event)" placeholder="Phone Number" style="width: 135px;"/>
                                        <input type="text" name="CUSTOMER_EMAILS" id="billEmail" class="input-xxlarge check required" placeholder="Email Address" />
                                        <select id="billingFaxNumberArea" name="billToFaxNumberArea" class="chosen contactNumber" id="shipPhoneFaxNumberArea" style="width: 60px;">
                                            <option selected="selected">03</option>
                                            <option>04</option>
                                            <option>06</option>
                                            <option>07</option>
                                            <option>09</option>
                                            <option>0508</option>
                                            <option>0800</option>
                                        </select>
                                        <input type="text" class="input-xxlarge" name="billToFaxNumber" placeholder="Fax Number" id = "billingFaxNumber" onkeypress="return isNumberKey(event)" style="width: 135px;"/>
                                    </div>
                                </td>
                            </tr>
                            <tr id="tr-shipping-address">
                                <td class="col1">
                                    <h5 class="heading">Shipping Address</h5>
                                    
                                    <div class="form-inline">
                                        <input type="text" id="billStreetAddress" class="input-xxxlarge check required" name="billToAddress1" placeholder="Street Address" />
                                        <input type="text" id="billPostal" class="input-xxlarge check required" onkeypress="return isNumberKey(event)" name="billToPostalCode" placeholder="Zip/ Postal Code" />
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
                                        <input type="text" id="firstNameOnCard" class="input-xxlarge check required" name="firstNameOnCard" placeholder="First Name" />
                                        <input type="text" id="lastNameOnCard" class="input-xxlarge check required" name="lastNameOnCard" placeholder="Last Name" />
                                    </div>
                                    <div class="form-inline">
                                        <select id="paymentDropDown" name="cardType" class="drop-select chosen combo" data-search-bar="true">
                                            <option value="" selected="selected">Select Card Type</option>
                                            <option value="Visa">Visa</option>
                                            <option value="MasterCard">Master Card</option>
                                        </select>
                                        <#-- Example card number: 4111111111111111 -->
                                        <#-- <input name="cardNumber" type="text" class="input-xxlarge check required" placeholder="Card Number" /> -->
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
                                        <input name="billToCardSecurityCode" type="text" id="secureCode" class="input-medium check required" placeholder="Security Code" onkeypress="return isNumberKey(event)" maxlength="3" autocomplete="off"/>
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
                
                <input type="button" style="display: none;" id="processingOrderSummaryButton" name="processingOrderSummaryButton" value="${uiLabelMap.OrderSubmittingOrder}" />
                <#if !contactMechList?has_content && billPaymentMethod?has_content>
                    <input type="button" id="summaryButton2" name="summaryButton2" class="btn-general pull-right summaryButton2" value="Place Order" />
                </#if>
                <#if !billPaymentMethod?has_content && contactMechList?has_content>
                    <input type="button" id="summaryButton1" name="summaryButton1" class="btn-general pull-right summaryButton1" value="Place Order" />
                </#if>
                <#if contactMechList?has_content && billPaymentMethod?has_content>
                    <input type="button" id="summaryButton3" name="summaryButton3" class="btn-general pull-right summaryButton3" value="Place Order" />
                </#if>
                <#if !contactMechList?has_content && !billPaymentMethod?has_content>
                    <input type="button" style="" id="processOrderSummaryButton" name="processOrderSummaryButton" class="btn-general pull-right processOrderSummaryButton" value="Place Order" />
                    <input type="button" style="display: none;" id="summaryButton2" name="summaryButton2" class="btn-general pull-right summaryButton2" value="Place Order" />
                </#if>
            </div><!-- /.span9 -->
        </form>
    </div><!-- /.row -->
</div> <!-- /container -->
