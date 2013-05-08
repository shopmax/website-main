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

<script>
    $(function(){
        $('.container.content').addClass('promotion');
        
        $('#submit-createcustomer').click(function(){
            $('#createcustomer').submit();
        });
        $('.chk_regis').click(function(){
            if($('.chk_regis').is(':checked')){
                $('.business-registered').removeClass('hidden');
                $('#businessUser').val("Y");
            }
            else{
                $('.business-registered').addClass('hidden');
            }
        });
    });
</script>

<div class="container content">
    <!-- include breadcrum -->
    <#include "component://shopmax/webapp/shopmax/includes/breadcrum.ftl" />
    
    <div class="row">
        <div class="span3 sidebar" id="side-menu">
            <div class="categories innerbox">
                <h2>Tips</h2>
                <div class="category-list">
                    <h5 class="heading">Register as a standard user</h5>
                    <p>A standard user could...</p>
                    <hr />
                    <h5 class="heading">Register as a Business user</h5>
                    <p>A standard user could...</p>
                </div>
            </div><!-- /.categories .innerbox -->
        </div><!-- /.span3.sidebar -->
    <!-- MAIN CONTENT -->
        <!-- sliderdiv -->
        <div class="span9 imp-info">
            <p>To become a seller on Shopmax, you must be a registered business in New Zealand</p>
        </div>
        <div class="span9 main-content">
            <form action="<@ofbizUrl>createcustomer</@ofbizUrl>" id="createcustomer" name="createcustomer" method="post">
                <input type="hidden" name="emailProductStoreId" value="${productStoreId}"/>
                <input type="hidden" name="businessUser" id="businessUser" value="N"/>
                <table class="table table-condensed sc-table sc-table-promotion">
                  <thead>
                    <tr class="sc-table-header">
                      <th class="col1">User Information</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                        <td class="col1 form-horizontal pull-left">
                            <p class="intro-txt"><strong>Create a new account profile by completing the new registration form. Once you are done and logged in, you can save shopping cart list, track your order history, manage addresses, and speed up the check out process</strong></p>
                            <div class="control-group">
                                <label class="control-label control-label-xlarge checkbox"><input type="checkbox" class="chk_regis" name="optionsRadios" id="optionsRadios1" >&nbsp; Registered as business user <img src="<@ofbizContentUrl>/shopmax-default/img/icon-question.png</@ofbizContentUrl>" rel="tooltip" data-original-title="If you are a business, you can become a Shopmax seller and create your online store" /></label>
                            </div>
                            <div class="control-group">
                                <label class="control-label control-label-small" for="inputEmailAddress">Email Address</label>
                                <div class="pull-left">
                                    <input type="text" class="input-xlarge" id="emailAddress" name="CUSTOMER_EMAIL">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label control-label-small" for="inputPromotionDescription">Password</label>
                                <div class="pull-left">
                                    <input type="password" class="input-xlarge" id="currentPassword" name="PASSWORD">
                                </div>
                                <label class="control-label control-label-small" for="inputPromotionDescription">Confirm Password</label>
                                <div class="pull-left">
                                    <input type="password" class="input-xlarge" id="currentPasswordVerify" name="CONFIRM_PASSWORD">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label control-label-small" for="inputPromotionDescription">First Name</label>
                                <div class="pull-left">
                                    <input type="text" class="input-xlarge" id="firstName" name="USER_FIRST_NAME">
                                </div>
                                <label class="control-label control-label-small" for="inputPromotionDescription">Last Name</label>
                                <div class="pull-left">
                                    <input type="text" class="input-xlarge" id="lastName" name="USER_LAST_NAME">
                                </div>
                            </div>
                        </td>
                    </tr>
                  </tbody>
                </table>
                
                <div class="business-registered hidden">
                    <table class="table table-condensed sc-table sc-table-promotion">
                      <thead>
                        <tr class="sc-table-header">
                          <th class="col1">Business Information</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                            <td class="col1 form-horizontal">
                                <div class="control-group">
                                    <label class="control-label control-label-big" for="inputPromotionDescription">Official business name</label>
                                    <div class="pull-left">
                                        <input type="text" class="input-large" id="businessName" name="businessName">
                                    </div>
                                    <label class="control-label control-label-big" for="inputPromotionDescription">Official trading name</label>
                                    <div class="pull-left">
                                        <input type="text" class="input-large" id="tradingName" name="tradingName">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label control-label-big" for="inputPromotionDescription">Contact phone number</label>
                                    <select id="phoneNumber0" class="chosen phoneNumber" name="phoneNumber">
                                        <option selected="selected">09</option>
                                        <option value="selling.html">08</option>
                                        <option value="buying.html">07</option>
                                        <option value="profile.html">06</option>
                                        <option value="log-out.html">05</option>
                                    </select>
                                    <div class="pull-left">
                                        <input type="text" class="input-large" id="phoneNumber" name="phoneNumber">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label control-label-text" for="inputPromotionDescription">TXT Notification phone number</label>
                                    <select id="phoneNumber1" class="chosen phoneNumber" name="phoneNumber1">
                                        <option selected="selected">09</option>
                                        <option value="selling.html">08</option>
                                        <option value="buying.html">07</option>
                                        <option value="profile.html">06</option>
                                        <option value="log-out.html">05</option>
                                    </select>
                                    <div class="pull-left">
                                        <input type="text" class="input-large" id="phoneNumber" name="phoneNumber">
                                    </div>
                                    <label class="control-label control-label-text2" for="inputPromotionDescription">(We will send TXT notification to this phone number when order arrives)</label>
                                </div>
                                <div class="form-inline">
                                    <label class="radio">
                                    <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>
                                    Use your own domain name
                                    </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;http://&nbsp;&nbsp;&nbsp;<input type="text" class="input-url" id="domianName" name="domianName"/> <img src="<@ofbizContentUrl>/shopmax-default/img/icon-question.png</@ofbizContentUrl>" rel="tooltip" data-original-title="If you are a business, you can become a Shopmax seller and create your online store" /><div class="sc-or"><strong>OR</strong></div><label class="radio">
                                    <div class="control-group">
                                        <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
                                        Create a free domain with shopmax
                                        </label>&nbsp;&nbsp;&nbsp;&nbsp;http://&nbsp;&nbsp;
                                        <input type="text" class="input-newurl" id="subDomain" name="subDomain">
                                        .shopmax.co.nz <img src="<@ofbizContentUrl>/shopmax-default/img/icon-question.png</@ofbizContentUrl>" rel="tooltip" data-original-title="If you are a business, you can become a Shopmax seller and create your online store" />
                                    </div>
                                </div>
                                <br/>
                                <div class="control-group">
                                    <div class="control-group-bank">
                                    <label class="control-label control-label-big pull-left" for="inputPromotionDescription">Bank account detail</label>
                                    <label class="control-label control-label-bank pull-left" for="inputPromotionDescription">Account Name</label>
                                    <input type="text" class="input-large pull-left" id="inputAccountName" name="accountName"> <img src="<@ofbizContentUrl>/shopmax-default/img/icon-question.png</@ofbizContentUrl>" rel="tooltip" data-original-title="If you are a business, you can become a Shopmax seller and create your online store" />
                                    </div>
                                    <div class="clearfix"></div>
                                    <label class="control-label control-label-big pull-left" for="inputPromotionDescription">&nbsp;</label>
                                    <label class="control-label control-label-bank pull-left" for="inputPromotionDescription">Account Number</label>
                                    <div class="pull-left"><input type="text" class="input-cc-xsmall" id="accountNumber-0" name="accountNumber-0"> - <input type="text" class="input-small" id="accountNumber-1" name="accountNumber-1"> - <input type="text" class="input-cc-large" id="accountNumber-2" name="accountNumber-2"> - <input type="text" class="input-cc-xsmall" id="accountNumber-3" name="accountNumber-3"></div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label control-label-llarge pull-left" for="inputEmailAddress">Upload your shop's logo (153x153)</label>
                                    <div class="pull-left">
                                        <input type="text" class="logo-url" id="inputFile"> <a class="btn-general-small upload-btn" href="#">BROWSE</a> <img src="<@ofbizContentUrl>/shopmax-default/img/icon-question.png</@ofbizContentUrl>" rel="tooltip" data-original-title="If you are a business, you can become a Shopmax seller and create your online store" />
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <!-- <table class="selected-products">
                                    <tr><td class="col1">Electronics > Mobiles > Smartphones</td><td class="col2"><a href="#">Remove</a></td></tr>
                                    <tr><td class="col1">Electronics > Mobiles > Smartphones</td><td class="col2"><a href="#">Remove</a></td></tr>
                                </table>
                                
                                <div class="form-inline">
                                    <br />
                                    <label>
                                    Start date&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="text" class="input-small" />
                                    </label>
                                    <img src="<@ofbizContentUrl>/shopmax-default/img/icon-calendar.png</@ofbizContentUrl>" />
                                    <label class="offset1">
                                    End date&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="text" class="input-small" />
                                    </label>
                                    <img src="<@ofbizContentUrl>/shopmax-default/img/icon-calendar.png</@ofbizContentUrl>" /> 
                                </div>
                                -->
                            </td>
                        </tr>
                      </tbody>
                    </table>
                    
                    <table class="table table-condensed sc-table sc-table-promotion">
                      <thead>
                        <tr class="sc-table-header">
                          <th class="col1">PHYSICAL STORES DETAIL</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                            <td class="col1 form-horizontal">
                                <div class="control-group">
                                    <label class="control-label control-label-xsmall" for="inputPromotionDescription">Location</label>
                                    <div class="pull-left">
                                        <input type="text" class="input-xxlarge inputLocation" id="inputLocation_0">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label control-label-small" for="inputPromotionDescription">Store Phone number</label>
                                    <div class="pull-left">
                                        <select id="phoneNumber2" class="chosen phoneNumber" name="phoneNumber2">
                                            <option selected="selected">09</option>
                                            <option value="selling.html">08</option>
                                            <option value="buying.html">07</option>
                                            <option value="profile.html">06</option>
                                            <option value="log-out.html">05</option>
                                        </select>
                                        <input type="text" class="input-phone-number" id="inputPassword">
                                    </div>
                                    <label class="control-label control-label-small" for="inputPromotionDescription">Store Phone number</label>
                                    <div class="pull-left">
                                        <select id="phoneNumber3" class="chosen phoneNumber" name="phoneNumber3">
                                            <option selected="selected">09</option>
                                            <option value="selling.html">08</option>
                                            <option value="buying.html">07</option>
                                            <option value="profile.html">06</option>
                                            <option value="log-out.html">05</option>
                                        </select>
                                        <input type="text" class="input-phone-number" id="inputPassword">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label control-label-xlarge" for="inputOpeningHours">Opening Hours (24 hour format)</label>
                                    <div class="clearfix"></div>
                                    
                                    <label class="control-label control-label-xxsmall pull-left" for="inputMonday"><input type="checkbox" name="optionsRadios" id="optionsRadios1" > Mon </label>
                                    <div clas="pull-left">
                                        <input type="text" class="input-xsmall" id="inputMonTimeIn"> : <input type="text" class="input-xsmall" id="inputMonTimeOut"> &nbsp;&nbsp;&nbsp;&nbsp; - &nbsp;&nbsp;&nbsp;&nbsp; <input type="text" class="input-xsmall" id="inputMonTimeIn"> : <input type="text" class="input-xsmall" id="inputMonTimeOut">
                                    </div>
                                    <label class="control-label control-label-xxsmall pull-left" for="inputTuesday"><input type="checkbox" name="optionsRadios" id="optionsRadios1" > Tue </label>
                                    <div clas="pull-left">
                                        <input type="text" class="input-xsmall" id="inputMonTimeIn"> : <input type="text" class="input-xsmall" id="inputMonTimeOut"> &nbsp;&nbsp;&nbsp;&nbsp; - &nbsp;&nbsp;&nbsp;&nbsp; <input type="text" class="input-xsmall" id="inputMonTimeIn"> : <input type="text" class="input-xsmall" id="inputMonTimeOut">
                                    </div> 
                                    <label class="control-label control-label-xxsmall pull-left" for="inputWednesday"><input type="checkbox" name="optionsRadios" id="optionsRadios1" > Wed </label>
                                    <div clas="pull-left">
                                        <input type="text" class="input-xsmall" id="inputMonTimeIn"> : <input type="text" class="input-xsmall" id="inputMonTimeOut"> &nbsp;&nbsp;&nbsp;&nbsp; - &nbsp;&nbsp;&nbsp;&nbsp; <input type="text" class="input-xsmall" id="inputMonTimeIn"> : <input type="text" class="input-xsmall" id="inputMonTimeOut">
                                    </div> 
                                    <label class="control-label control-label-xxsmall pull-left" for="inputMonday"><input type="checkbox" name="optionsRadios" id="optionsRadios1" > Thu </label>
                                    <div clas="pull-left">  
                                        <input type="text" class="input-xsmall" id="inputMonTimeIn"> : <input type="text" class="input-xsmall" id="inputMonTimeOut"> &nbsp;&nbsp;&nbsp;&nbsp; - &nbsp;&nbsp;&nbsp;&nbsp; <input type="text" class="input-xsmall" id="inputMonTimeIn"> : <input type="text" class="input-xsmall" id="inputMonTimeOut">
                                    </div>      
                                    <label class="control-label control-label-xxsmall pull-left" for="inputMonday"><input type="checkbox" name="optionsRadios" id="optionsRadios1" > Fri </label>
                                    <div clas="pull-left">
                                    <input type="text" class="input-xsmall" id="inputMonTimeIn"> : <input type="text" class="input-xsmall" id="inputMonTimeOut"> &nbsp;&nbsp;&nbsp;&nbsp; - &nbsp;&nbsp;&nbsp;&nbsp; <input type="text" class="input-xsmall" id="inputMonTimeIn"> : <input type="text" class="input-xsmall" id="inputMonTimeOut">
                                    </div>
                                    <label class="control-label control-label-xxsmall pull-left" for="inputMonday"><input type="checkbox" name="optionsRadios" id="optionsRadios1" > Sat </label>
                                    <div clas="pull-left">
                                    <input type="text" class="input-xsmall" id="inputMonTimeIn"> : <input type="text" class="input-xsmall" id="inputMonTimeOut"> &nbsp;&nbsp;&nbsp;&nbsp; - &nbsp;&nbsp;&nbsp;&nbsp; <input type="text" class="input-xsmall" id="inputMonTimeIn"> : <input type="text" class="input-xsmall" id="inputMonTimeOut">
                                    </div>
                                    <label class="control-label control-label-xxsmall pull-left" for="inputMonday"><input type="checkbox" name="optionsRadios" id="optionsRadios1" > Sun</label>
                                    <div clas="pull-left">
                                        <input type="text" class="input-xsmall" id="inputMonTimeIn"> : <input type="text" class="input-xsmall" id="inputMonTimeOut"> &nbsp;&nbsp;&nbsp;&nbsp; - &nbsp;&nbsp;&nbsp;&nbsp; <input type="text" class="input-xsmall" id="inputMonTimeIn"> : <input type="text" class="input-xsmall" id="inputMonTimeOut">
                                    </div>
                                </div>  
                                <a class="btn-grey-small btn_remove" href="#">Remove Branch</a>
                            </td>
                        </tr>
                        <tr>
                            <td class="col1 form-horizontal">
                                <div class="control-group">
                                    <label class="control-label control-label-xsmall" for="inputPromotionDescription">Location</label>
                                    <div class="pull-left">
                                        <input type="text" class="input-xxlarge inputLocation" id="inputLocation_2">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label control-label-small" for="inputPromotionDescription">Store phone number</label>
                                    <div class="pull-left">
                                        <select id="phoneNumber4" class="chosen phoneNumber" name="phoneNumber4">
                                            <option selected="selected">09</option>
                                            <option value="selling.html">08</option>
                                            <option value="buying.html">07</option>
                                            <option value="profile.html">06</option>
                                            <option value="log-out.html">05</option>
                                        </select>
                                        <input type="text" class="input-phone-number" id="inputPassword">
                                    </div>
                                    <label class="control-label control-label-small" for="inputPromotionDescription">Store phone number</label>
                                    <div class="pull-left">
                                        <select id="phoneNumber5" class="chosen phoneNumber" name="phoneNumber5">
                                            <option selected="selected">09</option>
                                            <option value="selling.html">08</option>
                                            <option value="buying.html">07</option>
                                            <option value="profile.html">06</option>
                                            <option value="log-out.html">05</option>
                                        </select>
                                        <input type="text" class="input-phone-number" id="inputPassword">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label control-label-xlarge" for="inputOpeningHours">Opening Hours (24 hour format)</label>
                                    <div class="clearfix"></div>
                                    
                                    <label class="control-label control-label-xxsmall pull-left" for="inputMonday"><input type="checkbox" name="optionsRadios" id="optionsRadios1" > Mon </label>
                                    <div clas="pull-left">
                                        <input type="text" class="input-xsmall" id="inputMonTimeIn"> : <input type="text" class="input-xsmall" id="inputMonTimeOut"> &nbsp;&nbsp;&nbsp;&nbsp; - &nbsp;&nbsp;&nbsp;&nbsp; <input type="text" class="input-xsmall" id="inputMonTimeIn"> : <input type="text" class="input-xsmall" id="inputMonTimeOut">
                                    </div>
                                    <label class="control-label control-label-xxsmall pull-left" for="inputTuesday"><input type="checkbox" name="optionsRadios" id="optionsRadios1" > Tue </label>
                                    <div clas="pull-left">
                                        <input type="text" class="input-xsmall" id="inputMonTimeIn"> : <input type="text" class="input-xsmall" id="inputMonTimeOut"> &nbsp;&nbsp;&nbsp;&nbsp; - &nbsp;&nbsp;&nbsp;&nbsp; <input type="text" class="input-xsmall" id="inputMonTimeIn"> : <input type="text" class="input-xsmall" id="inputMonTimeOut">
                                    </div> 
                                    <label class="control-label control-label-xxsmall pull-left" for="inputWednesday"><input type="checkbox" name="optionsRadios" id="optionsRadios1" > Wed </label>
                                    <div clas="pull-left">
                                        <input type="text" class="input-xsmall" id="inputMonTimeIn"> : <input type="text" class="input-xsmall" id="inputMonTimeOut"> &nbsp;&nbsp;&nbsp;&nbsp; - &nbsp;&nbsp;&nbsp;&nbsp; <input type="text" class="input-xsmall" id="inputMonTimeIn"> : <input type="text" class="input-xsmall" id="inputMonTimeOut">
                                    </div> 
                                    <label class="control-label control-label-xxsmall pull-left" for="inputMonday"><input type="checkbox" name="optionsRadios" id="optionsRadios1" > Thu </label>
                                    <div clas="pull-left">  
                                        <input type="text" class="input-xsmall" id="inputMonTimeIn"> : <input type="text" class="input-xsmall" id="inputMonTimeOut"> &nbsp;&nbsp;&nbsp;&nbsp; - &nbsp;&nbsp;&nbsp;&nbsp; <input type="text" class="input-xsmall" id="inputMonTimeIn"> : <input type="text" class="input-xsmall" id="inputMonTimeOut">
                                    </div>      
                                    <label class="control-label control-label-xxsmall pull-left" for="inputMonday"><input type="checkbox" name="optionsRadios" id="optionsRadios1" > Fri </label>
                                    <div clas="pull-left">
                                    <input type="text" class="input-xsmall" id="inputMonTimeIn"> : <input type="text" class="input-xsmall" id="inputMonTimeOut"> &nbsp;&nbsp;&nbsp;&nbsp; - &nbsp;&nbsp;&nbsp;&nbsp; <input type="text" class="input-xsmall" id="inputMonTimeIn"> : <input type="text" class="input-xsmall" id="inputMonTimeOut">
                                    </div>
                                    <label class="control-label control-label-xxsmall pull-left" for="inputMonday"><input type="checkbox" name="optionsRadios" id="optionsRadios1" > Sat </label>
                                    <div clas="pull-left">
                                    <input type="text" class="input-xsmall" id="inputMonTimeIn"> : <input type="text" class="input-xsmall" id="inputMonTimeOut"> &nbsp;&nbsp;&nbsp;&nbsp; - &nbsp;&nbsp;&nbsp;&nbsp; <input type="text" class="input-xsmall" id="inputMonTimeIn"> : <input type="text" class="input-xsmall" id="inputMonTimeOut">
                                    </div>
                                    <label class="control-label control-label-xxsmall pull-left" for="inputMonday"><input type="checkbox" name="optionsRadios" id="optionsRadios1" > Sun</label>
                                    <div clas="pull-left">
                                        <input type="text" class="input-xsmall" id="inputMonTimeIn"> : <input type="text" class="input-xsmall" id="inputMonTimeOut"> &nbsp;&nbsp;&nbsp;&nbsp; - &nbsp;&nbsp;&nbsp;&nbsp; <input type="text" class="input-xsmall" id="inputMonTimeIn"> : <input type="text" class="input-xsmall" id="inputMonTimeOut">
                                    </div>
                                </div>
                                <a class="btn-grey-small btn_remove" href="#">Remove Branch</a>
                            </td>
                        </tr>
                        <tr>
                            <td class="new-branch-area"><a href="#" class="btn-general">Add Another Branch</a></td>
                        </tr>
                      </tbody>
                      <script type="text/javascript">
                            $(function($, window, document, undefined){
                                var defaults = {
                                    bounds: true,
                                    country: null,
                                    map: false,
                                    details: false,
                                    detailsAttribute: "name",
                                    location: false,
                                }
                            });
                            var options = {
                              // types: ['(cities)'],
                               componentRestrictions: {country: 'nz'}//NewZealand only
                               
                            };
                            $('.inputLocation').click(function(){
                                var input = document.getElementById(this.id);
                                //var autocomplete = new google.maps.places.Autocomplete($("#address")[0], {country:'tr'});
                                var autocomplete = new google.maps.places.Autocomplete(input,options);
                                google.maps.event.addListener(autocomplete, 'place_changed', function() {
                                    var place = autocomplete.getPlace();
                                    console.log(place.address_components);
                                });
                            });
                        </script>
                    </table>
                    
                    <table class="table table-condensed sc-table sc-table-promotion">
                      <thead>
                        <tr class="sc-table-header">
                          <th class="col1">PROOF OF IDENTIFICATION</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                            <td class="col1 form-horizontal">
                                <div class="control-group">
                                    <label class="control-label control-label-llarge pull-left" for="inputEmailAddress">Upload a photo of your driver license</label>
                                    <div class="pull-left">
                                        <input type="text" class="input-xlarge pull-left" id="inputFile"> <a class="btn-general-small upload-btn" href="#">BROWSE</a> <img src="<@ofbizContentUrl>/shopmax-default/img/icon-question.png</@ofbizContentUrl>" rel="tooltip" data-original-title="If you are a business, you can become a Shopmax seller and create your online store" />
                                    </div>
                                </div>
                            </td>
                        </tr>
                      </tbody>
                    </table>
                    
                    <table class="table table-condensed sc-table sc-table-promotion">
                      <thead>
                        <tr class="sc-table-header">
                          <th class="col1">Payment Method</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                            <td class="col1 form-horizontal">   
                                <p class="intro-txt"><strong>Annual Fee: $800</strong></p>
                                <div class="control-group">
                                    <div class="control-group-bank">
                                        <label class="radio pull-left control-label-cc">
                                            <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked> Credit Card
                                        </label>
                                        <label class="control-label control-label-cc-inner pull-left" for="inputPromotionDescription">Card Holder Name</label>
                                        <input type="text" class="input-large pull-left" id="inputAccountName"> <img src="<@ofbizContentUrl>/shopmax-default/img/icon-question.png</@ofbizContentUrl>" rel="tooltip" data-original-title="If you are a business, you can become a Shopmax seller and create your online store" />
                                    </div>
                                    <div class="control-group-bank">
                                        <label class="control-label control-label-cc-blank pull-left" for="inputPromotionDescription">&nbsp;</label>
                                        <label class="control-label control-label-cc-inner pull-left" for="inputPromotionDescription">Card Number</label>
                                        <div class="pull-left"><input type="text" class="input-cc-xsmall" id="inputAccountName"> - <input type="text" class="input-small" id="inputAccountName"> - <input type="text" class="input-cc-large" id="inputAccountName"> - <input type="text" class="input-cc-xsmall" id="inputAccountName"></div>
                                    </div>
                                    <div class="control-group-bank">
                                        <label class="control-label control-label-cc-blank pull-left" for="inputPromotionDescription">&nbsp;</label>
                                        <label class="control-label control-label-cc-inner pull-left" for="inputPromotionDescription">Expiry Date</label>
                                        <input type="text" class="input-large pull-left" id="inputAccountName"> <img src="<@ofbizContentUrl>/shopmax-default/img/icon-question.png</@ofbizContentUrl>" rel="tooltip" data-original-title="If you are a business, you can become a Shopmax seller and create your online store" />
                                    </div>
                                    <div class="control-group-bank">
                                        <label class="control-label control-label-cc-blank pull-left" for="inputPromotionDescription">&nbsp;</label>
                                        <label class="control-label control-label-cc-inner pull-left" for="inputPromotionDescription">Security Code</label>
                                        <input type="text" class="input-large pull-left" id="inputAccountName"> <img src="<@ofbizContentUrl>/shopmax-default/img/icon-question.png</@ofbizContentUrl>" rel="tooltip" data-original-title="If you are a business, you can become a Shopmax seller and create your online store" />
                                    </div>
                                </div>
                                <br/>
                                <div class="form-inline">
                                    <label class="radio pull-left control-label-dc">
                                        <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked> Debit Card
                                    </label>
                                    <label class="control-label control-label-dc-inner pull-left" for="inputPromotionDescription"><a href="#">Download a direct debit form</a></label>
                                    <div class="clearfix"></div>
                                    <label class="control-label control-label-dc-blank pull-left" for="inputPromotionDescription">&nbsp;</label>
                                    <label class="control-label control-label-dc-inner pull-left" for="inputPromotionDescription">Upload a direct debit form</label>
                                    <div class="pull-left">
                                        <input type="text" class="input-xlarge pull-left" id="inputFile"> <a class="btn-general-small upload-btn" href="#">BROWSE</a>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </td>
                        </tr>
                      </tbody>
                    </table>
                </div>
            </form>
            <div class="sc-table-promotion footer-button">
            <a href="#" class="btn-success-small">Save</a>&nbsp;&nbsp;
            <a id="submit-createcustomer" class="btn-general-small">Submit</a>&nbsp;&nbsp;
            <a href="<@ofbizUrl>main</@ofbizUrl>" class="btn-grey-small">Cancel</a>
            </div>
        </div><!-- /.span9 -->
    </div><!-- /.row -->
