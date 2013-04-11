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

<div class="container content">
    <#include "component://shopmax/webapp/shopmax/includes/breadcrum.ftl" />
    <div class="row content-left">
        <!-- MAIN CONTENT -->
        <!-- sliderdiv -->
        <div class="span12 main-content">
            <h2>Group Bang</h2>
            <h3 class="time-left countdown-container">Hurry! Time Left to Buy
            <span class="countdown" id="countdown-time-left"><!-- see /js/main.js for counter --></span></h3>
            <!--
            <span class="countdown hasCountdown" id="time-left"><span class="timer-inner"><span id="hrs"><span class="time-unit">HOURS</span><code><span>8</span><span>8</span><img src="<@ofbizContentUrl>/shopmax-default/img/1px-line.png</@ofbizContentUrl>" width="54" height="33" alt="" /></code></span><span class="sep">:</span><span id="mins"><span class="time-unit">MIN</span><code><span>3</span><span>4</span><img src="<@ofbizContentUrl>/shopmax-default/img/1px-line.png</@ofbizContentUrl>" width="54" height="33" alt="" /></code></span><span class="sep">:</span><span id="secs"><span class="time-unit">SEC</span><code><span>1</span><span>8</span><img src="<@ofbizContentUrl>/shopmax-default/img/1px-line.png</@ofbizContentUrl>" width="54" height="33" alt="" /></code></span></span></span></h3>
            -->
            <!-- hurry product list starts here -->
            
            <ul class="product-list hurry">
                <li>
                    <div class="span6 details">
                        <img src="<@ofbizContentUrl>/shopmax-default/img/product-generic.png</@ofbizContentUrl>" width="230" height="180" alt="" class="pull-left" />
                        <h3>Product Name</h3>
                        <div class="raty" data-rating="3"></div>
                        <p class="share">Share with  <a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/email.png</@ofbizContentUrl>" width="23" height="23" alt="" /></a><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/fb.png</@ofbizContentUrl>" width="23" height="23" alt="" /></a><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/tw.png</@ofbizContentUrl>" width="23" height="23" alt="" /></a><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/gplus.png</@ofbizContentUrl>" width="23" height="23" alt="" /></a></p>
                        <p class="desc">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Cras non mauris. Praesent quam lorem, scelerisque et, mattis cursus, porttitor sit amet, libero. Praesent pulvinar. Duis vitae nunc ut sapien mollis scelerisque.</p>                         
                    </div>
                    <div class="span6 action">
                        <div class="slider"><img src="<@ofbizContentUrl>/shopmax-default/img/slider-static.png</@ofbizContentUrl>" width="454" height="184" alt="" /></div>
                        <p class="buttons"><button type="submit" class="btn-large green">Buy Now</button><button type="submit" class="btn-large blue">Add to Cart</button></p>
                    </div>
                </li>
                <li>
                    <div class="span6 details">
                        <img src="<@ofbizContentUrl>/shopmax-default/img/product-generic.png</@ofbizContentUrl>" width="230" height="180" alt="" class="pull-left" />
                        <h3>Product Name 2</h3>
                        <div class="raty" data-rating="1"></div>
                        <p class="share">Share with  <a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/email.png</@ofbizContentUrl>" width="23" height="23" alt="" /></a><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/fb.png</@ofbizContentUrl>" width="23" height="23" alt="" /></a><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/tw.png</@ofbizContentUrl>" width="23" height="23" alt="" /></a><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/gplus.png</@ofbizContentUrl>" width="23" height="23" alt="" /></a></p>
                        <p class="desc">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Cras non mauris. Praesent quam lorem, scelerisque et, mattis cursus, porttitor sit amet, libero. Praesent pulvinar. Duis vitae nunc ut sapien mollis scelerisque.</p>                         
                    </div>
                    <div class="span6 action">
                        <div class="slider"><img src="<@ofbizContentUrl>/shopmax-default/img/slider-static.png</@ofbizContentUrl>" width="454" height="184" alt="" /></div>
                        <p class="buttons"><button type="submit" class="btn-large green">Buy Now</button><button type="submit" class="btn-large blue">Add to Cart</button></p>
                    </div>
                </li>
            </ul>
            
            <h3 class="next-deal countdown-container">Next deal open in <span class="countdown" id="countdown-next-deal"></span></h3>
            <ul class="product-list next-deal">
                <li>
                    <div class="span6 details">
                        <img src="<@ofbizContentUrl>/shopmax-default/img/product-generic.png</@ofbizContentUrl>" width="230" height="180" alt="" class="pull-left" />
                        <h3>Product Name 3</h3>
                        <div class="raty" data-rating="1"></div>
                        <p class="share">Share with  <a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/email.png</@ofbizContentUrl>" width="23" height="23" alt="" /></a><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/fb.png</@ofbizContentUrl>" width="23" height="23" alt="" /></a><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/tw.png</@ofbizContentUrl>" width="23" height="23" alt="" /></a><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/gplus.png</@ofbizContentUrl>" width="23" height="23" alt="" /></a></p>
                        <p class="desc">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Cras non mauris. Praesent quam lorem, scelerisque et, mattis cursus, porttitor sit amet, libero. Praesent pulvinar. Duis vitae nunc ut sapien mollis scelerisque.</p>                         
                    </div>
                    <div class="span6 action">
                        <div class="slider"><img src="<@ofbizContentUrl>/shopmax-default/img/slider-static.png</@ofbizContentUrl>" width="454" height="184" alt="" /></div>
                        <p class="buttons"><button type="submit" class="btn-large green">Buy Now</button><button type="submit" class="btn-large blue">Add to Cart</button></p>
                    </div>
                </li>
                <li>
                    <div class="span6 details">
                        <img src="<@ofbizContentUrl>/shopmax-default/img/product-generic.png</@ofbizContentUrl>" width="230" height="180" alt="" class="pull-left" />
                        <h3>Product Name 4</h3>
                        <div class="raty" data-rating="5"></div>
                        <p class="share">Share with  <a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/email.png</@ofbizContentUrl>" width="23" height="23" alt="" /></a><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/fb.png</@ofbizContentUrl>" width="23" height="23" alt="" /></a><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/tw.png</@ofbizContentUrl>" width="23" height="23" alt="" /></a><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/gplus.png</@ofbizContentUrl>" width="23" height="23" alt="" /></a></p>
                        <p class="desc">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Cras non mauris. Praesent quam lorem, scelerisque et, mattis cursus, porttitor sit amet, libero. Praesent pulvinar. Duis vitae nunc ut sapien mollis scelerisque.</p>                         
                    </div>
                    <div class="span6 action">
                        <div class="slider"><img src="<@ofbizContentUrl>/shopmax-default/img/slider-static.png</@ofbizContentUrl>" width="454" height="184" alt="" /></div>
                        <p class="buttons"><button type="submit" class="btn-large green">Buy Now</button><button type="submit" class="btn-large blue">Add to Cart</button></p>
                    </div>
                </li>
            </ul>
        </div><!-- /.span12 -->
    </div><!-- /.row -->
</div> <!-- /container -->
