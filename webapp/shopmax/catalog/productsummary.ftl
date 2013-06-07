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
        $('.additem').each(function(){
            var img = $('#image_'+this.id).find('img');
            $(this).click(function(){
                flyToElement($(img), $('#cart-info'));
                return false;
            });
        });
    });
</script>

<#if product?exists>
    <#if headerItem?if_exists == "categorygridview" || headerItem?if_exists == "shopcategorygridview">
        <div class="block_1">
            <a href="<@ofbizUrl>product?product_id=${product.productId}</@ofbizUrl>">
                <#if productImage?exists>
                    <div class="image" id="image_additem_${listIndex}"><img src="<@ofbizContentUrl>${productImage}</@ofbizContentUrl>" alt="" width="153" style="height: 153px;"/></div>
                <#else>
                    <div class="image" id="image_additem_${listIndex}"><img src="<@ofbizContentUrl>/images/defaultImage.jpg</@ofbizContentUrl>" alt="" width="153" style="height: 153px;"></div>
                </#if>
            </a>
            <div class="mdic">${product.productName?if_exists}</div>
            <#if price.specialPromoPrice?exists>
                <div class="price"><span><@ofbizCurrency amount=price.price/> NZD</span><@ofbizCurrency amount=price.specialPromoPrice/> NZD</div>
            <#else>
                <div class="price"><@ofbizCurrency amount=price.price/> NZD</div>
            </#if>
            <div class="stars">
                <div class="raty" data-rating="${averageRating?if_exists}"></div>
            </div>
            <p>${product.longDescription?if_exists}</p>
            <p>Shop: <strong>${shopName?if_exists}</strong><br>Destance: <strong>About 1km</strong></p>
            <div class="buttonbox">
                <form method="post" name="addform" id="${product.productId}" style="margin: 0;">
                    <fieldset>
                        <input type="hidden" name="add_product_id" value="${product.productId}" />
                        <input type="hidden" name="quantity" value="1" />
                        <a class="btn-general additem" id="additem_${listIndex}" onclick="addItem('${product.productId}');">ADD TO CART</a>
                    </fieldset>
                </form>
            </div>
            <div class="buttonbox"><a href="#" class="addtolist">Add to shopping List</a></div>
        </div>
    <#elseif headerItem?if_exists == "categorylistview" || headerItem?if_exists == "shopcategorylistview">
        <div class="block_1">
            <a href="<@ofbizUrl>product?product_id=${product.productId}</@ofbizUrl>">
                <#if productImage?exists>
                    <div class="image" id="image_additem_${listIndex}"><img src="<@ofbizContentUrl>${productImage}</@ofbizContentUrl>" alt="" width="153" style="height: 153px;"/></div>
                <#else>
                    <div class="image" id="image_additem_${listIndex}"><img src="<@ofbizContentUrl>/images/defaultImage.jpg</@ofbizContentUrl>" alt="" width="153" style="height: 153px;"></div>
                </#if>
            </a>
            <div class="mdic">${product.productName?if_exists}</div>
            <div class="pricestar">
                <#if price.specialPromoPrice?exists>
                    <div class="price"><span><@ofbizCurrency amount=price.price/> NZD</span><@ofbizCurrency amount=price.specialPromoPrice/> NZD</div>
                <#else>
                    <div class="price"><@ofbizCurrency amount=price.price/> NZD</div>
                </#if>
                <div class="stars">
                    <div class="raty" data-rating="${averageRating?if_exists}"></div>
                </div>
            </div>
            <p>${product.longDescription?if_exists}</p>
            <div class="distancebox"><p>Shop: <strong>${shopName?if_exists}</strong><span></span>Destance: <strong>About 1km</strong></p></div>
            <div class="buttonbox">
                <form method="post" id="${product.productId}" name="addform" style="margin: 0;">
                    <fieldset>
                        <input type="hidden" name="add_product_id" value="${product.productId}" />
                        <input type="hidden" name="quantity" value="1" />
                        <a class="btn-general" id="additem_${listIndex}" onclick="addItem('${product.productId}');">ADD TO CART</a>
                        <a href="#" class="addtolist">Add to shopping List</a>
                    </fieldset>
                </form>
            </div>
        </div>
    </#if>
</#if>
