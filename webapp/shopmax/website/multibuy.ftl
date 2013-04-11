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
        $('body').addClass('multi-buy landing');
    });
</script>

<div class="container content">
    <#include "component://shopmax/webapp/shopmax/includes/breadcrum.ftl" />
    <div class="row content-left">
        <!-- MAIN CONTENT -->
        <!-- sliderdiv -->
        <div class="span12 main-content">
            <h2>Multi Buy</h2>
            <h3 class="time-left countdown-container">Hurry! Time Left to Buy
            <span class="countdown" id="countdown-time-left"><!-- see /js/main.js for counter --></span></h3>
            <h4 class="countdown-container buy-one">Buy one get one half price</h4>
            <!-- product list starts here -->
            <div class="list-wrapper">
                <ul>
                    <li><p class="share pull-right">Share with  <a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/email.png</@ofbizContentUrl>" width="23" height="23" alt="" /></a><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/fb.png</@ofbizContentUrl>" width="23" height="23" alt="" /></a><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/tw.png</@ofbizContentUrl>" width="23" height="23" alt="" /></a><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/gplus.png</@ofbizContentUrl>" width="23" height="23" alt="" /></a></p></li>
                </ul>
                <!-- buy one list -->
                <ul class="product-list buy-this span-half">
                    <li><h4>Buy This</h4></li>
                    <li>
                        <form class="pull-left">
                            <input type="checkbox" checked name="product1" />
                        </form>
                        <img src="<@ofbizContentUrl>/shopmax-default/img/product-generic.png</@ofbizContentUrl>" width="60" height="60" alt="" class="pull-left" />
                        <h5>Product Name<span class="raty" data-rating="3"></span></h5>
                        <p class="price">$135.00</p>
                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Cras non mauris. Praesent</p>
                    </li>
                    <li>
                        <form class="pull-left">
                            <input type="checkbox" checked name="product2" />
                        </form>
                        <img src="<@ofbizContentUrl>/shopmax-default/img/product-generic.png</@ofbizContentUrl>" width="60" height="60" alt="" class="pull-left" />
                        <h5>Product Name<span class="raty" data-rating="1"></span></h5>
                        <p class="price">$135.00</p>
                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Cras non mauris. Praesent</p>
                    </li>
                    <li>
                        <form class="pull-left">
                            <input type="checkbox" checked name="product3" />
                        </form>
                        <img src="<@ofbizContentUrl>/shopmax-default/img/product-generic.png</@ofbizContentUrl>" width="60" height="60" alt="" class="pull-left" />
                        <h5>Product Name<span class="raty" data-rating="2"></span></h5>
                        <p class="price">$135.00</p>
                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Cras non mauris. Praesent</p>
                    </li>
                    <li>
                        <form class="pull-left">
                            <input type="checkbox" checked name="product4" />
                        </form>
                        <img src="<@ofbizContentUrl>/shopmax-default/img/product-generic.png</@ofbizContentUrl>" width="60" height="60" alt="" class="pull-left" />
                        <h5>Product Name<span class="raty" data-rating="3"></span></h5>
                        <p class="price">$135.00</p>
                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Cras non mauris. Praesent</p>
                    </li>
                </ul>
                <!-- half price list -->
                <ul class="product-list half-price span-half">
                    <li><h4>Get this half price!</h4></li>
                    <li>
                        <form class="pull-left">
                            <input type="checkbox" checked name="product5" />
                        </form>
                        <img src="<@ofbizContentUrl>/shopmax-default/img/product-generic.png</@ofbizContentUrl>" width="60" height="60" alt="" class="pull-left" />
                        <h5>Product Name<span class="raty" data-rating="4"></span></h5>
                        <p class="price">$135.00</p>
                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Cras non mauris. Praesent</p>
                    </li>
                    <li>
                        <form class="pull-left">
                            <input type="checkbox" checked name="product6" />
                        </form>
                        <img src="<@ofbizContentUrl>/shopmax-default/img/product-generic.png</@ofbizContentUrl>" width="60" height="60" alt="" class="pull-left" />
                        <h5>Product Name<span class="raty" data-rating="1"></span></h5>
                        <p class="price">$135.00</p>
                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Cras non mauris. Praesent</p>
                    </li>
                    <li>
                        <form class="pull-left">
                            <input type="checkbox" checked name="product7" />
                        </form>
                        <img src="<@ofbizContentUrl>/shopmax-default/img/product-generic.png</@ofbizContentUrl>" width="60" height="60" alt="" class="pull-left" />
                        <h5>Product Name<span class="raty" data-rating="5"></span></h5>
                        <p class="price">$135.00</p>
                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Cras non mauris. Praesent</p>
                    </li>
                    <li>
                        <form class="pull-left">
                            <input type="checkbox" checked name="product8" />
                        </form>
                        <img src="<@ofbizContentUrl>/shopmax-default/img/product-generic.png</@ofbizContentUrl>" width="60" height="60" alt="" class="pull-left" />
                        <h5>Product Name<span class="raty" data-rating="3"></span></h5>
                        <p class="price">$135.00</p>
                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Cras non mauris. Praesent</p>
                    </li>
                </ul><!-- /.half-price-list -->
                <ul>
                    <li class="pull-right"><button type="submit" class="btn-large blue">Add Bundle to Cart</button></li>
                </ul>
            </div><!-- /.list-wrapper -->
            
            <!-- next deal starts -->
            <h3 class="next-deal countdown-container">Next deal open in <span class="countdown" id="countdown-next-deal"></span></h3>
            <h4 class="next-deal countdown-container buy-one">Buy one get one half price</h4>
                <div class="list-wrapper">
                <ul>
                    <li><p class="share pull-right">Share with  <a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/email.png</@ofbizContentUrl>" width="23" height="23" alt="" /></a><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/fb.png</@ofbizContentUrl>" width="23" height="23" alt="" /></a><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/tw.png</@ofbizContentUrl>" width="23" height="23" alt="" /></a><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/gplus.png</@ofbizContentUrl>" width="23" height="23" alt="" /></a></p></li>
                </ul>
                <!-- buy one list -->
                <ul class="product-list buy-this span-half next-deal">
                    <li><h4>Buy This</h4></li>
                    <li>
                        <form class="pull-left">
                            <input type="checkbox" checked name="product1" />
                        </form>
                        <img src="<@ofbizContentUrl>/shopmax-default/img/product-generic.png</@ofbizContentUrl>" width="60" height="60" alt="" class="pull-left" />
                        <h5>Product Name<span class="raty" data-rating="3"></span></h5>
                        <p class="price">$135.00</p>
                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Cras non mauris. Praesent</p>
                    </li>
                    <li>
                        <form class="pull-left">
                            <input type="checkbox" checked name="product2" />
                        </form>
                        <img src="<@ofbizContentUrl>/shopmax-default/img/product-generic.png</@ofbizContentUrl>" width="60" height="60" alt="" class="pull-left" />
                        <h5>Product Name<span class="raty" data-rating="1"></span></h5>
                        <p class="price">$135.00</p>
                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Cras non mauris. Praesent</p>
                    </li>
                    <li>
                        <form class="pull-left">
                            <input type="checkbox" checked name="product3" />
                        </form>
                        <img src="<@ofbizContentUrl>/shopmax-default/img/product-generic.png</@ofbizContentUrl>" width="60" height="60" alt="" class="pull-left" />
                        <h5>Product Name<span class="raty" data-rating="2"></span></h5>
                        <p class="price">$135.00</p>
                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Cras non mauris. Praesent</p>
                    </li>
                    <li>
                        <form class="pull-left">
                            <input type="checkbox" checked name="product4" />
                        </form>
                        <img src="<@ofbizContentUrl>/shopmax-default/img/product-generic.png</@ofbizContentUrl>" width="60" height="60" alt="" class="pull-left" />
                        <h5>Product Name<span class="raty" data-rating="3"></span></h5>
                        <p class="price">$135.00</p>
                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Cras non mauris. Praesent</p>
                    </li>
                </ul>
                <!-- half price list -->
                <ul class="product-list half-price span-half next-deal">
                    <li><h4>Get this half price!</h4></li>
                    <li>
                        <form class="pull-left">
                            <input type="checkbox" checked name="product5" />
                        </form>
                        <img src="<@ofbizContentUrl>/shopmax-default/img/product-generic.png</@ofbizContentUrl>" width="60" height="60" alt="" class="pull-left" />
                        <h5>Product Name<span class="raty" data-rating="4"></span></h5>
                        <p class="price">$135.00</p>
                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Cras non mauris. Praesent</p>
                    </li>
                    <li>
                        <form class="pull-left">
                            <input type="checkbox" checked name="product6" />
                        </form>
                        <img src="<@ofbizContentUrl>/shopmax-default/img/product-generic.png</@ofbizContentUrl>" width="60" height="60" alt="" class="pull-left" />
                        <h5>Product Name<span class="raty" data-rating="1"></span></h5>
                        <p class="price">$135.00</p>
                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Cras non mauris. Praesent</p>
                    </li>
                    <li>
                        <form class="pull-left">
                            <input type="checkbox" checked name="product7" />
                        </form>
                        <img src="<@ofbizContentUrl>/shopmax-default/img/product-generic.png</@ofbizContentUrl>" width="60" height="60" alt="" class="pull-left" />
                        <h5>Product Name<span class="raty" data-rating="5"></span></h5>
                        <p class="price">$135.00</p>
                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Cras non mauris. Praesent</p>
                    </li>
                    <li>
                        <form class="pull-left">
                            <input type="checkbox" checked name="product8" />
                        </form>
                        <img src="<@ofbizContentUrl>/shopmax-default/img/product-generic.png</@ofbizContentUrl>" width="60" height="60" alt="" class="pull-left" />
                        <h5>Product Name<span class="raty" data-rating="3"></span></h5>
                        <p class="price">$135.00</p>
                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Cras non mauris. Praesent</p>
                    </li>
                </ul><!-- /.half-price-list -->
                <ul>
                    <li class="pull-right next-deal"><button type="submit" class="btn-large blue" disabled="">Add Bundle to Cart</button></li>
                </ul>
            </div><!-- /.list-wrapper -->
        </div><!-- /.span12 -->
    </div><!-- /.row -->
</div> <!-- /container -->
