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
        <div class="span3 sidebar" id="side-menu">
            <div class="categories innerbox cart-summary-wrapper">
                <h2>${uiLabelMap.ShopMaxOrderSummary}<img src="<@ofbizContentUrl>/shopmax-default/img/icon-cart.gif</@ofbizContentUrl>" /></h2>
                <div class="category-list">
                    <table class="table table-condensed cart-summary">
                        <tbody>
                            <tr><td class="col1">Sub Total</td><td class="cart-value">$195.00</td></tr>
                            <tr><td class="col1">Shipping</td><td class="cart-value">$10.00</td></tr>
                            <tr><td class="col1">Discount</td><td class="cart-value">$0.00</td></tr>
                            <tr><td class="col1">Sales Tax</td><td class="cart-value">$15.23</td></tr>
                            <tr><td colspan="2" class="col1"><div class="cart-total">Total <div class="blue pull-right">$220.23</div></div></td></tr>
                        </tbody>
                        <tfoot>
                            <tr class="row-grey"><td colspan="2"><br />
                            <a href="#" class="btn-general">Place Order</a><br/><br />
                            </td></tr>
                        </tfoot>
                    </table>
                </div>
            </div><!-- /.categories .innerbox -->
        </div><!-- /.span3.sidebar -->        
        