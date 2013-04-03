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
<header id="topnav" class="navbar navbar-inverse navbar-fixed-top clearfix">
    <div class="navbar-inner">
        <div class="container">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <h1 title="Shopmax"><a class="brand" href="/"><img src="<@ofbizContentUrl>shopmax/shopmaximages/img/logo-2.png</@ofbizContentUrl>" width="159" height="55" alt="Shopmax logo" /></a></h1>
            <!-- was <img src="img/logo.png" width="186" height="65" alt="" /> padding:top 10px right 27 -->
            <!--<div class="nav-collapse collapse"> to make it collapse -->
            <div class="header-search">
                <ul class="nav">
                    <li><a href="upload.html">Upload Product</a></li>
                    <li><a href="manage-product.html">Manage Product</a></li>
                    <!--
                    <li class="dropdown">
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
                    <li><a href="manage-orders.html">Manage Orders</a></li>
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
                <h4>Hi <span>James</span></h4>
                <form class="rounded-form">
                    <select id="accountOptions" class="chosen actionable" name="accountOptions">
                        <option selected="selected">My Account</option>
                        <option value="selling.html">Selling</option>
                        <option value="buying.html">Buying</option>
                        <option value="profile.html">Profile</option>
                        <option value="log-out.html">Log Out</option>
                    </select>
                </form>
            </div>
            <!-- CART INFORMATION -->
            <div id="cart-info" class="nav-collapse collapse">
                <h3>3 Items</h3>
                <p><a href="view-cart.html" class="btn-flat round">View Cart</a></p>
                <p><a href="check-out.html" class="btn-flat checkout">Check Out</a></p>
            </div>
        </div><!--/.container -->
    </div><!--/. navbar-inner --> 
</header><!--/. navbar -->