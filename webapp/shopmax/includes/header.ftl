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

<#if isDemo?has_content == true>
    <div class="demoMessage">
        ${screens.render("component://ofbizdemo/widget/CommonScreens.xml#demoAnnounceMessage")}
    </div>
</#if>

<div style="display: none;">
    <div id="inline1" style="overflow:auto;">
        <div class="login_popup">
            <div class="title"><h6>login and registration</h6></div>
            <div class="block-left">
                <div class="box">
                    <ul>
                        <form name="login" id="login" action="<@ofbizUrl>login</@ofbizUrl>" method="post">
                            <li>
                                <label class="label-1">Email address</label>
                                <input type="text" class="input-1" name="USERNAME">
                            </li>
                            <li>
                                <label class="label-1">Password</label>
                                <input type="password" class="input-2" name="PASSWORD">
                                <input type="submit" name="" value="Login" class="log_btn">
                                <a href="#" class="forgot">Forgotten password?</a>
                            </li>
                        </form>
                        <li>
                            <p>Don't have an account yet?</p>
                            <a href="<@ofbizUrl>registration</@ofbizUrl>"><input type="submit" name="" value="Register" class="sub_reg"></a>
                        </li>
                    </ul>
                </div>
            </div>
            
            <div class="block-right">
                <ul>
                    <li>OR</li>
                    <li><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/fb_sign-btn.png</@ofbizContentUrl>" alt=""></a></li>
                    <li><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/tweet_sign-btn.png</@ofbizContentUrl>" alt=""></a></li>
                    <li><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/gplus_sign-btn.png</@ofbizContentUrl>" alt=""></a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<header id="topnav" class="navbar navbar-inverse navbar-fixed-top clearfix">
    <div class="navbar-inner">
        <div class="container">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <h1 title="Shopmax"><a class="brand" href="<@ofbizUrl>main</@ofbizUrl>"><img src="<@ofbizContentUrl>/shopmax-default/img/logo-2.png</@ofbizContentUrl>" width="159" height="55" alt="Shopmax logo" /></a></h1>
            <!-- was <img src="img/logo.png" width="186" height="65" alt="" /> padding:top 10px right 27 -->
            <!--<div class="nav-collapse collapse"> to make it collapse -->
            <div class="header-search">
                <ul class="nav">
                    <li><a href="<@ofbizUrl>uploadproduct</@ofbizUrl>">Upload Product</a></li>
                    <li><a href="<@ofbizUrl>manageproduct</@ofbizUrl>">Manage Product</a></li>
                    <!--<li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Action</a></li>
                            <li><a href="#">Another action</a></li>
                            <li><a href="#">Something else here</a></li>
                            <li class="divider"></li>
                            <li class="nav-header">Nav header</li>
                            <li><a href="#">Separated link</a></li>
                            <li><a href="#">One more separated link</a></li>
                        </ul>
                    </li>-->
                    <li><a href="orderlist">Manage Orders</a></li>
                    <li><a href="shopping-list.html">Shopping List</a></li>
                    <li class="last"><a href="buying-orders.html">Buying Orders</a></li>
                </ul>
                <form class="navbar-form pull-left">
                    <div class="field search-filters">
                        <div class="main-search-control">
                            <div class="main-search-dropdown bold">
                            <!--
                            <span class="drop-container">
                                <span class="drop-label"></span>
                                <span class="drop-arrow"></span>
                                -->
                                <select id="SearchType" name="searchType" class="drop-select chosen combo" data-search-bar="true">
                                    <option value="shop1" selected="selected">This Shop</option>
                                    <option value="shop2">Shop 2</option>
                                    <option value="shop3">Shop 3</option>
                                    <option value="shop4">Shop 4</option>
                                </select>
                            <!-- </span> -->
                            </div>
                            <div class="main-search-input">
                                <input type="text" placeholder="Search" name="searchTerm">
                            </div>
                        </div>
                    </div>
                    <div class="pull-left">
                        <button type="submit" class="btn-search pull-left"></button>
                    </div>
                </form>
            </div><!--/.nav-collapse -->
            <!-- PERSONAL GREETING & LINKS -->
            <div id="personal" class="pull-left nav-collapse collapse">
                <#if userLogin?has_content>
                    <h4>Hi <span>
                        <#if sessionAttributes.autoName?has_content && userLogin?has_content>
                            <#assign partyName = delegator.findByPrimaryKey("PartyNameView", {"partyId" : userLogin.partyId?if_exists})?if_exists/>
                            <#if partyName?has_content>
                                ${partyName.firstName?if_exists}
                            </#if>
                        </#if>
                    </span></h4>
                    <form class="rounded-form">
                        <select id="accountOptions" class="chosen actionable" name="accountOptions">
                            <option value="<@ofbizUrl>account</@ofbizUrl>">My Account</option>
                            <option value="selling.html">Selling</option>
                            <option value="buying.html">Buying</option>
                            <option value="<@ofbizUrl>profile</@ofbizUrl>">Profile</option>
                            <option value="<@ofbizUrl>logout</@ofbizUrl>">Log Out</option>
                        </select>
                    </form>
                <#else>
                    <h2>Hello</h2>
                    <p><a id="various1" href="#inline1">Login</a> / <a href="<@ofbizUrl>registration</@ofbizUrl>">Register</a></p>
                </#if>
            </div>
            <!-- CART INFORMATION -->
            <div id="cart-info" class="nav-collapse collapse">
                <h3>${shoppingCartSize} Items</h3>
                <p><a href="<@ofbizUrl>shoppingcart</@ofbizUrl>" class="btn-flat round">View Cart</a></p>
                <p><a href="<@ofbizUrl>checkout</@ofbizUrl>" class="btn-flat checkout">Check Out</a></p>
            </div>
        </div><!--/.container -->
    </div><!--/. navbar-inner -->
</header><!--/. navbar -->
