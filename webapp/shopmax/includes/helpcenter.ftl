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

<script>
    $(function(){
        $('body').removeClass('home');
        $('body').addClass('help');
        $(".tabnavs li").click(function(){
            location.href = $(this).find("a").attr("href");
        });
    });
</script>
<!-- This code is taken from http://twitter.github.com/bootstrap/examples/hero.html -->
<div class="container content">
    <div class="row">
        <a class="skip-link small" href="#side-menu">Skip to sidebar menu</a>
    </div>
    <#include "component://shopmax/webapp/shopmax/includes/breadcrum.ftl" />
    <div class="row">
    <!-- MAIN CONTENT -->
        <!-- sliderdiv -->
        <div class="span9 main-content no-gaps">
            <div class="tabbed">
                <div class="search-box">
                    <form class="help-form">
                        <h3>Search for Help
                        <input type="text" id="search-term" name="search-term"  />
                        <button class="btn-search" type="submit"></button>
                        </h3>
                    </form>
                </div>
                ${screens.render("component://shopmax/widget/ShopMaxScreens.xml#HelpCenterContent")}
            </div><!-- /.tabbed -->
        </div><!-- /.span9 -->
        <!-- sidebar -->
        <div class="span3 sidebar" id="side-menu">
            <div class="categories innerbox georgia grey">
                <div class="tabs">
                    <ul class="tabnavs">
                        <li <#if parameters.contentId?if_exists == "SHOPMAX_FAQs">class="active"</#if>><h3><a href="<@OfbizContentAltUrl contentId="SHOPMAX_FAQs" viewContent="helpcenter"/>">FAQ</a></h3></li></a>
                        <li <#if parameters.contentId?if_exists == "SHOPMAX_ABOUT">class="active"</#if>><h3><a href="<@OfbizContentAltUrl contentId="SHOPMAX_ABOUT" viewContent="helpcenter"/>">About Us</a></h3></li>
                        <li <#if parameters.contentId?if_exists == "SHOPMAX_BUYER_BF">class="active"</#if>><h3><a href="<@OfbizContentAltUrl contentId="SHOPMAX_BUYER_BF" viewContent="helpcenter"/>">Benefits for Buyers</a></h3></li>
                        <li <#if parameters.contentId?if_exists == "SHOPMAX_SELLER_BF">class="active"</#if>><h3><a href="<@OfbizContentAltUrl contentId="SHOPMAX_SELLER_BF" viewContent="helpcenter"/>">Benefits for Sellers</a></h3></li>
                        <li <#if parameters.contentId?if_exists == "SHOPMAX_CONTACT">class="active"</#if>><h3><a href="<@OfbizContentAltUrl contentId="SHOPMAX_CONTACT" viewContent="helpcenter"/>">Contact Us</a></h3></li>
                    </ul>
                </div><!-- /.tabs-->
            </div><!-- /.categories .innerbox -->
        </div><!-- /.span3.sidebar -->
    </div><!-- /.row -->                
</div> <!-- /container -->
