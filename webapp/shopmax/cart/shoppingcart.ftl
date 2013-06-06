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
    function deleteItem(event, cartLineIndex) {
        event.preventDefault();
        var newForm = jQuery('<form>', {
            'action': '<@ofbizUrl>modifycart</@ofbizUrl>',
            'method': 'post',
            'target': '_top'
        }).append(jQuery('<input>', {
            'name': 'removeSelected',
            'value': 'true',
            'type': 'hidden'
        })).append(jQuery('<input>', {
            'name': 'selectedItem',
            'value': cartLineIndex,
            'type': 'hidden'
        }));
        newForm.appendTo('body').submit();
    }
    $(function(){
        $("[id^='scShipOption_']").css({'display':'none'});
        $('.scDelivery').change(function(){
            var partyId = $('#'+this.id).val().split('-');
            if(partyId[0] == 'PICKUP'){
                $("#scShipOption_"+partyId[1]).val($("#scShipOption_"+partyId[1]+"option:first").val());
                $('#scShipOption_'+partyId[1]+'_chzn').find('span').text('Select Shipping Option');
                $('#scShipOption_'+partyId[1]+'_chzn').css({'display':'none'});
                $('#scBranchStore_'+partyId[1]+'_chzn').css({'display':''});
            }
            else{
                $("#scBranchStore_"+partyId[1]).val($("#scBranchStore_"+partyId[1]+"option:first").val());
                $('#scBranchStore_'+partyId[1]+'_chzn').find('span').text('Select Branch Store');
                $('#scBranchStore_'+partyId[1]+'_chzn').css({'display':'none'});
                $('#scShipOption_'+partyId[1]+'_chzn').css({'display':''});
            }
        });
    });
