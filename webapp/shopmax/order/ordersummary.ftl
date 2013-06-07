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

<div class="span3 sidebar" id="side-menu">
    <div class="categories innerbox cart-summary-wrapper">
        <h2>${uiLabelMap.ShopMaxOrderSummary}<img src="<@ofbizContentUrl>/shopmax-default/img/icon-cart.gif</@ofbizContentUrl>" /></h2>
        <div class="category-list">
            <table class="table table-condensed cart-summary">
                <tbody>
                    <tr><td class="col1">Sub Total</td><td class="cart-value"><@ofbizCurrency amount=shoppingCart.getSubTotal() /></td></tr><#--$195.00-->
                    <tr><td class="col1">Shipping</td><td class="cart-value"><@ofbizCurrency amount=shoppingCart.getTotalShipping() /></td></tr><#--$10.00-->
                    <tr><td class="col1">Discount</td><td class="cart-value">
                    <#assign orderAdjustmentsTotal = 0  />
                    <#list shoppingCart.getAdjustments() as cartAdjustment>
                      <#assign orderAdjustmentsTotal = orderAdjustmentsTotal + Static["org.ofbiz.order.order.OrderReadHelper"].calcOrderAdjustment(cartAdjustment, shoppingCart.getSubTotal()) />
                    </#list>
                    <@ofbizCurrency amount=orderAdjustmentsTotal /></td></tr><#--$0.00-->
                    <tr><td class="col1">Sales Tax</td><td class="cart-value"><@ofbizCurrency amount=shoppingCart.getTotalSalesTax() /></td></tr><#--$15.23-->
                    <tr><td colspan="2" class="col1"><div class="cart-total">Total <div class="blue pull-right"><@ofbizCurrency amount=shoppingCart.getDisplayGrandTotal() /></div></div></td></tr><#--$220.23-->
                </tbody>
                <tfoot>
                    <tr class="row-grey"><td colspan="2"><br />
                        <form id="orderSubmitForm" action="<@ofbizUrl>onePageProcess</@ofbizUrl>" method="post">
                            <fieldset>
                                <#if !contactMechList?has_content && billPaymentMethod?has_content>
                                    <input type="button" id="summaryButton2" name="summaryButton2" class="btn-general pull-right summaryButton2 btn-form" value="Place Order" />
                                </#if>
                                <#if !billPaymentMethod?has_content && contactMechList?has_content>
                                    <input type="button" id="summaryButton1" name="summaryButton1" class="btn-general pull-right summaryButton1 btn-form" value="Place Order" />
                                </#if>
                                <#if contactMechList?has_content && billPaymentMethod?has_content>
                                    <input type="button" id="summaryButton3" name="summaryButton3" class="btn-general pull-right summaryButton3 btn-form" value="Place Order" />
                                </#if>
                                <#if !contactMechList?has_content && !billPaymentMethod?has_content>
                                    <input type="button" style="" id="processOrderSummaryButton" name="processOrderSummaryButton" class="btn-form btn-general pull-right processOrderSummaryButton" value="Place Order" />
                                    <input type="button" style="display: none;" id="summaryButton2" name="summaryButton2" class="btn-general pull-right summaryButton2 btn-form" value="Place Order" />
                                </#if>
                                <#-- <input type="button" id="processOrderButton" name="processOrderButton" class="btn-general processOrderSummaryButton" value="Place Order" /> -->
                                <input type="button" style="display: none;" id="processingOrderButton" name="processingOrderButton" value="${uiLabelMap.OrderSubmittingOrder}" />
                            </fieldset>
                        </form>
                    </td></tr>
                </tfoot>
            </table>
        </div>
    </div><!-- /.categories .innerbox -->
</div><!-- /.span3.sidebar -->
