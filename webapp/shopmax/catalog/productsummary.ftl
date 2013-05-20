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

<#if product?exists>
    <#if headerItem?if_exists == "categorygridview" || headerItem?if_exists == "shopcategorygridview">
        <div class="block_1">
            <#if productImage?exists>
                <#-- <div class="image"><@ofbizContentUrl>${contentPathPrefix?if_exists}${productImage?if_exists}</@ofbizContentUrl>" alt=""></div> -->
                <div class="image"><img src="<@ofbizContentUrl>/shopmax-default/img/img_1.png</@ofbizContentUrl>" alt=""></div>
            <#else>
                <div class="image"><img src="<@ofbizContentUrl>/shopmax-default/img/img_1.png</@ofbizContentUrl>" alt=""></div>
            </#if>
            <div class="mdic">${product.productName?if_exists}</div>
            <#if price.promoPrice?exists>
                <div class="price"><span>$${price.price?if_exists} NZD</span>$${price.promoPrice?if_exists} NZD</div>
            <#else>
                <div class="price">$${price.price?if_exists} NZD</div>
            </#if>
            <div class="stars">
                <div class="raty" data-rating="${averageRating?if_exists}"></div>
            </div>
            <p>${product.description?if_exists}</p>
            <p>Shop: <strong>${shopName?if_exists}</strong><br>Destance: <strong>About 1km</strong></p>
            <div class="buttonbox"><a href="#" class="btn-general">ADD TO CART</a></div>
            <div class="buttonbox"><a href="#" class="addtolist">Add to shopping List</a></div>
        </div>
    <#elseif headerItem?if_exists == "categorylistview" || headerItem?if_exists == "shopcategorylistview">
        <div class="block_1">
            <#-- <div class="image"><img src="<@ofbizContentUrl>/shopmax-default/img/img_1.png</@ofbizContentUrl>" alt=""></div> -->
            <div class="image"><img src="<@ofbizContentUrl>/shopmax-default/img/img_1.png</@ofbizContentUrl>" alt=""></div>
            <div class="mdic">${product.productName?if_exists}</div>
            <div class="pricestar">
                <#if price.promoPrice?exists>
                    <div class="price"><span>$${price.price?if_exists} NZD</span>$${price.promoPrice?if_exists} NZD</div>
                <#else>
                    <div class="price">$${price.price?if_exists} NZD</div>
                </#if>
                <div class="stars">
                    <div class="raty" data-rating="${averageRating?if_exists}"></div>
                </div>
            </div>
            <p>${product.description?if_exists}</p>
            <div class="distancebox"><p>Shop: <strong>${shopName?if_exists}</strong><span></span>Destance: <strong>About 1km</strong></p></div>
            <div class="buttonbox"><a href="#" class="btn-general">ADD TO CART</a><a href="#" class="addtolist">Add to shopping List</a></div>
        </div>
    </#if>
</#if>
