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
                            <div class="right_top"><a href="#" class="btn-general">Print orader confirmation</a></div>
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
                
                <div class="shipp_info">
                    <div class="tital_1 tital_green">Shop name</div>
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
                            <tr>
                                <td class="col1 col_1"><img src="<@ofbizContentUrl>/shopmax-default/img/product-generic-75x75.jpg</@ofbizContentUrl>" /></td>
                                <td class="col2 col_2"><strong>Product name 1</strong><br />Colour - yellow</td>
                                <td class="col3 col_3 alighright"><strong>$25.00</strong></td>
                                <td class="col4 col_4 alighcenter">1</td>
                                <td class="col5"><strong>$25.00</strong></td>
                            </tr>
                            <tr>
                                <td class="col1 col_1"><img src="<@ofbizContentUrl>/shopmax-default/img/product-generic-75x75.jpg</@ofbizContentUrl>" /></td>
                                <td class="col2 col_2"><strong>Product name 1</strong><br />Colour - yellow</td>
                                <td class="col3 col_3"><div class="old">$30.00</div><strong>$25.00</strong></td>
                                <td class="alighcenter col4 col_4">1</td>
                                <td class="col5"><strong>$25.00</strong></td>
                            </tr>
                            <tr>
                                <td class="col1 col_1"><img src="<@ofbizContentUrl>/shopmax-default/img/product-generic-75x75.jpg</@ofbizContentUrl>" /></td>
                                <td class="col2 col_2"><strong>Product name 1</strong><br />Colour - yellow</td>
                                <td class="col3 col_3">$25.00</td>
                                <td class="alighcenter col4 col_4">1</td>
                                <td class="col5"><strong>$25.00</strong></td>
                            </tr>
                             </tbody>
                    </table>
                    
                    <div class="shop_address clearfix">
                        <p>You have selected to pick this item up from the store listed below. Your <strong>Order Number: XJF1234</strong>. You Must present this to the shop in order to pick up your purchase.</p>
                        <div class="row">
                            <div class="span5">
                                <div class="column_1">
                                    <h5>Store address</h5>
                                    <ul>
                                        <li>Store Name</li>
                                        <li>Street Address Line one</li>
                                        <li>Street Address Line two</li>
                                        <li>State</li>
                                        <li>Phone number xxx xxx xxx</li>
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
                
                <div class="shipp_info">
                    <div class="tital_1 tital_green">Shop name</div>
                    <table class="table bl-table sc-table-shipping ">
                        <thead>
                            <tr class="bl-table-header-blue bl-table-header-grey">
                                <th class="col1 col_1">Product</th>
                                <th class="col2 col_2"></th>
                                <th class="col3 col_3">UNIT Price</th>
                                <th class="col4 col_4">Quantity</th>
                                <th class="col5">Sub total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="col1 col_1"><img src="<@ofbizContentUrl>/shopmax-default/img/product-generic-75x75.jpg</@ofbizContentUrl>" /></td>
                                <td class="col2 col_2"><strong>Product name 1</strong><br />Colour - yellow</td>
                                <td class="col3 col_3"><strong>$25.00</strong></td>
                                <td class="align-right col4 col_4">1</td>
                                <td class="col5"><strong>$25.00</strong></td>
                            </tr>
                        </tbody>
                    </table>
                    
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
                </div>
                
                <div class="shipp_info">
                    <div class="tital_1">Payment summary</div>
                    <table class="table bl-table sc-table-shipping ">
                        <tbody>
                            <tr>
                                <td colspan="3" style="width:400px;">&nbsp;</td>
                                <td colspan="2" class="bl-table-estimate-shipping">
                                    <table class="table table-condensed">
                                        <tbody>
                                            <tr><td class="rightalign">Shopping cart Sub total</td><td class="col1 rightalign">$195.00</td></tr>
                                            <tr><td class="rightalign">Shipping</td><td class="col1 rightalign">$195.00</td></tr>
                                            <tr><td class="rightalign">Discount</td><td class="col1 rightalign">$195.00</td></tr>
                                            <tr><td class="rightalign">Sales Tax</td><td class="col1 rightalign">$195.00</td></tr>
                                        </tbody>
                                        <tfoot>
                                            <tr><td class="rightalign">Total</td><td class="blue rightalign">$195.00</td></tr>
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