</div>
<script type="text/javascript">
    $(document).ready(function() {
        /*
         *  Simple image gallery. Uses default settings
         */

        $('.fancybox').fancybox();

        /*
         *  Different effects
         */

        // Change title type, overlay closing speed
        $(".fancybox-effects-a").fancybox({
            helpers: {
                title : {
                    type : 'outside'
                },
                overlay : {
                    speedOut : 0
                }
            }
        });

        // Disable opening and closing animations, change title type
        $(".fancybox-effects-b").fancybox({
            openEffect  : 'none',
            closeEffect : 'none',

            helpers : {
                title : {
                    type : 'over'
                }
            }
        });

        // Set custom style, close if clicked, change title type and overlay color
        $(".fancybox-effects-c").fancybox({
            wrapCSS    : 'fancybox-custom',
            closeClick : true,

            openEffect : 'none',

            helpers : {
                title : {
                    type : 'inside'
                },
                overlay : {
                    css : {
                        'background' : 'rgba(238,238,238,0.85)'
                    }
                }
            }
        });

        // Remove padding, set opening and closing animations, close if clicked and disable overlay
        $(".fancybox-effects-d").fancybox({
            padding: 0,

            openEffect : 'elastic',
            openSpeed  : 150,

            closeEffect : 'elastic',
            closeSpeed  : 150,

            closeClick : true,

            helpers : {
                overlay : null
            }
        });

        /*
         *  Button helper. Disable animations, hide close button, change title type and content
         */

        $('.fancybox-buttons').fancybox({
            openEffect  : 'none',
            closeEffect : 'none',

            prevEffect : 'none',
            nextEffect : 'none',

            closeBtn  : false,

            helpers : {
                title : {
                    type : 'inside'
                },
                buttons : {}
            },

            afterLoad : function() {
                this.title = 'Image ' + (this.index + 1) + ' of ' + this.group.length + (this.title ? ' - ' + this.title : '');
            }
        });


        /*
         *  Thumbnail helper. Disable animations, hide close button, arrows and slide to next gallery item if clicked
         */

        $('.fancybox-thumbs').fancybox({
            prevEffect : 'none',
            nextEffect : 'none',

            closeBtn  : false,
            arrows    : false,
            nextClick : true,

            helpers : {
                thumbs : {
                    width  : 50,
                    height : 50
                }
            }
        });

        /*
         *  Media helper. Group items, disable animations, hide arrows, enable media and button helpers.
        */
        $('.fancybox-media')
            .attr('rel', 'media-gallery')
            .fancybox({
                openEffect : 'none',
                closeEffect : 'none',
                prevEffect : 'none',
                nextEffect : 'none',

                arrows : false,
                helpers : {
                    media : {},
                    buttons : {}
                }
            });

        /*
         *  Open manually
         */

        $("#fancybox-manual-a").click(function() {
            $.fancybox.open('1_b.jpg');
        });

        $("#fancybox-manual-b").click(function() {
            $.fancybox.open({
                href : 'iframe.html',
                type : 'iframe',
                padding : 5
            });
        });

        $("#fancybox-manual-c").click(function() {
            $.fancybox.open([
                {
                    href : '1_b.jpg',
                    title : 'My title'
                }, {
                    href : '2_b.jpg',
                    title : '2nd title'
                }, {
                    href : '3_b.jpg'
                }
            ], {
                helpers : {
                    thumbs : {
                        width: 75,
                        height: 50
                    }
                }
            });
        });
                    
        function changeTooltipColorTo(color) {              
            $('.tooltip.top .tooltip-arrow').css('border-top-color', color);
            $('.tooltip.right .tooltip-arrow').css('border-right-color', color);
            $('.tooltip.left .tooltip-arrow').css('border-left-color', color);
            $('.tooltip.bottom .tooltip-arrow').css('border-bottom-color', color);
        }           
            $("[rel=tooltip]").tooltip();
            $("[rel=tooltip]").hover(function() {changeTooltipColorTo('#00e2db')});
    });
</script>