</script>
<div class="container content shopping-cart">
    <div class="row">
        <div class="span3 sidebar" id="side-menu">
            <div class="categories innerbox cart-summary-wrapper" style="margin-top:40px;">
                <h2>Cart summary<img src="<@ofbizContentUrl>/shopmax-default/img/icon-cart.gif</@ofbizContentUrl>"></h2>
                <div class="category-list">
                    <table class="table table-condensed cart-summary">
                        <tbody>
                            <tr><td class="col1">Sub Total</td><td class="cart-value"><@ofbizCurrency amount=shoppingCart.getDisplayGrandTotal()/></td></tr>
                            <tr><td class="col1">Shipping</td><td class="cart-value">$0.00</td></tr>
                            <tr><td class="col1">Discount</td><td class="cart-value">$0.00</td></tr>
                            <tr><td class="col1">Sales Tax</td><td class="cart-value" style="padding-bottom:10px;">$0.00</td></tr>
                            <tr><td colspan="2" class="col1"><div class="cart-total">Total <div class="blue pull-right"><@ofbizCurrency amount=shoppingCart.getDisplayGrandTotal()/></div></div></td></tr>
                        </tbody>
                        <tfoot>
                            <tr class="row-grey"><td colspan="2"><br>
                            <a id="processShoppingCartButton" class="btn-general" href="#">Proceed To Checkout</a><br>
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
            <form id="shippingCartSubmitForm" action="<@ofbizUrl>checkout</@ofbizUrl>" method="post">
                <#assign supplierIndex = -1/>
                <#list supplierCartItemsMap.entrySet() as entry>
                    <#assign shopSubTotal = 0 />
                    <#assign supplierIndex = supplierIndex + 1/>
                    <#assign partyId = entry.getKey()/>
                    <#assign shoppingCartItems = entry.getValue()/>
                    <table class="table sc-table product-table">
                        <thead>
                            <tr class="sc-table-header georgia">
                                <th colspan="5">${cartContext.getSupplierName(partyId)}</th>
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
                            <#list shoppingCartItems as cartLine>
                                <#assign cartLineIndex = shoppingCart.getItemIndex(cartLine) />
                                <#assign lineOptionalFeatures = cartLine.getOptionalProductFeatures() />
                                
                                <#if cartLine.getProductId()?exists>
                                    <#-- product item -->
                                    <#-- start code to display a small image of the product -->
                                    <#if cartLine.getParentProductId()?exists>
                                        <#assign parentProductId = cartLine.getParentProductId() />
                                    <#else>
                                        <#assign parentProductId = cartLine.getProductId() />
                                    </#if>
                                    <tr>
                                        <td class="col1">
                                            <#assign contentAssocThumbs = ""/>
                                            <#assign productContentAndInfoImages = Static["org.ofbiz.entity.util.EntityUtil"].filterByDate(delegator.findByAnd("ProductContentAndInfo", {"productId" : cartLine.getProductId(), "productContentTypeId" : "IMAGE", "statusId" : "IM_APPROVED", "drIsPublic" : "Y"}, ["sequenceNum"], false))>
                                            <#if productContentAndInfoImages?has_content>
                                                <#assign contentAssocThumbs = delegator.findByAnd("ContentAssocDataResourceViewTo", {"contentIdStart" : productContentAndInfoImages[0].contentId, "caContentAssocTypeId" : "IMAGE_THUMBNAIL"}, null, false)>
                                            </#if>
                                            <img src="<#if contentAssocThumbs?has_content><@ofbizContentUrl>${contentAssocThumbs[0].drObjectInfo}</@ofbizContentUrl><#else><@ofbizContentUrl>/images/defaultImage.jpg</@ofbizContentUrl></#if>"/>
                                        </td>
                                        <td class="col2">
                                            <strong>${cartLine.getName()?if_exists}</strong><#-- <br />Colour - yellow -->
                                        </td>
                                        <td class="col3">
                                            <#assign defaultPrice = Static["org.ofbiz.entity.util.EntityUtil"].filterByDate(delegator.findByAnd("ProductPrice", {"productId" : cartLine.getProductId(), "productPriceTypeId" : "DEFAULT_PRICE"}, null, false))>
                                            <#assign promoPrice = Static["org.ofbiz.entity.util.EntityUtil"].filterByDate(delegator.findByAnd("ProductPrice", {"productId" : cartLine.getProductId(), "productPriceTypeId" : "SPECIAL_PROMO_PRICE"}, null, false))>
                                            <#if promoPrice?has_content>
                                                <div class="old"><@ofbizCurrency amount=defaultPrice[0].price/></div>
                                                <strong><@ofbizCurrency amount=promoPrice[0].price/></strong>
                                            <#else>
                                                <strong><@ofbizCurrency amount=defaultPrice[0].price/></strong>
                                            </#if>
                                        </td>
                                        <td class="col4"><input type="text" class="input-mini" value="${cartLine.getQuantity()?string.number}"/><br />
                                            <a href="javascript:void(0)" onclick="deleteItem(event, ${cartLineIndex})">Delete item</a>
                                        </td>
                                        <td class="col5"><strong><@ofbizCurrency amount=cartLine.getDisplayItemSubTotal()/></strong></td>
                                    </tr>
                                </#if>
                            </#list>
                            <tr class="row-grey">
                                <td colspan="5" class="col1">
                                    <h5 class="heading">Delivery Options</h5>
                                    <select name="scDelivery" class="drop-select chosen combo scDelivery" id="scDelivery_${entry_index?if_exists}" data-search-bar="true">
                                        <option value="PICKUP-${entry_index?if_exists}" selected="selected">Pick up in store</option>
                                        <option value="DELIVERY-${entry_index?if_exists}">Delivery to me</option>
                                    </select>
                                    <#assign branchStoreNameList = delegator.findByAnd("PartyAndPostalAddress", {"partyId" : partyId}, null, false)>
                                    <select name="scBranchStore" class="drop-select chosen combo scBranchStore" id="scBranchStore_${entry_index?if_exists}" data-search-bar="true">
                                        <option value="" selected="selected">Select Branch Store</option>
                                        <#if branchStoreNameList?has_content>
                                            <#list branchStoreNameList as branchStoreName>
                                                <option value="${branchStoreName.contactMechId}">${branchStoreName.toName}</option>
                                            </#list>
                                        </#if>
                                    </select>
                                    <select name="scShipOption" class="drop-select chosen combo hidden" id="scShipOption_${entry_index?if_exists}" data-search-bar="true">
                                        <option value="" selected="selected">Select Shipping Option</option>
                                    </select>
                                    <#-- <select name="shipmentCarrierPartyId:${partyId}_o_${supplierIndex}" class="drop-select chosen combo" data-search-bar="true">
                                        <option value="" selected="selected">Select Ship</option>
                                        <#list shipmentCarriers as shipmentCarrier>
                                            <option value="${shipmentCarrier.partyId}">${(shipmentCarrier.firstName)!} ${(shipmentCarrier.lastName)!} ${(shipmentCarrier.groupName)!}</option>
                                        </#list>
                                    </select>
                                    <select name="shipmentMethodTypeId:${partyId}_o_${supplierIndex}" class="drop-select chosen combo" data-search-bar="true">
                                        <option value="" selected="selected">Select Shipping Option</option>
                                        <#list shipmentMethodTypes as shipmentMethodType>
                                            <option value="${shipmentMethodType.shipmentMethodTypeId}">${shipmentMethodType.description}</option>
                                        </#list>
                                    </select> -->
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
                                <td class="col5" style="padding-right:10px;"><h5 class="blue"><@ofbizCurrency amount=shoppingCart.getDisplayGrandTotal()/></h5></td>
                            </tr>
                        </tbody>
                    </table>
                </#list>
                
                <#-- Estimcate Shipping and Tax -->
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
                                        <tr><td class="col1">Sub Total</td><td class="col2"><@ofbizCurrency amount=shoppingCart.getDisplayGrandTotal()/></td></tr>
                                        <tr><td class="col1">Shipping</td><td class="col2">$0.00</td></tr>
                                        <tr><td class="col1">Discount</td><td class="col2">$0.00</td></tr>
                                        <tr><td class="col1">Sales Tax</td><td class="col2" style="padding-bottom:14px;">$0.00</td></tr>
                                    </tbody>
                                    <tfoot>
                                        <tr><td class="col1">Total</td><td class="col2"><@ofbizCurrency amount=shoppingCart.getDisplayGrandTotal()/></td></tr>
                                    </tfoot>
                                </table>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </form>
            <a href="<@ofbizUrl>main</@ofbizUrl>" class="btn-green-small pull-left">Continue to Shopping</a>
            <div class="btn-checkout-wrapper">
                <div class="btn-paypal">
                    <a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/btn-paypal.gif</@ofbizContentUrl>"></a>
                </div>
                <a id="processShoppingCartSummaryButton" href="#" class="btn-general pull-right">Proceed To Checkout</a>
            </div>
        </div>
    </div>
</div>
