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
                    <#include "component://shopmax/webapp/shopmax/order/ordersummarydetail.ftl" />
                </div>
            </div>
            <a href="#" class="btn-general pull-right">Place Order</a>
        </div><!-- /.span9 -->
    </div><!-- /.row -->
</div> <!-- /container -->
