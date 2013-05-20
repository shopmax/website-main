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
    <div class="row">
        <div class="span3 sidebar" id="side-menu">
            <div class="categories innerbox largeheading">
                <h2>Search order</h2>
                <div class="category-list">
                    <ul class="seorder">
                        <li>
                            <table cellpadding="0" cellspacing="0" border="0" class="table table_1">
                                <tr>
                                    <td>Order number</td>
                                    <td><input type="text" class="span1"></td>
                                </tr>
                                <tr>
                                    <td>Product name</td>
                                    <td><input type="text" class="span1"></td>
                                </tr>
                                <tr>
                                    <td>Product SKU</td>
                                    <td><input type="text" class="span1"></td>
                                </tr>
                            </table>
                        </li>
                        <li>
                            <table cellpadding="0" cellspacing="0" border="0" class="table table_1">
                                <tr>
                                    <td>Order status</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox"> Pending</td>
                                    <td><input type="checkbox"> Processing</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox"> Completed</td>
                                    <td><input type="checkbox"> Returned</td>
                                </tr>
                            </table>
                        </li>
                        <li>
                            <table cellpadding="0" cellspacing="0" border="0" class="table table_1">
                                <tr>
                                    <td colspan="4">Order value</td>
                                </tr>
                                <tr>
                                    <td>From</td>
                                    <td><input type="text" class="span1 textbox_1"></td>
                                    <td>To</td>
                                    <td><input type="text" class="span1 textbox_1"></td>
                                </tr>
                                
                            </table>
                        </li>
                        <li>
                            <table cellpadding="0" cellspacing="0" border="0" class="table table_1">
                                <tr>
                                    <td>Buyer email</td>
                                </tr>
                                <tr>
                                    <td><input type="text" class="span2"></td>
                                </tr>
                            </table>
                        </li>
                        <li>
                            <table cellpadding="0" cellspacing="0" border="0" class="table table_1">
                                <tr>
                                    <td>Shipping</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox"> Pickup</td>
                                    <td><input type="checkbox"> Delivery</td>
                                </tr>
                            </table>
                        </li>
                        <li>
                            <table cellpadding="0" cellspacing="0" border="0" class="table table_1">
                                <tr>
                                    <td>Order date</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>From</td>
                                    <td><input type="text" class="span1"> <img src="img/icon-calendar.png" alt="" style="margin:0 0 0 5px;"></td>
                                </tr>
                                <tr>
                                    <td>To</td>
                                    <td><input type="text" class="span1"> <img src="img/icon-calendar.png" alt="" style="margin:0 0 0 5px;"></td>
                                </tr>
                            </table>
                        </li>
                        
                    </ul>
                </div>
            </div><!-- /.categories .innerbox -->
        </div><!-- /.span3.sidebar -->
        <!-- MAIN CONTENT -->
        <!-- sliderdiv -->
        <div class="span9 main-content">
            <table class="table table-condensed sc-table sc-table-promotion">
              <thead>
                <tr class="sc-table-header">
                  <th class="col1">Order List</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                    <td class="col1">
                        <ul class="nav nav-tabs nav-tabs_large" id="myTab">
                          <li class="active"><a data-toggle="tab" href="#recentOrders">Recent orders</a></li>
                          <li class=""><a data-toggle="tab" href="#Pending">pending</a></li>
                          <li class=""><a data-toggle="tab" href="#Processing">Processing</a></li>
                          <li class=""><a data-toggle="tab" href="#Completed">Completed</a></li>
                          <li class=""><a data-toggle="tab" href="#Returned">returned</a></li>
                          <li class=""><a data-toggle="tab" href="#SearchResult">Search result</a></li>
                        </ul>
                        <div class="tab-content" id="myTabContent">
                            <div id="recentOrders" class="tab-pane fade active in">
                                <table class="table table-condensed">
                                    <thead>
                                        <tr>
                                            <th>Time</th>
                                            <th>Order number</th>
                                            <th>Order value</th>
                                            <th>Customer</th>
                                            <th>Shipping status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <#if recentOrderList?has_content>
                                            <#list recentOrderList as recentOrder>
                                                <tr>
                                                    <td>${Static["org.ofbiz.base.util.UtilFormatOut"].formatDateTime(recentOrder.orderDate, "", locale, timeZone)!?if_exists}</td>
                                                    <td><a href="<@ofbizUrl>orderdetail?orderId=${recentOrder.orderId}</@ofbizUrl>">${recentOrder.orderId?if_exists}</a></td>
                                                    <td><@ofbizCurrency amount=recentOrder.grandTotal isoCode=currencyUomId/></td>
                                                    <td>${recentOrder.customerName?if_exists}</td>
                                                    <td>Pickup in store</td>
                                                </tr>
                                            </#list>
                                        </#if>
                                    </tbody>
                                </table>
                            </div>
                            <div id="Pending" class="tab-pane fade">
                                <table class="table table-condensed">
                                    <thead>
                                        <tr>
                                            <th>Time</th>
                                            <th>Order number</th>
                                            <th>Order value</th>
                                            <th>Customer</th>
                                            <th>Shipping status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <#if pendingOrderList?has_content>
                                            <#list pendingOrderList as pendingOrder>
                                                <tr>
                                                    <td>${Static["org.ofbiz.base.util.UtilFormatOut"].formatDateTime(pendingOrder.orderDate, "", locale, timeZone)!?if_exists}</td>
                                                    <td><a href="<@ofbizUrl>orderdetail?orderId=${pendingOrder.orderId}</@ofbizUrl>">${pendingOrder.orderId?if_exists}</a></td>
                                                    <td><@ofbizCurrency amount=pendingOrder.grandTotal isoCode=currencyUomId/></td>
                                                    <td>${pendingOrder.customerName?if_exists}</td>
                                                    <td>Pickup in store</td>
                                                </tr>
                                            </#list>
                                        </#if>
                                    </tbody>
                                </table>
                            </div>
                            <div id="Processing" class="tab-pane fade">
                                <table class="table table-condensed">
                                    <thead>
                                        <tr>
                                            <th>Time</th>
                                            <th>Order number</th>
                                            <th>Order value</th>
                                            <th>Customer</th>
                                            <th>Shipping status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <#if processingOrderList?has_content>
                                            <#list processingOrderList as processingOrder>
                                                <tr>
                                                    <td>${Static["org.ofbiz.base.util.UtilFormatOut"].formatDateTime(processingOrder.orderDate, "", locale, timeZone)!?if_exists}</td>
                                                    <td><a href="<@ofbizUrl>orderdetail?orderId=${recentOrder.orderId}</@ofbizUrl>">${recentOrder.orderId?if_exists}</a></td>
                                                    <td><@ofbizCurrency amount=processingOrder.grandTotal isoCode=currencyUomId/></td>
                                                    <td>${processingOrder.customerName?if_exists}</td>
                                                    <td>Pickup in store</td>
                                                </tr>
                                            </#list>
                                        </#if>
                                    </tbody>
                                </table>
                            </div>
                            <div id="Completed" class="tab-pane fade">
                                <table class="table table-condensed">
                                    <thead>
                                        <tr>
                                            <th>Time</th>
                                            <th>Order number</th>
                                            <th>Order value</th>
                                            <th>Customer</th>
                                            <th>Shipping status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <#if completedOrderList?has_content>
                                            <#list completedOrderList as completedOrder>
                                                <tr>
                                                    <td>${Static["org.ofbiz.base.util.UtilFormatOut"].formatDateTime(completedOrder.orderDate, "", locale, timeZone)!?if_exists}</td>
                                                    <td><a href="<@ofbizUrl>orderdetail?orderId=${completedOrder.orderId}</@ofbizUrl>">${completedOrder.orderId?if_exists}</a></td>
                                                    <td><@ofbizCurrency amount=completedOrder.grandTotal isoCode=currencyUomId/></td>
                                                    <td>${completedOrder.customerName?if_exists}</td>
                                                    <td>Pickup in store</td>
                                                </tr>
                                            </#list>
                                        </#if>
                                    </tbody>
                                </table>
                            </div>
                            <div id="Returned" class="tab-pane fade">
                                <table class="table table-condensed">
                                    <thead>
                                        <tr>
                                            <th>Time</th>
                                            <th>Order number</th>
                                            <th>Return value</th>
                                            <th>Customer</th>
                                            <th>Return status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <#if returnedOrderList?has_content>
                                            <#list returnedOrderList as returnedOrder>
                                                <tr>
                                                    <td>${Static["org.ofbiz.base.util.UtilFormatOut"].formatDateTime(returnedOrder.entryDate, "", locale, timeZone)!?if_exists}</td>
                                                    <td><a href="<@ofbizUrl>orderdetail?orderId=${returnedOrder.orderId}</@ofbizUrl>">${returnedOrder.orderId?if_exists}</a></td>
                                                    <td><@ofbizCurrency amount=returnedOrder.returnTotal isoCode=currencyUomId/></td>
                                                    <td>${returnedOrder.customerName?if_exists}</td>
                                                    <#assign returnStatus = delegator.findOne("StatusItem", Static["org.ofbiz.base.util.UtilMisc"].toMap("statusId", returnedOrder.statusId), true)>
                                                    <td>${returnStatus.get("description",locale)}</td>
                                                </tr>
                                            </#list>
                                        </#if>
                                    </tbody>
                                </table>
                            </div>
                            <div id="SearchResult" class="tab-pane fade">
                                <table class="table table-condensed">
                                    <thead>
                                        <tr>
                                            <th>Time</th>
                                            <th>Order number</th>
                                            <th>Order value</th>
                                            <th>Customer</th>
                                            <th>Shipping status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <#if searchResultOrderList?has_content>
                                            <#list searchResultOrderList as searchResultOrder>
                                                <tr>
                                                    <td>${Static["org.ofbiz.base.util.UtilFormatOut"].formatDateTime(searchResultOrder.orderDate, "", locale, timeZone)!?if_exists}</td>
                                                    <td><a href="<@ofbizUrl>orderdetail?orderId=${searchResultOrder.orderId}</@ofbizUrl>">${searchResultOrder.orderId?if_exists}</a></td>
                                                    <td><@ofbizCurrency amount=searchResultOrder.grandTotal isoCode=currencyUomId/></td>
                                                    <td>${searchResultOrder.customerName?if_exists}</td>
                                                    <td>Pickup in store</td>
                                                </tr>
                                            </#list>
                                        </#if>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </td>
                </tr>
              </tbody>
            </table>
        </div><!-- /.span9 -->
    </div><!-- /.row -->
</div> <!-- /container -->
