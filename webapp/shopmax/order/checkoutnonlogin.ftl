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

<div class="container content shopping-cart">
    <#include "component://shopmax/webapp/shopmax/includes/breadcrum.ftl" />
    <div class="row">
        <#include "component://shopmax/webapp/shopmax/order/ordersummary.ftl" />
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
                        Do you already have an account?&nbsp;&nbsp;<img src="<@ofbizContentUrl>/shopmax-default/img/icon-hand-right.gif</@ofbizContentUrl>" />&nbsp;&nbsp;Login now !
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
                            <input type="text" class="input-xxlarge required" placeholder="First Name" />
                            <input type="text" class="input-xxlarge required" placeholder="Last Name" />
                        </div>
                        <div class="form-inline">
                            <input type="text" class="input-xxlarge required" placeholder="Phone Number" />
                            <input type="text" class="input-xxlarge required" placeholder="Email Address" />
                            <input type="text" class="input-xxlarge" placeholder="Fax Number (optional)" />
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="col1">
                        <h5 class="heading">Shipping Address</h5>
                        <div class="form-inline">
                            <input type="text" class="input-xxxlarge required" placeholder="Street Address" />
                            <input type="text" class="input-xxlarge" placeholder="Zip/ Postal Code" />
                        </div>
                        <div class="form-inline">
                            <input type="text" class="input-xxxlarge" placeholder="Additional Address Info (optional)" />
                            <select name="scZip" class="drop-select chosen combo" data-search-bar="true">
                                <option value="" selected="selected">Zip Return City, State</option>
                                <option value="1">Option 1</option>
                                <option value="2">Option 2</option>
                            </select>
                        </div>
                    </td>
                </tr>
              </tbody>
            </table>
            <table class="table table-condensed sc-table sc-table-shipping">
              <thead>
                <tr class="sc-table-product-header">
                  <th class="col1"><div class="pull-left">Billing Information</div>
                      <label class="same-as">
                        <input type="checkbox">Same as shipping information
                      </label>
                  </th>
                </tr>
              </thead>
              <tbody>
                <tr>
                    <td class="col1">
                        <h5 class="heading">Shipping Contact</h5>
                        
                        <div class="form-inline">
                            <input type="text" class="input-xxlarge required" placeholder="First Name" />
                            <input type="text" class="input-xxlarge required" placeholder="Last Name" />
                        </div>
                        <div class="form-inline">
                            <input type="text" class="input-xxlarge required" placeholder="Phone Number" />
                            <input type="text" class="input-xxlarge required" placeholder="Email Address" />
                            <input type="text" class="input-xxlarge" placeholder="Fax Number (optional)" />
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="col1">
                        <h5 class="heading">Shipping Address</h5>
                        
                        <div class="form-inline">
                            <input type="text" class="input-xxxlarge required" placeholder="Street Address" />
                            <input type="text" class="input-xxlarge" placeholder="Zip/ Postal Code" />
                        </div>
                        <div class="form-inline">
                            <input type="text" class="input-xxxlarge" placeholder="Additional Address Info (optional)" />
                            <select name="scZip" class="drop-select chosen combo" data-search-bar="true">
                                <option value="" selected="selected">Zip Return City, State</option>
                                <option value="1">Option 1</option>
                                <option value="2">Option 2</option>
                            </select>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="col1">
                        <h5 class="heading">Payment Information</h5>
                        <div class="form-inline">
                            <select name="scZip" class="drop-select chosen combo" data-search-bar="true">
                                <option value="" selected="selected">Select Card Type</option>
                                <option value="1">Option 1</option>
                                <option value="2">Option 2</option>
                            </select>
                            <input type="text" class="input-xxlarge required" placeholder="Card Number" />
                        </div>
                        <div class="form-inline">
                            <strong class="grey">Expires</strong>&nbsp;
                            <select name="scMonth" class="drop-select chosen combo" data-search-bar="true">
                                <option value="" selected="selected">Month</option>
                                <option value="1">Option 1</option>
                                <option value="2">Option 2</option>
                            </select>   
                            <select name="scYear" class="drop-select chosen combo" data-search-bar="true">
                                <option value="" selected="selected">Year</option>
                                <option value="1">Option 1</option>
                                <option value="2">Option 2</option>
                            </select>
                            <input type="text" class="input-medium required" placeholder="Security Code" />
                            <img src="<@ofbizContentUrl>/shopmax-default/img/icon-card.gif</@ofbizContentUrl>" />
                            <a href="#">What is this?</a>
                        </div>
                    </td>
                </tr>
              </tbody>
            </table>
            <table class="table table-condensed sc-table sc-table-shipping">
              <thead>
                <tr class="sc-table-product-header">
                  <th class="col1"><div class="pull-left">Account</div>
                      <label class="same-as">
                        <input type="checkbox">Create a user account
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
            <a href="#" class="btn-general pull-right">Place Order</a>
        </div><!-- /.span9 -->
    </div><!-- /.row -->
</div> <!-- /container -->
