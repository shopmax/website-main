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
        $('body').addClass('rush-hour group-bang landing');
    });
</script>

<div class="row content-left">
    <div class="span6">
        <div class="product-wrapper">
            <div class="product-inner">
                <img src="<@ofbizContentUrl>/shopmax-default/img/product-generic-472x472.jpg</@ofbizContentUrl>" />
            </div>
        </div>
        <ul class="product-thumbs">
            <li>
                <div class="product-thumb-wrapper">
                    <div class="product-thumb-inner">
                        <a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/product-generic-145x145.jpg</@ofbizContentUrl>" /></a>
                    </div>
                </div>
            </li>
            <li>
                <div class="product-thumb-wrapper">
                    <div class="product-thumb-inner">
                        <a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/product-generic-145x145.jpg</@ofbizContentUrl>" /></a>
                    </div>
                </div>
            </li>
            <li>
                <div class="product-thumb-wrapper">
                    <div class="product-thumb-inner">
                        <a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/product-generic-145x145.jpg</@ofbizContentUrl>" /></a>
                    </div>
                </div>
            </li>
        </ul>
    </div>
    <div class="span6">
        <div class="product-detail">
            <h5>Product name</h5>
            <div class="raty" data-rating="3"></div>
            <h5 class="review-number">(768 reviews)</h5>
            <img src="<@ofbizContentUrl>/shopmax-default/img/product-slider.png</@ofbizContentUrl>" />
            <h5 class="georgia deal-end">Deals Ends in</h5>
            <h3 class="time-left countdown-container"><span class="countdown" id="countdown-time-left"></span></h3>
            
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
                        <a href=#><img src="<@ofbizContentUrl>/shopmax-default/img/color-black.png</@ofbizContentUrl>" /></a>
                    </li>                           
                    <li>
                        <a href=#><img src="<@ofbizContentUrl>/shopmax-default/img/color-grey.png</@ofbizContentUrl>" /></a>
                    </li>
                    <li>
                        <a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/color-white.png</@ofbizContentUrl>" /></a>
                    </li>
                    <li>
                        <a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/color-green.png</@ofbizContentUrl>" /></a>
                    </li>                           
                    <li>
                        <a href=#><img src="<@ofbizContentUrl>/shopmax-default/img/color-blue.png</@ofbizContentUrl>" /></a>
                    </li>
                    <li>
                        <a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/color-purple.png</@ofbizContentUrl>" /></a>
                    </li>
                    <li>
                        <a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/color-organ.png</@ofbizContentUrl>" /></a>
                    </li>
                </ul>
            </div>

            Quantity: <strong>178 in stock</strong> <br /> <br />

            <button class="btn-large blue cart" type="submit">ADD TO CART</button>
            <ul class="selectAction">
                <li><a href="#">Add to shopping list</a></li>
                <li><a href="#">Share with a friend</a></li>
            </ul>
        </div>
    </div>
</div>
