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

<div class="container content">
    <!-- include breadcrumb -->
    ${screens.render("component://shopmax/widget/ShopMaxScreens.xml#Breadcrumbs")}
    <div id="summary" class="clearfix">
        <div class="title_grn clearfix"><h6>sale summary graphic</h6></div>
        <div class="title clearfix">
            <ul>
                <li>
                    <span class="span-1">FROM</span>
                    <input type="text" placeholder="18/01/2006" class="input-1">
                    <a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/icon-calendar.png</@ofbizContentUrl>" alt=""></a>
                </li>
                <li>
                    <span class="span-1">TO</span>
                    <input type="text" placeholder="18/10/2006" class="input-1">
                    <a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/icon-calendar.png</@ofbizContentUrl>" alt=""></a>
                </li>
            </ul>
        </div>
        <div class="block clearfix">
            <div class="block-1">
                <div class="box-1">
                    <h6>Sales amount</h6>
                    <ul>
                        <li>&#36;7000</li>
                        <li>&#36;6000</li>
                        <li>&#36;5000</li>
                        <li>&#36;4000</li>
                        <li>&#36;3000</li>
                        <li>&#36;2000</li>
                        <li>&#36;1000</li>
                        <li>&#36;500</li>
                    </ul>
                </div>
                <div class="box-2">
                    <ul>
                        <li>Jan</li>
                        <li>Feb</li>
                        <li>Mar</li>
                        <li>Apr</li>
                        <li>May</li>
                        <li>Jun</li>
                        <li>Jul</li>
                        <li>Aug</li>
                        <li>Sep</li>
                        <li>Oct</li>
                    </ul>
                </div>
            </div>
            
            <div class="block-2">
                <ul>
                    <li><span class="span-1">12533 <strong>Visitors</strong></span></li>
                    <li>
                        <p>Total GST</p>
                        <input type="text" placeholder="&#36;1632" class="input-1">
                        <p>NZD</p>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!-- /.row -->
    
    <div class="row content-left">
        <!-- MAIN CONTENT -->
        <div class="span9 main-content">
            <div class="summary_block">
                <div class="title_grn">
                    <h6>Top 10 selling product in last</h6>
                    <select class="select-1">
                        <option>30 Days</option>
                        <option>90 Days</option>
                        <option>180 Days</option>
                        <option>1 year</option>
                    </select>
                </div>
                <div class="block clearfix">
                    <table cellpadding="0" cellspacing="0" border="0" class="table-1">
                        <tr>
                            <td width="35px">1</td>
                            <td width="100px">abc...</td>
                            <td width="102px">2305</td>
                            <td width="55px">sold</td>
                        </tr>
                        <tr>
                            <td width="35px">2</td>
                            <td width="100px">def...</td>
                            <td width="102px">1245</td>
                            <td width="55px">sold</td>
                        </tr>
                        <tr>
                            <td width="35px">3</td>
                            <td width="100px">ghi...</td>
                            <td width="102px">954</td>
                            <td width="55px">sold</td>
                        </tr>
                        <tr>
                            <td width="35px">4</td>
                            <td width="100px">jkl...</td>
                            <td width="102px">75</td>
                            <td width="55px">sold</td>
                        </tr>
                        <tr>
                            <td width="35px">5</td>
                            <td width="100px">mno...</td>
                            <td width="102px">66</td>
                            <td width="55px">sold</td>
                        </tr>
                        <tr>
                            <td width="35px">6</td>
                            <td width="100px">pqr...</td>
                            <td width="102px">562</td>
                            <td width="55px">sold</td>
                        </tr>
                        <tr>
                            <td width="35px">...</td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div><!-- /.span9 -->
        
        <!-- sidebar -->
        <div class="span3 sidebar">
            <div class="title2">
                <h6>recent top search</h6>
            </div>
            <div class="block">
                <div class="top_search">
                    <ul>
                        <li><span class="span-1">1</span><a href="#">iPhone</a></li>
                        <li><span class="span-1">2</span><a href="#">Android</a></li>
                        <li><span class="span-1">3</span><a href="#">Samsung</a></li>
                        <li><span class="span-1">4</span></li>
                        <li><span class="span-1">...</span></li>
                    </ul>
                </div>
            </div>
        </div><!-- /.span3.sidebar -->
    </div>
</div>
