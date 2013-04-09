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
                                            <th>customer</th>
                                            <th>Shipping status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>28/09/2012 - 10:12</td>
                                            <td>000987</td>
                                            <td>$299.00</td>
                                            <td>James</td>
                                            <td>Pickup in store</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div id="Pending" class="tab-pane fade">
                                <p>Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid. Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee. Qui photo booth letterpress, commodo enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR. Homo nostrud organic, assumenda labore aesthetic magna delectus mollit. Keytar helvetica VHS salvia yr, vero magna velit sapiente labore stumptown. Vegan fanny pack odio cillum wes anderson 8-bit, sustainable jean shorts beard ut DIY ethical culpa terry richardson biodiesel. Art party scenester stumptown, tumblr butcher vero sint qui sapiente accusamus tattooed echo park.</p>
                            </div>
                            <div id="Processing" class="tab-pane fade">
                                <p>Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid. Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee. Qui photo booth letterpress, commodo enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR. Homo nostrud organic, assumenda labore aesthetic magna delectus mollit. Keytar helvetica VHS salvia yr, vero magna velit sapiente labore stumptown. Vegan fanny pack odio cillum wes anderson 8-bit, sustainable jean shorts beard ut DIY ethical culpa terry richardson biodiesel. Art party scenester stumptown, tumblr butcher vero sint qui sapiente accusamus tattooed echo park.</p>
                            </div>
                            <div id="Completed" class="tab-pane fade">
                                <p>Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid. Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee. Qui photo booth letterpress, commodo enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR. Homo nostrud organic, assumenda labore aesthetic magna delectus mollit. Keytar helvetica VHS salvia yr, vero magna velit sapiente labore stumptown. Vegan fanny pack odio cillum wes anderson 8-bit, sustainable jean shorts beard ut DIY ethical culpa terry richardson biodiesel. Art party scenester stumptown, tumblr butcher vero sint qui sapiente accusamus tattooed echo park.</p>
                            </div>
                            <div id="Returned" class="tab-pane fade">
                                <p>Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid. Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee. Qui photo booth letterpress, commodo enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR. Homo nostrud organic, assumenda labore aesthetic magna delectus mollit. Keytar helvetica VHS salvia yr, vero magna velit sapiente labore stumptown. Vegan fanny pack odio cillum wes anderson 8-bit, sustainable jean shorts beard ut DIY ethical culpa terry richardson biodiesel. Art party scenester stumptown, tumblr butcher vero sint qui sapiente accusamus tattooed echo park.</p>
                            </div>
                            <div id="SearchResult" class="tab-pane fade">
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
