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
    
    <div class="row content-left">
        <!-- include shop header -->
        <#include "component://shopmax/webapp/shopmax/shop/shopheader.ftl" />
    </div>
    
    <!-- include shop product detail -->
    <div class="row content-left">
        <div class="span6">
            <div class="product-wrapper">
                <div class="product-inner">
                    <!-- <img src="http://placehold.it/472x472">  -->
                    <img src="<#if productImageList?has_content><@ofbizContentUrl>${productImageList[0].productImage}</@ofbizContentUrl><#else><@ofbizContentUrl>/images/defaultImage.jpg</@ofbizContentUrl></#if>" width="472" style="height:472px;"/>
                </div>
            </div>
            
            <ul class="product-thumbs">
                <#if productImageList?has_content>
                    <#list productImageList as productImage>
                        <li>
                            <div class="product-thumb-wrapper">
                                <div class="product-thumb-inner">
                                    <a href="#"><img src="<@ofbizContentUrl>${productImage.productImage?default("/images/defaultImage.jpg")}</@ofbizContentUrl>" width="143" style="height:143px;"/></a>
                                </div>
                            </div>
                        </li>
                    </#list>
                </#if>
            </ul>
        </div>
        <div class="span6">
            <div class="product-detail">
                <h5>${parameters.productName?if_exists}</h5>
                <div class="raty" data-rating="5"></div>
                <h5 class="review-number">(0 reviews)</h5>
                <br /><br />
                <#if parameters.promoPrice?exists>
                    <h5 class="old"><@ofbizCurrency amount=parameters.defaultPrice/> NZD</h5>
                    <h1><@ofbizCurrency amount=parameters.promoPrice/> NZD</h1>
                <#else>
                    <h1><@ofbizCurrency amount=parameters.defaultPrice/> NZD</h1>
                </#if>
                
                Quantity: <strong>${parameters.stock?if_exists} in stock</strong> <br /> <br />
                
                <button class="btn-large blue cart" type="submit">ADD TO CART</button>
                <ul class="selectAction">
                    <li><a href="#">Add to shopping list</a></li>
                    <li><a href="#">Share with a friend</a></li>
                </ul>
            </div>
        </div>
    </div>
    
    <div class="row content-left">
        <div class="span12 product-detail product-tab">
            <ul class="nav nav-tabs georgia" id="myTab">
                <li class="active"><a data-toggle="tab" href="#prdDesc">Product Description</a></li>
            </ul>
            <div class="tab-content" id="myTabContent">
                <div id="prdDesc" class="tab-pane fade active in">
                    <p>${parameters.description?if_exists}</p>
                </div>
            </div>
        </div>
    </div>
</div>
