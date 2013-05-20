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

<div class="container content promotion">
    <!-- include breadcrumb -->
    ${screens.render("component://shopmax/widget/ShopMaxScreens.xml#Breadcrumbs")}
    <div class="row content-left">
        <!-- MAIN CONTENT -->
        <div class="span9 main-content">
            <div class="my_acc">
                <div class="title_grn"><h6>Order details</h6></div>
                <div class="block">
                    <table cellpadding="0" cellspacing="0" border="0" class="table table_1">
                        <tbody>
                            <tr>
                                <td>Customer name:</td>
                                <td><strong>${customerName?if_exists}</strong></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <#if billingAddress?has_content>
                                    <#assign stateProvinceGeo = delegator.findOne("Geo", Static["org.ofbiz.base.util.UtilMisc"].toMap("geoId", billingAddress.stateProvinceGeoId), true)>
                                    <#assign countryGeo = delegator.findOne("Geo", Static["org.ofbiz.base.util.UtilMisc"].toMap("geoId", billingAddress.countryGeoId), true)>
                                    <td>Billing address:</td>
                                    <td>
                                        <p>
                                            <strong>${billingAddress.address1?if_exists}</strong>
                                            <strong>${billingAddress.address2?if_exists}</strong>
                                            <strong>${billingAddress.city?if_exists}</strong>
                                            <strong>${stateProvinceGeo.geoName?if_exists} ${billingAddress.postalCode?if_exists}</strong>
                                            <strong>${countryGeo.geoName?if_exists}</strong>
                                        </p>
                                    </td>
                                </#if>
                                <#if shippingAddress?has_content>
                                    <#assign stateProvinceGeo = delegator.findOne("Geo", Static["org.ofbiz.base.util.UtilMisc"].toMap("geoId", shippingAddress.stateProvinceGeoId), true)>
                                    <#assign countryGeo = delegator.findOne("Geo", Static["org.ofbiz.base.util.UtilMisc"].toMap("geoId", shippingAddress.countryGeoId), true)>
                                    <td>Shipping address:</td>
                                    <td>
                                        <p>
                                            <strong>${shippingAddress.address1?if_exists}</strong>
                                            <strong>${shippingAddress.address2?if_exists}</strong>
                                            <strong>${shippingAddress.city?if_exists}</strong>
                                            <strong>${stateProvinceGeo.geoName?if_exists} ${shippingAddress.postalCode?if_exists}</strong>
                                            <strong>${countryGeo.geoName?if_exists}</strong>
                                        </p>
                                    </td>
                                </#if>
                            </tr>
                            <tr>
                                <td>Email:</td>
                                <td><strong>${emailAddress?if_exists}</strong></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="title_grn"><a href="#" class="rightlink">Print pick list</a><h6>order items</h6></div>
                <div class="block block_mar">
                    <table cellpadding="0" cellspacing="0" border="0" class="table table_2">
                        <thead>
                            <tr>
                                <th>Product name</th>
                                <th>Product SKU</th>
                                <th>Quantity</th>
                                <th>Unit price</th>
                                <th>Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <#if orderItemList?has_content>
                                <#list orderItemList as orderItem>
                                    <#assign product = orderItem.getRelatedOne("Product", true)>
                                    <tr>
                                        <td>${product.internalName?if_exists}</td>
                                        <td>${orderItem.productId?if_exists}</td>
                                        <td>${orderItem.quantity?if_exists}</td>
                                        <td><@ofbizCurrency amount=orderItem.unitPrice isoCode=currencyUomId/></td>
                                        <td><@ofbizCurrency amount=Static["org.ofbiz.order.order.OrderReadHelper"].getOrderItemSubTotal(orderItem, orderAdjustments) isoCode=currencyUomId/></td>
                                    </tr>
                                </#list>
                            </#if>
                        </tbody>
                    </table>
                </div>
                <div class="title_blu"><h6>In store voucher</h6></div>
                <div class="block">
                    <p>Can you wrap it in gift?</p>
                </div>
            </div>
        </div><!-- /.span9 -->
        <!-- sidebar -->
        <div class="span3 sidebar" id="side-menu">
            <div class="categories innerbox largeheading">
                <h2>Order information</h2>
                <div class="category-list">
                    <h5 class="heading">ORDER NUMBER:</h5>
                    <span class="detail">${orderHeader.orderId?if_exists}</span>
                    <h5 class="heading">ORDER TIME:</h5>
                    <span class="detail">${Static["org.ofbiz.base.util.UtilFormatOut"].formatDateTime(orderHeader.orderDate, "", locale, timeZone)!?if_exists}</span>
                    <h5 class="heading">ORDER VALUE:</h5>
                    <span class="detail"><@ofbizCurrency amount=grandTotal isoCode=currencyUomId/></span>
                    <h5 class="heading">DELIVERY CHARGE:</h5>
                    <span class="detail"><@ofbizCurrency amount=shippingAmount isoCode=currencyUomId/></span>
                    <h5 class="heading">SHIPPING METHOD:</h5>
                    <#if shipGroup.shipmentMethodTypeId?has_content>
                        <#assign shipmentMethodType = shipGroup.getRelatedOne("ShipmentMethodType", false)?if_exists>
                        <span class="detail">${shipmentMethodType.get("description",locale)!}</span>
                    <#else>
                        <span class="detail">Pick up in store</span>
                    </#if>
                    <#assign orderStatus = orderHeader.getRelatedOne("StatusItem", false)>
                    <h5 class="heading">ORDER STATUS:</h5>
                    <span class="detail">${orderStatus.get("description",locale)}</span>
                    <div class="buttonlast"><a href="#" class="btn-grey">change</a></div>
                </div>
            </div><!-- /.categories .innerbox -->
        </div><!-- /.span3.sidebar -->
    </div><!-- /.row -->                
</div> <!-- /container -->
