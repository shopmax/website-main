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
    <div class="row">
        <div class="span3 sidebar" id="side-menu">
            <div class="categories innerbox cart-summary-wrapper" style="margin-top:40px;">
                <h2>Cart summary<img src="<@ofbizContentUrl>/shopmax-default/img/icon-cart.gif</@ofbizContentUrl>"></h2>
                <div class="category-list">
                    <table class="table table-condensed cart-summary">
                        <tbody>
                            <tr><td class="col1">Sub Total</td><td class="cart-value">$195.00</td></tr>
                            <tr><td class="col1">Shipping</td><td class="cart-value">$10.00</td></tr>
                            <tr><td class="col1">Discount</td><td class="cart-value">$0.00</td></tr>
                            <tr><td class="col1">Sales Tax</td><td class="cart-value" style="padding-bottom:10px;">$15.23</td></tr>
                            <tr><td colspan="2" class="col1"><div class="cart-total">Total <div class="blue pull-right">$220.23</div></div></td></tr>
                        </tbody>
                        <tfoot>
                            <tr class="row-grey"><td colspan="2"><br>
                            <a class="btn-general" href="#">Proceed To Checkout</a><br>
                            <div class="cart-summary-or heading"><span>or</span></div>
                            <a href="#" style="padding-left:22px;"><img src="<@ofbizContentUrl>/shopmax-default/img/btn-paypal.gif</@ofbizContentUrl>"></a><br /><br />
                            </td></tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
        <div class="span9 main-content">
            <ul class="sc-step">
                <li class="step-active"><span class="badge badge-active">1</span>&nbsp;&nbsp;Shopping Cart</li>
                <li><span class="badge badge-inactive">2</span>&nbsp;&nbsp;Billing & Delivery</li>
                <li><span class="badge badge-inactive">3</span>&nbsp;&nbsp;Complete</li>
            </ul>
            <#list supplierCartItemsMap.entrySet() as entry>
                <#assign partyId = entry.getKey()/>
                <#assign shoppingCartItems = entry.getValue()/>
                <table class="table sc-table product-table">
                  <thead>
                    <tr class="sc-table-header georgia">
                      <th colspan="5">${partyId}</th>
                    </tr>
                    <tr class="sc-table-product-header">
                      <th class="col1">Product</th>
                      <th class="col2"></th>
                      <th class="col3">Unit Price</th>
                      <th class="col4">Quantity</th>
                      <th class="col5">Sub Total</th>
                    </tr>
                  </thead>
                  <tbody>
                      <#list shoppingCartItems as shoppingCartItem>
                          <tr>
                            <td class="col1"><img src="<@ofbizContentUrl>/shopmax-default/img/product-generic-75x75.jpg</@ofbizContentUrl>" /></td>
                            <td class="col2"><strong>Product name 1</strong><br />Colour - yellow</td>
                            <td class="col3"><strong>$25.00</strong></td>
                            <td class="col4"><input type="text" class="input-mini" /><br />
                              <a href="#">Delete item</a>
                            </td>
                            <td class="col5"><strong>$25.00</strong></td>
                          </tr>
                      </#list>
                      <tr class="row-grey">
                          <td colspan="5" class="col1">
                              <h5 class="heading">Delivery Options</h5>
                              <select name="scDelivery" class="drop-select chosen combo" data-search-bar="true">
                                  <option value="" selected="selected">Ship</option>
                                  <option value="1">Option 1</option>
                                  <option value="2">Option 2</option>
                              </select>
                              <select name="scDeliveryOption" class="drop-select chosen combo" data-search-bar="true">
                                  <option value="" selected="selected">Select Shipping Option</option>
                                  <option value="1">Option 1</option>
                                  <option value="2">Option 2</option>
                              </select>
                          </td>
                      </tr>
                      <tr class="row-grey">
                          <td colspan="5" class="col1" style="padding-bottom:0px;">
                              <h5 class="heading" style="padding-bottom:0px;margin:0px;">Gift Certificate or Discount Code</h5>               
                          </td>
                      </tr>
                      <tr class="row-grey sc-table-discount">
                          <td colspan="3" class="col1">
                              <input type="text" class="input-xlarge" placeholder="Enter 8 digit numbers" />
                              <a href="#" class="sc-apply-code">Apply code</a>
                          </td>
                          <td class="col4"><h5 class="heading" style="padding-left:10px;">Sub Total</h5></td>
                          <td class="col5" style="padding-right:10px;"><h5 class="blue">$145.00</h5></td>
                      </tr>
                    </tbody>
                </table>
            </#list>
            
            <table class="table sc-table">
              <thead>
                <tr class="sc-table-header-blue">
                  <th colspan="5" class="col1">Estimate Shipping and Tax</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td class="col1">
                    <h5 class="heading">Zip/Postal Code</h5>
                    <input type="text" class="input-xlarge" placeholder="Enter 4 digit numbers" /> <br />
                    By enter ZIp/Postal Code can help estimate shipping costs or finding a store located closest to you
                  </td>
                  <td class="sc-table-estimate-shipping">
                      <table class="table table-condensed">
                        <tbody>
	                        <tr><td class="col1">Sub Total</td><td class="col2">$195.00</td></tr>
	                        <tr><td class="col1">Shipping</td><td class="col2">$195.00</td></tr>
	                        <tr><td class="col1">Discount</td><td class="col2">$195.00</td></tr>
	                        <tr><td class="col1">Sales Tax</td><td class="col2" style="padding-bottom:14px;">$195.00</td></tr>
                        </tbody>
                        <tfoot>
                        	<tr><td class="col1">Total</td><td class="col2">$195.00</td></tr>
                        </tfoot>
                    </table>
                  </td>
                </tr>
              </tbody>
            </table>
            <a href="#" class="btn-green-small pull-left">Continue to Shopping</a>
            <div class="btn-checkout-wrapper">
                <div class="btn-paypal">
                    <a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/btn-paypal.gif</@ofbizContentUrl>"></a>
                </div>
                <a href="#" class="btn-general pull-right">Proceed To Checkout</a>
            </div>
         </div>
    </div>
</div>
