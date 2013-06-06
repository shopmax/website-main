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
    <!-- include breadcrumb -->
    ${screens.render("component://shopmax/widget/ShopMaxScreens.xml#Breadcrumbs")}
    <div class="row">
        <div class="span3 sidebar" id="side-menu">
            <!-- /.categories .innerbox -->
        </div><!-- /.span3.sidebar -->
        <!-- MAIN CONTENT -->
        <!-- sliderdiv -->
        <div class="span9 main-content">
            <ul class="sc-step">
                <li><span class="badge badge-inactive">1</span>&nbsp;&nbsp;Shopping Cart</li>
                <li><span class="badge badge-inactive">2</span>&nbsp;&nbsp;Billing & Delivery</li>
                <li class="step-active"><span class="badge badge-active">3</span>&nbsp;&nbsp;Complete</li>
            </ul>
            <br/>
            
            <div class="billing_de">
                <div class="shipp_info">
                    <div class="tital_1 tital_blue">Order confirmation</div>
                    <div class="boxbill clearfix">
                        <div class="topside clearfix">
                            <div class="left_top"><strong>Thank you for your order.<br>Please print a copy of this page for your records.</strong></div>
                            <div class="right_top"><a href="<@ofbizUrl>order.pdf?orderId=${orderId}</@ofbizUrl>" class="btn-general" target="_blank">Print order confirmation</a></div>
                        </div>
                        <table cellpadding="0" cellspacing="0" border="0" class="table table_1">
                            <tr>
                                <td>${screens.render("component://shopmax/widget/OrderScreens.xml#ordershippinginfo")}</td>
                                <td>${screens.render("component://shopmax/widget/OrderScreens.xml#orderbillinginfo")}</td>
                                <td>${screens.render("component://shopmax/widget/OrderScreens.xml#orderpaymentinfo")}</td>
                            </tr>
                        </table>
                    </div>
                </div>
                
                <#list supplierOrderItemsMap.entrySet() as entry>
                    <#assign partyId = entry.getKey()/>
                    <#assign supplierOrderItems = entry.getValue()/>
                    <div class="shipp_info">
                        <div class="tital_1 tital_green">${orderContext.getSupplierName(partyId)}</div>
                        <table class="table bl-table sc-table-shipping ">
                            <thead>
                                <tr class="bl-table-header-blue bl-table-header-grey">
                                    <th class="col1 col_1" width="100">Product</th>
                                    <th class="col2 col_2" width="300"></th>
                                    <th class="col3 col_3 alighright" width="100">UNIT Price</th>
                                    <th class="col4 col_4 alighcenter" width="100">Quantity</th>
                                    <th class="col5">Sub total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <#list supplierOrderItems as orderItem>
                                    <#assign product = orderItem.getRelatedOne("Product", false)/>
                                    <tr>
                                        <td class="col1 col_1">
                                            <#assign contentAssocThumbs = ""/>
                                            <#assign productContentAndInfoImages = Static["org.ofbiz.entity.util.EntityUtil"].filterByDate(delegator.findByAnd("ProductContentAndInfo", {"productId" : product.productId, "productContentTypeId" : "IMAGE", "statusId" : "IM_APPROVED", "drIsPublic" : "Y"}, ["sequenceNum"], false))>
                                            <#if productContentAndInfoImages?has_content>
                                                <#assign contentAssocThumbs = delegator.findByAnd("ContentAssocDataResourceViewTo", {"contentIdStart" : productContentAndInfoImages[0].contentId, "caContentAssocTypeId" : "IMAGE_THUMBNAIL"}, null, false)>
                                            </#if>
                                            <img src="<#if contentAssocThumbs?has_content><@ofbizContentUrl>${contentAssocThumbs[0].drObjectInfo}</@ofbizContentUrl><#else><@ofbizContentUrl>/images/defaultImage.jpg</@ofbizContentUrl></#if>" width="100px"/>
                                        </td>
                                        <td class="col2 col_2"><strong>${product.productName?if_exists}</strong><br /><#-- Colour - yellow--></td>
                                        <td class="col3 col_3 alighright">
                                            <#assign defaultPrice = Static["org.ofbiz.entity.util.EntityUtil"].filterByDate(delegator.findByAnd("ProductPrice", {"productId" : product.productId, "productPriceTypeId" : "DEFAULT_PRICE"}, null, false))>
                                            <#assign promoPrice = Static["org.ofbiz.entity.util.EntityUtil"].filterByDate(delegator.findByAnd("ProductPrice", {"productId" : product.productId, "productPriceTypeId" : "SPECIAL_PROMO_PRICE"}, null, false))>
                                            <#if promoPrice?has_content>
                                                <div class="old"><@ofbizCurrency amount=defaultPrice[0].price/></div>
                                                <strong><@ofbizCurrency amount=promoPrice[0].price/></strong>
                                            <#else>
                                                <strong><@ofbizCurrency amount=defaultPrice[0].price/></strong>
                                            </#if>
                                        </td>
                                        <td class="col4 col_4 alighcenter">${orderItem.quantity?string.number}</td>
                                        <td class="col5"><strong><@ofbizCurrency amount=Static["org.ofbiz.order.order.OrderReadHelper"].getOrderItemSubTotal(orderItem, orderAdjustments)/></strong></td>
                                    </tr>
                                </#list>
                            </tbody>
                        </table>
                        
                        <div class="shop_address clearfix">
                            <p>You have selected to pick this item up from the store listed below. Your <strong>Order Number: ${orderId}</strong>. You Must present this to the shop in order to pick up your purchase.</p>
                            <div class="row">
                                <div class="span5">
                                    <div class="column_1">
                                        <h5>Store address</h5>
                                        <ul>
                                            <li>${productStore.storeName?if_exists}</li><#--Store Name -->
                                            <#assign facilityContactMechValueMaps = Static["org.ofbiz.party.contact.ContactMechWorker"].getFacilityContactMechValueMaps(delegator, productStore.inventoryFacilityId, false, "POSTAL_ADDRESS") />
                                            <#if facilityContactMechValueMaps?has_content>
                                                <#assign postalAddress = facilityContactMechValueMaps.postalAddress />
                                                <#assign proviceStateGeo = postalAddress.getRelatedOne("ProvinceStateGeo")/>
                                                <li>${postalAddress.address1}</li><#--Street Address Line one -->
                                                <li>${postalAddress.address2}</li><#--Street Address Line two -->
                                                <li>${postalAddress.city}</li><#--State -->
                                            </#if>
                                            
                                            <#assign facilityContactMechValueMaps = Static["org.ofbiz.party.contact.ContactMechWorker"].getFacilityContactMechValueMaps(delegator, productStore.inventoryFacilityId, false, "TELECOM_NUMBER") />
                                            <#if facilityContactMechValueMaps?has_content>
                                                <#assign telecomNumber = facilityContactMechValueMaps.telecomNumber />
                                                <li>Phone number ${telecomNumber.countryCode?if_exists} <#if telecomNumber.areaCode?exists>${telecomNumber.areaCode}-</#if>${telecomNumber.contactNumber}</li>
                                            </#if>
                                        </ul>
                                    </div>
                                </div>
                                <div class="span4">
                                    <div class="column_2">
                                        <h5>Pickup hours</h5>
                                        <ul>
                                            <li>Monday - Friday: 9am - 6p</li>
                                            <li>Saturday: 10am - 4pm</li>
                                            <li>Sunday: Closed</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </#list>
                <#--
                <div class="shop_address clearfix">
                    <p>You have selected to ship this item to:</p>
                    <div class="row">
                        <div class="span5">
                            <div class="column_1">
                                <ul>
                                    <li>Store Name</li>
                                    <li>Street Address Line one</li>
                                    <li>Street Address Line two</li>
                                    <li>State</li>
                                    <li>Phone number xxx xxx xxx</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                -->
                <div class="shipp_info">
                    <div class="tital_1">Payment summary</div>
                    <table class="table bl-table sc-table-shipping ">
                        <tbody>
                            <tr>
                                <td colspan="3" style="width:400px;">&nbsp;</td>
                                <td colspan="2" class="bl-table-estimate-shipping">
                                    <table class="table table-condensed">
                                        <tbody>
                                            <tr><td class="rightalign">Shopping cart Sub total</td><td class="col1 rightalign"><@ofbizCurrency amount=orderSubTotal/></td></tr>
                                            <tr><td class="rightalign">Shipping</td><td class="col1 rightalign"><@ofbizCurrency amount=shippingAmount /></td></tr>
                                            <tr><td class="rightalign">Discount</td><td class="col1 rightalign">
                                                    <#assign orderAdjustmentsTotal = 0  />
                                                    <#list shoppingCart.getAdjustments() as cartAdjustment>
                                                      <#assign orderAdjustmentsTotal = orderAdjustmentsTotal + Static["org.ofbiz.order.order.OrderReadHelper"].calcOrderAdjustment(cartAdjustment, shoppingCart.getSubTotal()) />
                                                    </#list>
                                                    <@ofbizCurrency amount=orderAdjustmentsTotal />
                                                </td>
                                            </tr>
                                            <tr><td class="rightalign">Sales Tax</td><td class="col1 rightalign"><@ofbizCurrency amount=taxAmount /></td></tr>
                                        </tbody>
                                        <tfoot>
                                            <tr><td class="rightalign">Total</td><td class="blue rightalign"><@ofbizCurrency amount=grandTotal /></td></tr>
                                        </tfoot>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div><!-- /.span9 -->
    </div><!-- /.row -->
</div> <!-- /container -->
