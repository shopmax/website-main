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

            <table class="table table-condensed sc-table sc-table-promotion">
              <thead>
                <tr class="sc-table-header">
                  <th class="col1">User Information</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                    <td class="col1">           
                        <form class="form-horizontal pull-left">
                        <p class="intro-txt"><strong>Create a new account profile by completing the new registration form. Once you are done and logged in, you can save shopping cart list, track your order history, manage addresses, and speed up the check out process</strong></p>                                
                        <div class="control-group">
                            <label class="control-label control-label-xlarge checkbox"><input type="checkbox" class="chk_regis" name="optionsRadios" id="optionsRadios1" >&nbsp; Registered as business user <img src="<@ofbizContentUrl>/shopmax-default/img/icon-question.png</@ofbizContentUrl>" rel="tooltip" data-original-title="If you are a business, you can become a Shopmax seller and create your online store" /></label>                                    
                        </div>
                        <div class="control-group">
                        <label class="control-label control-label-small" for="inputEmailAddress">Email Address</label>
                        <div class="pull-left">
                        <input type="text" class="input-xlarge" id="inputPassword">
                        </div>
                        </div>
                        <div class="control-group">
                        <label class="control-label control-label-small" for="inputPromotionDescription">Password</label>
                        <div class="pull-left">
                            <input type="text" class="input-xlarge" id="inputPassword">
                        </div>
                        <label class="control-label control-label-small" for="inputPromotionDescription">Confirm Password</label>
                        <div class="pull-left">
                            <input type="text" class="input-xlarge" id="inputPassword">
                        </div>
                        </div>
                        <div class="control-group">
                        <label class="control-label control-label-small" for="inputPromotionDescription">First Name</label>
                        <div class="pull-left">
                            <input type="text" class="input-xlarge" id="inputPassword">
                        </div>
                        <label class="control-label control-label-small" for="inputPromotionDescription">Last Name</label>
                        <div class="pull-left">
                            <input type="text" class="input-xlarge" id="inputPassword">
                        </div>
                        </div>
                        </form>                         
                    </td>
                </tr>      
              </tbody>
            </table>    
            
            <table class="table table-condensed sc-table sc-table-promotion">
              <thead>
                <tr class="sc-table-header">
                  <th class="col1">Free Shipping</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                    <td class="col1">   
                        <form class="form-horizontal">
                        <div class="control-group">
                            <label class="control-label control-label-big" for="inputPromotionDescription">Official business name</label>
                            <div class="pull-left">
                                <input type="text" class="input-large" id="inputPassword">
                            </div>
                            <label class="control-label control-label-big" for="inputPromotionDescription">Official trading name</label>
                            <div class="pull-left">
                                <input type="text" class="input-large" id="inputPassword">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label control-label-big" for="inputPromotionDescription">Contact phone number</label>
                            <div class="pull-left">
                                <input type="text" class="input-large" id="inputPassword">
                            </div>                              
                        </div>
                        
                        <div class="form-inline">
                        <label class="radio">
                        <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>
                        Use your own domain name
                        </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;http://&nbsp;&nbsp;&nbsp;<input type="text" class="input-url"/> <img src="<@ofbizContentUrl>/shopmax-default/img/icon-question.png</@ofbizContentUrl>" rel="tooltip" data-original-title="If you are a business, you can become a Shopmax seller and create your online store" /><div class="sc-or"><strong>OR</strong></div><label class="radio">
                        <div class="control-group">
                        <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
                        Create a free domain with shopmax
                        </label>&nbsp;&nbsp;&nbsp;&nbsp;http://&nbsp;&nbsp;
                        <input type="text" class="input-newurl" >
                        .shopmax.co.nz <img src="<@ofbizContentUrl>/shopmax-default/img/icon-question.png</@ofbizContentUrl>" rel="tooltip" data-original-title="If you are a business, you can become a Shopmax seller and create your online store" />
                        </div>
                                                                                
                        </div>
                        <br/>
                        <div class="control-group">
                            <div class="control-group-bank">
                            <label class="control-label control-label-big pull-left" for="inputPromotionDescription">Bank account detail</label>
                            <label class="control-label control-label-bank pull-left" for="inputPromotionDescription">Account Name</label>
                            <input type="text" class="input-large pull-left" id="inputAccountName"> <img src="<@ofbizContentUrl>/shopmax-default/img/icon-question.png</@ofbizContentUrl>" rel="tooltip" data-original-title="If you are a business, you can become a Shopmax seller and create your online store" />
                            </div>
                            <div class="clearfix"></div>
                            <label class="control-label control-label-big pull-left" for="inputPromotionDescription">&nbsp;</label>
                            <label class="control-label control-label-bank pull-left" for="inputPromotionDescription">Account Number</label>
                            <div class="pull-left"><input type="text" class="input-cc-xsmall" id="inputAccountName"> - <input type="text" class="input-small" id="inputAccountName"> - <input type="text" class="input-cc-large" id="inputAccountName"> - <input type="text" class="input-cc-xsmall" id="inputAccountName"></div>
                        </div>
                        <div class="clearfix"></div>
                        </form>
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
                    <td class="col1">   
                        <form class="form-horizontal">
                        <div class="control-group">
                            <label class="control-label control-label-xsmall" for="inputPromotionDescription">Location</label>
                            <div class="pull-left">
                                <input type="text" class="input-xxlarge" id="inputLocation">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label control-label-small" for="inputPromotionDescription">Store Phone number</label>
                            <div class="pull-left">
                                <select id="phoneNumber1" class="chosen" name="phoneNumber1">
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
                                <select id="phoneNumber2" class="chosen" name="phoneNumber2">
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
                        </form>
                        
                    </td>                       
                </tr>
                <tr>
                    <td class="col1">
                        <form class="form-horizontal">
                        <div class="control-group">
                            <label class="control-label control-label-xsmall" for="inputPromotionDescription">Location</label>
                            <div class="pull-left">
                                <input type="text" class="input-xxlarge" id="inputLocation">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label control-label-small" for="inputPromotionDescription">Store Phone number</label>
                            <div class="pull-left">
                                <select id="phoneNumber3" class="chosen" name="phoneNumber1">
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
                                <select id="phoneNumber4" class="chosen" name="phoneNumber2">
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
                        </form>
                    </td>
                </tr>
                <tr>
                    <td class="new-branch-area"><a href="#" class="btn-general">Add Another Branch</a></td>
                </tr>
              </tbody>
             </table> 
            
            <table class="table table-condensed sc-table sc-table-promotion">
              <thead>
                <tr class="sc-table-header">
                  <th class="col1">PROOF OF IDENTIFICATION</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                    <td class="col1">
                        <form class="form-horizontal">
                        <div class="control-group">
                            <label class="control-label control-label-llarge pull-left" for="inputEmailAddress">Upload a photo of your driver license</label>
                            <div class="pull-left">
                                <input type="text" class="input-xlarge pull-left" id="inputFile"> <a class="btn-general-small upload-btn" href="#">BROWSE</a> <img src="<@ofbizContentUrl>/shopmax-default/img/icon-question.png</@ofbizContentUrl>" rel="tooltip" data-original-title="If you are a business, you can become a Shopmax seller and create your online store" />
                            </div>
                        </div>
                        </form>
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
                    <td class="col1">   
                        <form class="form-horizontal">
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
                        </form>
                    </td>
                </tr>      
              </tbody>
            </table>
            <div class="sc-table-promotion footer-button">
            <a href="#" class="btn-success-small">Save</a>&nbsp;&nbsp;
            <a href="#" class="btn-general-small">Submit</a>&nbsp;&nbsp;
            <a href="<@ofbizUrl>main</@ofbizUrl>" class="btn-grey-small">Cancel</a>
            </div>
        </div><!-- /.span9 -->
    </div><!-- /.row -->    
</div>
