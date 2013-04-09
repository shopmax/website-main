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
    <#include "component://shopmax/webapp/shopmax/includes/breadcrum.ftl" />
    <div class="row">
        <div class="span3 sidebar" id="side-menu">
            <div class="categories innerbox largeheading">
                <h2>Account balance</h2>
                <div class="category-list">
                    <div class="accountbalance">
                        <p>Your current balance:</p>
                        <p class="text-error"><strong>-$0.90</strong></p>
                        <p>Your account is in debt, $100 will be deducted at the end of this month</p>
                        <a href="#" class="btn-general">Pay now</a>
                    </div>
                </div>
            </div><!-- /.categories .innerbox -->
        </div><!-- /.span3.sidebar -->
        
        <!-- MAIN CONTENT -->
        <!-- sliderdiv -->
        <div class="span9 main-content">
            <table class="table table-condensed sc-table sc-table-promotion">
              <thead>
                <tr class="sc-table-header">
                  <th class="col1">Transaction history</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                    <td class="col1">
                        <div class="fromtodate clearfix">
                            <span>From</span>
                            <input type="text" class="span1">
                            <img src="<@ofbizContentUrl>/shopmax-default/img/icon-calendar.png</@ofbizContentUrl>" alt="" style="float:left; margin:6px 0 0 5px;">
                            <span class="padd">To</span>
                            <input type="text" class="span1">
                            <img src="<@ofbizContentUrl>/shopmax-default/img/icon-calendar.png</@ofbizContentUrl>" alt="" style="float:left; margin:6px 0 0 5px;">
                        </div>
                        <ul class="nav nav-tabs nav-tabs_large" id="myTab">
                          <li class="active"><a data-toggle="tab" href="#Transaction">Transaction</a></li>
                          <li class=""><a data-toggle="tab" href="#billing">Invoice</a></li>
                          <li class=""><a data-toggle="tab" href="#Payment">Payment</a></li>
                        </ul>
                        <div class="tab-content" id="myTabContent">
                            <div id="Transaction" class="tab-pane fade active in">
                                <table class="table table-condensed">
                                    <thead>
                                        <tr>
                                            <th>Date</th>
                                            <th>Invoice number</th>
                                            <th>Amount</th>
                                            <th>Due day</th>
                                            <th>Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>01/08/2013</td>
                                            <td>Inv. AKL-10533.pdf</td>
                                            <td>$800.00</td>
                                            <td>01/09/2013</td>
                                            <td>Unpaid</td>
                                        </tr>
                                        <tr>
                                            <td>01/08/2013</td>
                                            <td>Inv. AKL-00342.pdf</td>
                                            <td>$200.00</td>
                                            <td>01/10/2013</td>
                                            <td>Overdue</td>
                                        </tr>
                                        <tr>
                                            <td>01/08/2013</td>
                                            <td>Inv. AKL-00342.pdf</td>
                                            <td>$800.00</td>
                                            <td>01/09/2013</td>
                                            <td>Paid</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div id="billing" class="tab-pane fade">
                                <p>Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid. Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee. Qui photo booth letterpress, commodo enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR. Homo nostrud organic, assumenda labore aesthetic magna delectus mollit. Keytar helvetica VHS salvia yr, vero magna velit sapiente labore stumptown. Vegan fanny pack odio cillum wes anderson 8-bit, sustainable jean shorts beard ut DIY ethical culpa terry richardson biodiesel. Art party scenester stumptown, tumblr butcher vero sint qui sapiente accusamus tattooed echo park.</p>
                            </div>
                            <div id="Payment" class="tab-pane fade">
                                <p>Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid. Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee. Qui photo booth letterpress, commodo enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR. Homo nostrud organic, assumenda labore aesthetic magna delectus mollit. Keytar helvetica VHS salvia yr, vero magna velit sapiente labore stumptown. Vegan fanny pack odio cillum wes anderson 8-bit, sustainable jean shorts beard ut DIY ethical culpa terry richardson biodiesel. Art party scenester stumptown, tumblr butcher vero sint qui sapiente accusamus tattooed echo park.</p>
                            </div>
                        </div>
                    </td>
                </tr>
              </tbody>
            </table>
        </div><!-- /.span9 -->
    </div><!-- /.row --> 
</div> <!-- /container -->
