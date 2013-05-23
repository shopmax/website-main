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

<table class="table sc-table sc-table-order ">
    <thead>
        <tr class="sc-table-header-blue">
            <th colspan="5" class="col1">
                <div class="pull-left">${uiLabelMap.OrderSummary}</div> <button class="btn btn-mini sc-edit-cart blue">Edit Cart</button>
            </th>
        </tr>
    </thead>
    <tbody>
        <#list shoppingCart.items() as cartLine>
        <tr>
          <td class="col1">
          <#if cartLine.getProductId()?exists>
            <#if cartLine.getParentProductId()?exists>
              <#assign parentProductId = cartLine.getParentProductId() />
            <#else>
              <#assign parentProductId = cartLine.getProductId() />
            </#if>
            <#assign smallImageUrl = Static["org.ofbiz.product.product.ProductContentWrapper"].getProductContentAsText(cartLine.getProduct(), "SMALL_IMAGE_URL", locale, dispatcher)?if_exists />
              <#if !smallImageUrl?string?has_content><#assign smallImageUrl = "/images/defaultImage.jpg" /></#if>
              <img src="<@ofbizContentUrl>${requestAttributes.contentPathPrefix?if_exists}${smallImageUrl}</@ofbizContentUrl>" width="100px" height="100px" />
          <td class="col2">
            <strong class="green">
                <#list supplierCartItemsMap.entrySet() as entry>
                <#assign partyId = entry.getKey()/>
                <#assign shoppingCartItems = entry.getValue()/>
                ${cartContext.getSupplierName(partyId)}
                </#list>
            </strong><br />
            <strong>${cartLine.getName()?if_exists}</strong><br />
              Colour - yellow</td>
          <td class="col3"><strong><@ofbizCurrency amount=cartLine.getDisplayPrice()/></strong></td>
          <td class="col4">${cartLine.getQuantity()?string.number}</td>
          <td class="col5"><strong><@ofbizCurrency amount=cartLine.getDisplayItemSubTotal() /></strong></td>
        </tr>
        </#if>
        </#list>
        <tr>
          <td colspan="3" style="width:400px;">
            &nbsp;
          </td>
          <td colspan="2" class="sc-table-estimate-shipping">
            <table class="table table-condensed sc-table-order-total">
                <tbody>
                <tr><td class="col1">Sub Total</td><td class="col2"><@ofbizCurrency amount=shoppingCart.getSubTotal() /></td></tr>
                <tr><td class="col1">Shipping</td><td class="col2"><@ofbizCurrency amount=shoppingCart.getTotalShipping() /></td></tr>
                <tr><td class="col1">Discount</td>
                    <td class="col2">
                        <#assign orderAdjustmentsTotal = 0  />
                        <#list shoppingCart.getAdjustments() as cartAdjustment>
                          <#assign orderAdjustmentsTotal = orderAdjustmentsTotal + Static["org.ofbiz.order.order.OrderReadHelper"].calcOrderAdjustment(cartAdjustment, shoppingCart.getSubTotal()) />
                        </#list>
                        <@ofbizCurrency amount=orderAdjustmentsTotal />
                    </td>
                </tr>
                <tr><td class="col1">Sales Tax</td><td class="col2" style="padding-bottom:15px;"><@ofbizCurrency amount=shoppingCart.getTotalSalesTax() /></td></tr>
                </tbody>
                <tfoot>
                <tr><td class="col1">Total</td><td class="blue col2"><@ofbizCurrency amount=shoppingCart.getDisplayGrandTotal() /></td></tr>
                </tfoot>
            </table>
          </td>
        </tr>
    </tbody>
</table>