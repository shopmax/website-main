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
<script src="<@ofbizContentUrl>/shopmax-default/js/registration.js</@ofbizContentUrl>" type="text/javascript"></script>
<script type="text/javascript" src="http://jzaefferer.github.com/jquery-validation/jquery.validate.js"></script>

<div class="container content">
    <div id="load-script"></div>
    <!-- include breadcrumb -->
    ${screens.render("component://shopmax/widget/ShopMaxScreens.xml#Breadcrumbs")}
    <div id="load-javascript"></div>
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
        <div class="span9 main-content" id="abc">
            <form action="<@ofbizUrl>createcustomer</@ofbizUrl>" id="createcustomer" name="createcustomer" method="post" enctype="multipart/form-data">
                <input type="hidden" name="productStoreId" value="${productStoreId}"/>
                <input type="hidden" name="businessUser" id="businessUser" value="N"/>
                <div id="userinformation">
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
                                        <input type="text" class="input-xlarge check" id="emailAddress" name="CUSTOMER_EMAIL">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label control-label-small" for="inputPromotionDescription">Password</label>
                                    <div class="pull-left">
                                        <input type="password" class="input-xlarge check" id="currentPassword" name="PASSWORD">
                                    </div>
                                    <label class="control-label control-label-small" for="inputPromotionDescription">Confirm Password</label>
                                    <div class="pull-left">
                                        <input type="password" class="input-xlarge check" id="currentPasswordVerify" name="CONFIRM_PASSWORD">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label control-label-small" for="inputPromotionDescription">First Name</label>
                                    <div class="pull-left">
                                        <input type="text" class="input-xlarge check" id="firstName" name="USER_FIRST_NAME">
                                    </div>
                                    <label class="control-label control-label-small" for="inputPromotionDescription">Last Name</label>
                                    <div class="pull-left">
                                        <input type="text" class="input-xlarge check" id="lastName" name="USER_LAST_NAME">
                                    </div>
                                </div>
                            </td>
                        </tr>
                      </tbody>
                    </table>
                    <div class="business-guide imp-info hidden">
                        <p>To become a seller on Shopmax, you must be a registered business in New Zealand</p>
                    </div>
                </div>
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
                                    <label class="control-label control-label-big" for="inputPromotionDescription">Official Business Name</label>
                                    <div class="pull-left">
                                        <input type="text" class="input-large check" id="businessName" name="officialBusinessName">
                                    </div>
                                    <label class="control-label control-label-big" for="inputPromotionDescription">Official Trading Name</label>
                                    <div class="pull-left">
                                        <input type="text" class="input-large" id="tradingName" name="officialTradingName">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label control-label-big" for="inputPromotionDescription">Contact Phone Number</label>
                                    <select id="phoneNumber_select_0" class="chosen phoneNumber">
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
                                    <div class="pull-left">
                                        <input type="text" class="input-large phoneNumberText check" id="phoneNumber_text_0">
                                    </div>
                                    <input type="hidden" name="contactPhoneNumber" id="phoneNumber_0" value="">
                                </div>
                                <div class="control-group">
                                    <label class="control-label control-label-text" for="inputPromotionDescription">TXT Notification Phone Number</label>
                                    <select id="phoneNumber_select_1" class="chosen phoneNumber">
                                        <option selected="selected">020</option>
                                        <option>021</option>
                                        <option>022</option>
                                        <option>027</option>
                                        <option>028</option>
                                        <option>029</option>
                                    </select>
                                    <div class="pull-left">
                                        <input type="text" class="input-large phoneNumberText" id="phoneNumber_text_1">
                                    </div>
                                    <label class="control-label control-label-text2" for="inputPromotionDescription">(We will send TXT notification to this phone number when order arrives)</label>
                                    <input type="hidden" name="notificationPhoneNumber" id="phoneNumber_1" value="">
                                </div>
                                <div class="control-group">
                                    <div class="form-inline">
                                        <label class="radio">
                                        <input type="radio" name="optionsRadios" id="optionsRadiosYes" class="optionsRadios" checked>
                                        Use your own domain name
                                        </label>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;http://&nbsp;&nbsp;&nbsp;
                                        <input type="text" class="input-url check" id="domianName" name="ownDomainName"/><img src="<@ofbizContentUrl>/shopmax-default/img/icon-question.png</@ofbizContentUrl>" rel="tooltip" data-original-title="If you are a business, you can become a Shopmax seller and create your online store" /><div class="sc-or"><strong>OR</strong></div><label class="radio">
                                        <input type="radio" name="optionsRadios" id="optionsRadiosNo" class="optionsRadios">
                                        Create a free domain with shopmax
                                        </label>
                                        &nbsp;&nbsp;&nbsp;&nbsp;http://&nbsp;&nbsp;
                                        <input type="text" class="input-newurl" id="subDomain" name="freeDomainName">
                                        <input type="hidden" name="checkDomain" id="checkDomain" value="Y">
                                        .shopmax.co.nz <img src="<@ofbizContentUrl>/shopmax-default/img/icon-question.png</@ofbizContentUrl>" rel="tooltip" data-original-title="If you are a business, you can become a Shopmax seller and create your online store" />
                                    </div>
                                </div>
                                <br/>
                                <div class="control-group">
                                    <input type="hidden" name="routingNumber" value="null"/>
                                    <input type="hidden" name="accountType" value="null"/>
                                    <input type="hidden" name="bankName" value="null"/>
                                    <div class="control-group-bank">
                                    <label class="control-label control-label-big pull-left" for="inputPromotionDescription">Bank Account Detail</label>
                                    <label class="control-label control-label-bank pull-left" for="inputPromotionDescription">Account Name</label>
                                    <input type="text" class="input-large pull-left check" id="inputAccountName" name="nameOnAccount"> <img src="<@ofbizContentUrl>/shopmax-default/img/icon-question.png</@ofbizContentUrl>" rel="tooltip" data-original-title="If you are a business, you can become a Shopmax seller and create your online store" />
                                    </div>
                                    <div class="clearfix"></div>
                                    <label class="control-label control-label-big pull-left" for="inputPromotionDescription">&nbsp;</label>
                                    <label class="control-label control-label-bank pull-left" for="inputPromotionDescription">Account Number</label>
                                    <div class="pull-left"><input type="text" maxlength="2" class="input-cc-xsmall accountNumber check" id="accountNumber-0" name="accountNumber-0"> - <input type="text" maxlength="4" class="input-small accountNumber check" id="accountNumber-1" name="accountNumber-1"> - <input type="text" maxlength="7" class="input-cc-large accountNumber check" id="accountNumber-2" name="accountNumber-2"> - <input type="text" maxlength="2" class="input-cc-xsmall accountNumber check" id="accountNumber-3" name="accountNumber-3"></div>
                                    <input type="hidden" name="accountNumber" id="accountNumber" value="">
                                </div>
                                <div class="control-group">
                                    <label class="control-label control-label-llarge pull-left" for="inputEmailAddress">Upload your shop's logo (153x153)</label>
                                    <div class="pull-left">
                                        <input type="text" class="input-xlarge pull-left" id="yourBtn" onclick="getFile('')">
                                        <a class="btn-general-small upload-btn" onclick="getFile('')">BROWSE</a>
                                        <img src="<@ofbizContentUrl>/shopmax-default/img/icon-question.png</@ofbizContentUrl>" rel="tooltip" data-original-title="If you are a business, you can become a Shopmax seller and create your online store" />
                                        <div style='height: 0px;width:0px; overflow:hidden;'><input id="upfile" type="file" onchange="sub(this,'')" name="uploadedFile"/></div>
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
                        <tbody id="tr-physical-stores">
                            <tr class="index-tr-physical-stores" id="tr-physical-0">
                                <td class="col1 form-horizontal" id="physical">
                                    <div class="control-group">
                                        <label class="control-label control-label-xsmall" for="inputPromotionDescription">Branch Name</label>
                                        <div class="pull-left">
                                            <input type="text" class="input-xxlarge branchName" id="branchName_0" name="branchName">
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label control-label-xsmall" for="inputPromotionDescription">Location</label>
                                        <div class="pull-left">
                                            <input type="text" class="input-xxlarge inputLocation" id="inputLocation_0" onclick="inputLocation('0')">
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label control-label-small" for="inputPromotionDescription">Store Phone Number</label>
                                        <div class="pull-left">
                                            <select id="phy_phone_select_0" class="chosen">
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
                                            <input type="text" class="input-phone-number" id="phy_phone_text_0">
                                        </div>
                                        <label class="control-label control-label-small" for="inputPromotionDescription">Store Fax Number</label>
                                        <div class="pull-left">
                                            <select id="phy_fax_select_0" class="chosen">
                                                <option selected="selected">03</option>
                                                <option>04</option>
                                                <option>06</option>
                                                <option>07</option>
                                                <option>09</option>
                                                <option>0508</option>
                                                <option>0800</option>
                                            </select>
                                            <input type="text" class="input-phone-number" id="phy_fax_text_0">
                                        </div>
                                    </div>
                                    <div class='control-group'>
                                        <label class='control-label control-label-xlarge' for='inputOpeningHours'>Opening Hours (24 hour format)</label>
                                        <div class='clearfix'></div>
                                        <label class='control-label control-label-xxsmall pull-left' for='inputMonday'><input type='checkbox' name='optionsRadios' id='mon_check_0' > Mon </label>
                                        <div clas='pull-left'>
                                            <input type='text' class='input-xsmall input-time' id='mon_o_0_0'> : <input type='text' class='input-xsmall input-time' id='mon_o_1_0'> &nbsp;&nbsp;&nbsp;&nbsp; - &nbsp;&nbsp;&nbsp;&nbsp; <input type='text' class='input-xsmall input-time' id='mon_c_0_0'> : <input type='text' class='input-xsmall input-time' id='mon_c_1_0'>
                                        </div>
                                        <label class='control-label control-label-xxsmall pull-left' for='inputTuesday'><input type='checkbox' name='optionsRadios' id='tue_check_0' > Tue </label>
                                        <div clas='pull-left'>
                                            <input type='text' class='input-xsmall input-time' id='tue_o_0_0'> : <input type='text' class='input-xsmall input-time' id='tue_o_1_0'> &nbsp;&nbsp;&nbsp;&nbsp; - &nbsp;&nbsp;&nbsp;&nbsp; <input type='text' class='input-xsmall input-time' id='tue_c_0_0'> : <input type='text' class='input-xsmall input-time' id='tue_c_1_0'>
                                        </div>
                                        <label class='control-label control-label-xxsmall pull-left' for='inputWednesday'><input type='checkbox' name='optionsRadios' id='wed_check_0' > Wed </label>
                                        <div clas='pull-left'>
                                            <input type='text' class='input-xsmall input-time' id='wed_o_0_0'> : <input type='text' class='input-xsmall input-time' id='wed_o_1_0'> &nbsp;&nbsp;&nbsp;&nbsp; - &nbsp;&nbsp;&nbsp;&nbsp; <input type='text' class='input-xsmall input-time' id='wed_c_0_0'> : <input type='text' class='input-xsmall input-time' id='wed_c_1_0'>
                                        </div>
                                        <label class='control-label control-label-xxsmall pull-left' for='inputThursday'><input type='checkbox' name='optionsRadios' id='thu_check_0' > Thu </label>
                                        <div clas='pull-left'>
                                            <input type='text' class='input-xsmall input-time' id='thu_o_0_0'> : <input type='text' class='input-xsmall input-time' id='thu_o_1_0'> &nbsp;&nbsp;&nbsp;&nbsp; - &nbsp;&nbsp;&nbsp;&nbsp; <input type='text' class='input-xsmall input-time' id='thu_c_0_0'> : <input type='text' class='input-xsmall input-time' id='thu_c_1_0'>
                                        </div>
                                        <label class='control-label control-label-xxsmall pull-left' for='inputFriday'><input type='checkbox' name='optionsRadios' id='fri_check_0' > Fri </label>
                                        <div clas='pull-left'>
                                        <input type='text' class='input-xsmall input-time' id='fri_o_0_0'> : <input type='text' class='input-xsmall input-time' id='fri_o_1_0'> &nbsp;&nbsp;&nbsp;&nbsp; - &nbsp;&nbsp;&nbsp;&nbsp; <input type='text' class='input-xsmall input-time' id='fri_c_0_0'> : <input type='text' class='input-xsmall input-time' id='fri_c_1_0'>
                                        </div>
                                        <label class='control-label control-label-xxsmall pull-left' for='inputSaterday'><input type='checkbox' name='optionsRadios' id='sat_check_0' > Sat </label>
                                        <div clas='pull-left'>
                                        <input type='text' class='input-xsmall input-time' id='sat_o_0_0'> : <input type='text' class='input-xsmall input-time' id='sat_o_1_0'> &nbsp;&nbsp;&nbsp;&nbsp; - &nbsp;&nbsp;&nbsp;&nbsp; <input type='text' class='input-xsmall input-time' id='sat_c_0_0'> : <input type='text' class='input-xsmall input-time' id='sat_c_1_0'>
                                        </div>
                                        <label class='control-label control-label-xxsmall pull-left' for='inputSunday'><input type='checkbox' name='optionsRadios' id='sun_check_0' > Sun</label>
                                        <div clas='pull-left'>
                                            <input type='text' class='input-xsmall input-time' id='sun_o_0_0'> : <input type='text' class='input-xsmall input-time' id='sun_o_1_0'> &nbsp;&nbsp;&nbsp;&nbsp; - &nbsp;&nbsp;&nbsp;&nbsp; <input type='text' class='input-xsmall input-time' id='sun_c_0_0'> : <input type='text' class='input-xsmall input-time' id='sun_c_1_0'>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                        <tr>
                            <td class="new-branch-area"><a class="btn-general" id="add-another-branch">Add Another Branch</a></td>
                            <input type="hidden" name="physicalNum" id="physicalNum"/>
                            <input type="hidden" name="physicalBranchName" id="physicalBranchName"/>
                            <input type="hidden" name="physicalLocation" id="physicalLocation"/>
                            <input type="hidden" name="physicalPhone" id="physicalPhone"/>
                            <input type="hidden" name="physicalTime" id="physicalTime"/>
                        </tr>
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
                                        <input type="text" class="input-xlarge pull-left" id="yourBtn1" onclick="getFile(1)">
                                        <a class="btn-general-small upload-btn" onclick="getFile(1)">BROWSE</a>
                                        <img src="<@ofbizContentUrl>/shopmax-default/img/icon-question.png</@ofbizContentUrl>" rel="tooltip" data-original-title="If you are a business, you can become a Shopmax seller and create your online store" />
                                        <div style='height: 0px;width:0px; overflow:hidden;'><input id="upfile1" type="file" onchange="sub(this,1)" name="uploadedFile1"/></div>
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
                                            <input type="radio" name="optionsRadios1" id="optionsRadios2" class="optionsRadios" checked> Credit Card
                                        </label>
                                        <label class="control-label control-label-cc-inner pull-left" for="inputPromotionDescription">Card Holder Name</label>
                                        <input type="text" class="input-large pull-left check" id="cardHolderName"><img src="<@ofbizContentUrl>/shopmax-default/img/icon-question.png</@ofbizContentUrl>" rel="tooltip" data-original-title="If you are a business, you can become a Shopmax seller and create your online store" />
                                        <input type="hidden" id="firstNameOnCard" name="firstNameOnCard">
                                        <input type="hidden" id="lastNameOnCard" name="lastNameOnCard">
                                    </div>
                                    <div class="control-group-bank">
                                        <label class="control-label control-label-cc-blank pull-left" for="inputPromotionDescription">&nbsp;</label>
                                        <label class="control-label control-label-cc-inner pull-left" for="inputPromotionDescription">Card Number</label>
                                        <div class="pull-left"><input type="text" maxlength="4" class="input-small cardNumber check" id="cardNumber-0"> - <input type="text" maxlength="4" class="input-small cardNumber check" id="cardNumber-1"> - <input type="text" maxlength="4" class="input-small cardNumber check" id="cardNumber-2"> - <input type="text" maxlength="4" class="input-small cardNumber check" id="cardNumber-3"></div>
                                        <input type="hidden" id="cardNumber" name="cardNumber">
                                    </div>
                                    <div class="control-group-bank">
                                        <label class="control-label control-label-cc-blank pull-left" for="inputPromotionDescription">&nbsp;</label>
                                        <label class="control-label control-label-cc-inner pull-left" for="inputPromotionDescription">Expiry Date</label>
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
                                        <input type="hidden" class="input-large pull-left" id="expireDate" name="expireDate"> <img src="<@ofbizContentUrl>/shopmax-default/img/icon-question.png</@ofbizContentUrl>" rel="tooltip" data-original-title="If you are a business, you can become a Shopmax seller and create your online store" />
                                    </div>
                                    <div class="control-group-bank">
                                        <label class="control-label control-label-cc-blank pull-left" for="inputPromotionDescription">&nbsp;</label>
                                        <label class="control-label control-label-cc-inner pull-left" for="inputPromotionDescription">Security Code</label>
                                        <input type="text" class="input-cc-xsmall pull-left check" id="cvcNumber" name="cvc" maxlength="3"> <img src="<@ofbizContentUrl>/shopmax-default/img/icon-question.png</@ofbizContentUrl>" rel="tooltip" data-original-title="If you are a business, you can become a Shopmax seller and create your online store" />
                                    </div>
                                </div>
                                <br/>
                                <div class="form-inline">
                                    <label class="radio pull-left control-label-dc">
                                        <input type="radio" name="optionsRadios1" id="optionsRadios3" class="optionsRadios"> Debit Card
                                    </label>
                                    <label class="control-label control-label-dc-inner pull-left" for="inputPromotionDescription"><a href="#">Download a direct debit form</a></label>
                                    <div class="clearfix"></div>
                                    <label class="control-label control-label-dc-blank pull-left" for="inputPromotionDescription">&nbsp;</label>
                                    <label class="control-label control-label-dc-inner pull-left" for="inputPromotionDescription">Upload a direct debit form</label>
                                    <div class="pull-left">
                                        <input type="text" class="input-xlarge pull-left" id="yourBtn2" onclick="getFile(2)">
                                        <a class="btn-general-small upload-btn" onclick="getFile(2)">BROWSE</a>
                                        <div style='height: 0px;width:0px; overflow:hidden;'><input id="upfile2" type="file" onchange="sub(this,2)" name="uploadedFile2"/></div>
                                    </div>
                                </div>
                                <input type="hidden" name="paymentMethodOption" id="paymentMethodOption" value="Y">
                                <div class="clearfix"></div>
                            </td>
                        </tr>
                      </tbody>
                    </table>
                </div>
            </form>
            <div class="sc-table-promotion footer-button">
            <#-- <a href="#" class="btn-success-small">Save</a>&nbsp;&nbsp; -->
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
