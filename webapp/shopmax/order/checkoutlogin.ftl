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

        <div class="span9 main-content">
            <ul class="sc-step">
                <li><span class="badge badge-inactive">1</span>&nbsp;&nbsp;Shopping Cart</li>
                <li class="step-active"><span class="badge badge-active">2</span>&nbsp;&nbsp;Billing & Delivery</li>
                <li><span class="badge badge-inactive">3</span>&nbsp;&nbsp;Complete</li>
            </ul>
            <br />
            <div class="billing_de">
                <div class="shipp_info">
                    <div class="tital_1">Shipping Information</div>
                    <div class="row">
                        <div class="span5">
                            <div class="column_1">
                                <select class="span3">
                                    <option>Contact Name Street Address</option>
                                </select>
                                <h5>ship to</h5>
                                <ul>
                                    <li>Contact Name</li>
                                    <li>Street Address Line one </li>
                                    <li>Street Address Line two</li>
                                    <li>State</li>
                                    <li>Phone number xxx xxx xxx</li>
                                </ul>
                            </div>
                        </div>
                        <div class="span4">
                            <div class="column_2"><a href="#" class="pull-right">Edit Shipping Address</a></div>
                        </div>
                    </div>
                </div>
                
                <div class="shipp_info">
                    <div class="tital_1">Billing Information</div>
                    <div class="row">
                        <div class="span5">
                            <div class="column_1">
                                <select class="span4">
                                    <option>Visa ••••••••••••1234 Exp: 03/03/2013</option>
                                </select>
                                <h5>bill to</h5>
                                <ul>
                                    <li>Contact Name</li>
                                    <li>Street Address Line one </li>
                                    <li>Street Address Line two</li>
                                    <li>State</li>
                                    <li>Phone number xxx xxx xxx</li>
                                </ul>
                            </div>
                        </div>
                        <div class="span4">
                            <div class="column_2">
                                <a href="#" class="pull-right clearfix">Edit Billing information</a>
                                <div class="clearfix"></div>
                                <h5>Payment Information</h5>
                                <ul>
                                    <li>VISA</li>
                                    <li>••••••••••••1234 </li>
                                    <li>Exp: 03/03/2013</li>
                                    <li class="lastbox">
                                        <input type="text" class="span1 textb">
                                        <div class="card"><img src="img/icon-card.gif" alt=""></div>
                                        <a href="#" class="what">What is this ?</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="shipp_info">
                    <table class="table bl-table sc-table-shipping ">
                        <thead>
                            <tr class="bl-table-header-blue">
                                <th colspan="5" class="col1">
                                    ${uiLabelMap.OrderSummary} <button class="btn btn-mini bl-edit-cart blue">Edit Cart</button>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="col1"><img src="<@ofbizContentUrl>/shopmax-default/img/product-generic-75x75.jpg</@ofbizContentUrl>" /></td>
                                <td class="col2"><strong class="green"><a href="#">Shop Name</a></strong><br />
                                    <strong>Product name 1</strong><br />
                                    Colour - yellow
                                </td>
                                <td class="col3"><strong>$25.00</strong></td>
                                <td class="align-right col4">1</td>
                                <td class="col5"><strong>$25.00</strong></td>
                            </tr>
                            <tr>
                                <td class="col1"><img src="<@ofbizContentUrl>/shopmax-default/img/product-generic-75x75.jpg</@ofbizContentUrl>" /></td>
                                <td class="col2"><strong class="green"><a href="#">Shop Name</a></strong><br /><strong>Product name 1</strong><br />Colour - yellow</td>
                                <td class="col3"><div class="old">$30.00</div><strong>$25.00</strong></td>
                                <td class="align-right col4">1</td>
                                <td class="col5"><strong>$25.00</strong></td>
                            </tr>
                            <tr>
                                <td class="col1"><img src="<@ofbizContentUrl>/shopmax-default/img/product-generic-75x75.jpg</@ofbizContentUrl>" /></td>
                                <td class="col2"><strong class="green"><a href="#">Shop Name</a></strong><br /><strong>Product name 1</strong><br />Colour - yellow</td>
                                <td class="col3">$25.00</td>
                                <td class="align-right col4">1</td>
                                <td class="col5"><strong>$25.00</strong></td>
                            </tr>
                            <tr>
                                <td class="col1"><img src="<@ofbizContentUrl>/shopmax-default/img/product-generic-75x75.jpg</@ofbizContentUrl>" /></td>
                                <td class="col2"><strong class="green"><a href="#">Shop Name</a></strong><br /><strong>Product name 1</strong><br />Colour - yellow</td>
                                <td class="col3">$25.00</td>
                                <td class="align-right col4">1</td>
                                <td class="col5"><strong>$25.00</strong></td>
                            </tr>
                            <tr>
                                <td colspan="3" style="width:400px;">&nbsp;</td>
                                <td colspan="2" class="bl-table-estimate-shipping">
                                    <table class="table table-condensed">
                                        <tbody>
                                            <tr><td>Sub Total</td><td class="col2">$195.00</td></tr>
                                            <tr><td>Shipping</td><td class="col2">$195.00</td></tr>
                                            <tr><td>Discount</td><td class="col2">$195.00</td></tr>
                                            <tr><td>Sales Tax</td><td class="col2">$195.00</td></tr>
                                        </tbody>
                                        <tfoot>
                                            <tr><td>Total</td><td class="blue">$195.00</td></tr>
                                        </tfoot>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <a href="#" class="btn-general pull-right">Place Order</a>
        </div><!-- /.span9 -->
    </div><!-- /.row -->
</div> <!-- /container -->
