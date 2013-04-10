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
            <div class="categories innerbox">
                <h2>Tips</h2>
                <div class="category-list">
                    <p>
                    content here
                    </p>
                </div>
            </div><!-- /.categories .innerbox -->
        </div><!-- /.span3.sidebar -->
        <!-- MAIN CONTENT -->
        <!-- sliderdiv -->
        <div class="span9 main-content">
            <table class="table table-condensed sc-table sc-table-promotion">
              <thead>
                <tr class="sc-table-header">
                  <th class="col1">Online Marketing Campaigns</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                    <td class="col1">
                        <ul class="nav nav-tabs" id="myTab">
                          <li class="active"><a data-toggle="tab" href="#activeCampaign">Active Campaign</a></li>
                          <li class=""><a data-toggle="tab" href="#pastCampaign">Past Campaign</a></li>
                        </ul>
                        <div class="tab-content" id="myTabContent">
                          <div id="activeCampaign" class="tab-pane fade active in">
                            <table class="table table-condensed">
                                <thead>
                                    <tr>
                                        <th>Created Date</th>
                                        <th>Keywords</th>
                                        <th>Cost Per View</th>
                                        <th>Total Budget</th>
                                        <th>Remain Balance</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr><td>01/10/2012</td><td>iPod, iPad, iPhone</td><td>$0.03</td><td>$500.00</td><td>$100.00</td></tr>
                                    <tr><td>01/10/2012</td><td>iPod, iPad, iPhone</td><td>$0.03</td><td>$500.00</td><td>$100.00</td></tr>
                                    <tr><td>01/10/2012</td><td>iPod, iPad, iPhone</td><td>$0.03</td><td>$500.00</td><td>$100.00</td></tr>
                                </tbody>
                            </table>
                          </div>
                          <div id="pastCampaign" class="tab-pane fade">
                            <p>Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid. Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee. Qui photo booth letterpress, commodo enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR. Homo nostrud organic, assumenda labore aesthetic magna delectus mollit. Keytar helvetica VHS salvia yr, vero magna velit sapiente labore stumptown. Vegan fanny pack odio cillum wes anderson 8-bit, sustainable jean shorts beard ut DIY ethical culpa terry richardson biodiesel. Art party scenester stumptown, tumblr butcher vero sint qui sapiente accusamus tattooed echo park.</p>
                          </div>
                        </div>
                        <br />  
                        <a class="btn-general pull-right" href="<@ofbizUrl>createcampaign</@ofbizUrl>">Create Campaign</a>
                        <br /><br />
                    </td>
                </tr>
              </tbody>
            </table>
        </div><!-- /.span9 -->
    </div><!-- /.row -->
</div> <!-- /container -->
