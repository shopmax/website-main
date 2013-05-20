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
            <div class="pmt_option clearfix">
                <div class="title_grn"><h6>Payment Option</h6></div>
                <div class="block clearfix">
                    <div class="credit_box clearfix">
                        <div class="box-1">
                            <input type="radio" class="radio" name="cards" value="creditCard" checked>
                            <label class="label-1">Credit card</label>
                        </div>
                        <div class="box-2 clearfix">
                            <ul>
                                <li>
                                    <label class="label-1">Card holder name:</label>
                                    <input type="text" class="input-1">
                                </li>
                                <li>
                                    <label class="label-1">Card number:</label>
                                    <input type="text" class="input-1 input-3">
                                    <input type="text" class="input-1 input-2">
                                    <input type="text" class="input-1 input-3">
                                    <input type="text" class="input-1 input-4">
                                </li>
                                <li>
                                    <label class="label-1">Expiry date:</label>
                                    <input type="text" class="input-1">
                                </li>
                                <li>
                                    <label class="label-1">Security code:</label>
                                    <input type="text" class="input-1">
                                    <a href="#" class="get-code"><img src="img/help.png" alt=""></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="debit_box clearfix">
                        <div class="box-1">
                            <input type="radio" class="radio" name="cards" value="debitCard">
                            <label class="label-1">Debit card</label>
                        </div>
                        <div class="box-2">
                            <ul>
                                <li><a href="#">Download a direct debit form</a></li>
                                <li>
                                    <label class="label-1">Upload a direct debit form</label>
                                    <input type="text" class="brows">
                                    <input type="button" name="" value="Brows" class="brows_btn">
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="opt_buttons">
                    <input type="submit" name="" value="CANCEL" class="cancel">
                    <input type="submit" name="" value="submit" class="submit">
                </div>
            </div>
        </div><!-- /.span9 -->
        <!-- sidebar -->
        <div class="span3 sidebar">
            <div class="title"><h6>Account balance</h6></div>
            <div class="block">
                <div class="acc_box">
                    <p>Your current balance: <strong>&#36;100.00</strong></p>
                    <p>We will credit <span>&#36;100</span> into your bank account at the end of this month</p>
                </div>
            </div>
        </div><!-- /.span3.sidebar -->
    </div><!-- /.row -->
</div> <!-- /container -->
