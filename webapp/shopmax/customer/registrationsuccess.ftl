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

<script src="<@ofbizContentUrl>/shopmax-default/js/registration.js</@ofbizContentUrl>" type="text/javascript"></script>
<div class="container content">
    <div id="load-script"></div>
    <!-- include breadcrumb -->
    ${screens.render("component://shopmax/widget/ShopMaxScreens.xml#Breadcrumbs")}
    <div id="load-javascript"></div>
    <div class="row">
        <div class="span3 sidebar" id="side-menu">
            <div class="categories innerbox">
                <h2>Tips</h2>
                <div class="category-list">
                    <h5 class="heading">Register as a standard user</h5>
                    <p>A standard user could...</p>
                    <hr />
                    <h5 class="heading">Register as a Business user</h5>
                    <p>A standard user could...</p>
                </div>
            </div><!-- /.categories .innerbox -->
        </div><!-- /.span3.sidebar -->
    <!-- MAIN CONTENT -->
        <!-- sliderdiv -->
        <div class="span9 main-content">
            <form id="registrationSuccess" name="registrationSuccess" method="post" enctype="multipart/form-data">
                <table class="table table-condensed sc-table sc-table-promotion">
                  <thead>
                    <tr class="sc-table-header">
                      <th class="col1">Registration Successful</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                        <td class="col1 form-horizontal pull-left">
                            <h1 class="header-congratulation">Congratulation !</h1>
                            <#if partyRole?has_content>
                                <p class="intro-txt"><strong>Your registration is successful. It will take 2-3 working days to verify your seller account. You could start using your buyer's account now.</strong></p>
                            <#else>
                                <p class="intro-txt"><strong>Your registration is successful. It will take 2-3 working days to verify your seller account. You could start using your buyer's account now.</strong></p>
                            </#if>
                        </td>
                    </tr>
                  </tbody>
                </table>
            </form>
            <div class="sc-table-promotion footer-button">
            <a href="main" id="shopping-but" class="btn-general-small">Go Shopping</a>
            </div>
        </div>
    </div>
</div>
