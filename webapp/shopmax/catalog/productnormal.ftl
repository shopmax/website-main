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
        $('.additem-productdetail').click(function(){
            var img1 = $('#product-image').find('img');
            flyToElement($(img1), $('#cart-info'));
            return false;
        });
    });
</script>
<style>
.btn-large.grey {
    background-color:#8F8F8F;
    text-shadow:none;
    color:#fff;
    box-shadow: 1px 1px 1px #888888;
    border-bottom: 1px solid #000000;
    border-top: 1px solid #000000;
}
</style>
<div class="row content-left">
    <div class="span6">
        <div class="product-wrapper">
            <div class="product-inner" id="product-image">
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
            <h5>${productContentWrapper.get("PRODUCT_NAME")?if_exists}</h5>
            <div class="raty" data-rating="${averageRating?if_exists}"></div>
            <h5 class="review-number">(${productReviews.size()} reviews)</h5>
            <br /><br />
            <#if price.specialPromoPrice?exists>
                <h5 class="old"><@ofbizCurrency amount=price.price/> NZD</h5>
                <h1><@ofbizCurrency amount=price.specialPromoPrice/> NZD</h1>
            <#else>
                <h1><@ofbizCurrency amount=price.price/> NZD</h1>
            </#if>
            
            <#if "Y" = product.isVirtual?if_exists>
                <div class="row selectSize" >
                    <div class="span1">Size</div>
                    <div class="span3">
                        <select name="productSize" class="drop-select chosen combo" data-search-bar="true">
                                <option value="" selected="selected">Select</option>
                                <option value="1">Small</option>
                                <option value="2">Medium</option>
                                <option value="3">Large</option>
                        </select>
                    </div>
                    <div class="span2">
                        <a href="#">Size info</a>
                    </div>
                </div>
                
                <div class="selectColor">
                    Colour: <strong>326-540 - Ox Red/Royal Blue</strong>
                    <ul>
                        <li>
                            <a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/color-black.png</@ofbizContentUrl>" /></a>
                        </li>
                        <li>
                            <a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/color-grey.png</@ofbizContentUrl>" /></a>
                        </li>
                        <li>
                            <a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/color-white.png</@ofbizContentUrl>" /></a>
                        </li>
                        <li>
                            <a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/color-green.png</@ofbizContentUrl>" /></a>
                        </li>
                        <li>
                            <a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/color-blue.png</@ofbizContentUrl>" /></a>
                        </li>
                        <li>
                            <a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/color-purple.png</@ofbizContentUrl>" /></a>
                        </li>
                        <li>
                            <a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/color-organ.png</@ofbizContentUrl>" /></a>
                        </li>
                    </ul>
                </div>
            </#if>
            
            <#assign stock = (delegator.findOne("ProductAttribute", {"productId" : product.productId, "attrName" : "STOCK"}, true))?if_exists>
            <#if stock?has_content>
                Quantity: <strong>${stock.attrValue?if_exists} in stock</strong> <br /> <br />
            <#else>
                Quantity: <strong>${availableInventory?default(0)} in stock</strong> <br /> <br />
            </#if>
            
            <div id="addItemForm">
                <form method="post" action="<@ofbizUrl>additem</@ofbizUrl>" id="${product.productId}" name="addform"  style="margin: 0;">
                    <fieldset>
                        <input type="hidden" name="add_product_id" value="${product.productId}" />
                        <input type="hidden" name="quantity" value="1" />
                        <#if price.specialPromoPrice?exists>
                            <input type="hidden" name="price" value="${price.specialPromoPrice}" />
                        <#else>
                            <input type="hidden" name="price" value="${price.price}" />
                        </#if>
                        <#if !stock?has_content || "0" = stock.attrValue?if_exists>
                            <button class="btn-large grey cart" type="button" value="OUT OF STOCK">OUT OF STOCK</button>
                        <#else>
                            <a class="btn-large blue cart additem-productdetail" onclick="addItem('${product.productId}');">ADD TO CART</a>
                        </#if>
                        <ul class="selectAction">
                            <li><a href="#">Add to shopping list</a></li>
                            <li><a href="#">Share with a friend</a></li>
                        </ul>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
</div>
