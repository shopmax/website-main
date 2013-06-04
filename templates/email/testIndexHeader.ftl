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

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>ShopMax</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width">
        <!-- what happens with this with mobile phones? 
        <meta name="viewport" content="width=device-width, initial-scale=1" />-->
        <#-- ***<link rel="shortcut icon" href="<@ofbizContentUrl>/shopmax-default/img/favicon.ico" type="text/css</@ofbizContentUrl>"/>-->
        <script type="text/javascript" src="<@ofbizContentUrl>/shopmax-default/js/vendor/jquery-1.8.3.min.js</@ofbizContentUrl>"></script>
        <link rel="stylesheet" href="<@ofbizContentUrl>/shopmax-default/css/bootstrap-responsive.css" type="text/css</@ofbizContentUrl>"/>
        <link rel="stylesheet" href="<@ofbizContentUrl>/shopmax-default/css/bootstrap.css" type="text/css</@ofbizContentUrl>"/>
        <#-- ***<link rel="stylesheet" href="<@ofbizContentUrl>/shopmax-default/css/bootstrap-responsive.css" type="text/css</@ofbizContentUrl>"/>-->
        <#-- ***<link rel="stylesheet" href="<@ofbizContentUrl>/shopmax-default/js/vendor/chosen.css" type="text/css</@ofbizContentUrl>"/>-->
        <link rel="stylesheet" href="<@ofbizContentUrl>/shopmax-default/css/main.css" type="text/css</@ofbizContentUrl>"/>
        <#-- ***<script type="text/javascript" src="<@ofbizContentUrl>/shopmax-default/js/vendor/modernizr-2.6.2-respond-1.1.0.min.js</@ofbizContentUrl>"></script>-->
        <#--<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.8.3.min.js"><\/script>')</script>
        -->
        <#-- ***<script type="text/javascript" src="<@ofbizContentUrl>/shopmax-default/js/vendor/jquery-1.8.3.min.js</@ofbizContentUrl>"></script>-->
        <script type="text/javascript" src="<@ofbizContentUrl>/shopmax-default/js/vendor/bootstrap.min.js</@ofbizContentUrl>"></script>
        <#-- ***<script type="text/javascript" src="<@ofbizContentUrl>/shopmax-default/js/vendor/chosen.jquery.min.js</@ofbizContentUrl>"></script>-->
        <link rel="stylesheet" href="<@ofbizContentUrl>/shopmax-default/css/anythingslider.css</@ofbizContentUrl>" type="text/css"/>
        <script type="text/javascript" src="<@ofbizContentUrl>/shopmax-default/js/vendor/jquery.anythingslider.min.js</@ofbizContentUrl>"></script>
        <#-- ***<link rel="stylesheet" href="<@ofbizContentUrl>/shopmax-default/js/fancybox/source/jquery.fancybox.css</@ofbizContentUrl>" type="text/css"/>-->
        <#-- ***<script type="text/javascript" src="<@ofbizContentUrl>/shopmax-default/js/fancybox/source/jquery.fancybox.pack.js</@ofbizContentUrl>"></script>-->
        <#--<script src="js/main.js"></script>-->
        <script>
            (function($) {
                    $(document).ready(function() {
                    var imageUrlPath = "<@ofbizContentUrl></@ofbizContentUrl>";
                    $.fn.exists = function(){return this.length>0;}
            
                    $('#slider').anythingSlider({
                    autoPlay: true,                 // This turns off the entire FUNCTIONALY, not just if it starts running or not
                    startStopped: false,            // If autoPlay is on, this can force it to start stopped
                    buildNavigation:false,      // If true, builds a list of anchor links to link to each panel 
                    buildStartStop:false, 
                    delay: 3000,                    // How long between slide transitions in AutoPlay mode
                    animationTime: 700,             // How long the slide transition takes
                    hashTags: false,                 // Should links change the hashtag in the URL?
                    pauseOnHover:true             // If true, and autoPlay is enabled, the show will pause on hover
                    });
            
                    /* *****************************************Modernizr.addTest('mediaqueries', Modernizr.mq('all')); */
                    
                    /* *****************************************$('.fancylink').fancybox({width:'50%', height:'50%'});*/
            /* *************************************************
                    //$('.chosen').chosen();
                    //$("#accountOptions").data("placeholder","Select Frameworks...").chosen();
                    $('.chosen').chosen();
            
                    $('.actionable').change(function() {
                        location.href=$(this).val();
                    });
            
                    function reveal(){ // reveals the hidden ul, used by the countdown script below
                        $('#countdown-next-deal').parent('h3').siblings().find('li,.next-deal').css({'opacity':1,'background':'white'});
                        $('.next-deal').css({'opacity':1});
                        // enable buttons
                        $('#countdown-next-deal').parent('h3').siblings().find('button').removeAttr('disabled');
                    }
            
                    // For IE8 and earlier version.
                    if (!Date.now) {
                        Date.now = function() {
                        return new Date().valueOf();
                        }
                    }
            */
                    // the date below will obviously need to be taken from the server - see comment below for code ref
                    if ($('.countdown').exists()){
                        var deflabels = ['Years', 'Months', 'Weeks', 'Days', 'HOURS', 'MIN', 'SEC'];
                        var deflayout = '<span class="timer-inner">'+
                            '<span class="block"><span class="time-unit">{hl}</span><code><span>{h10}</span><span>{h1}</span><img src="<@ofbizContentUrl>/shopmax-default/img/1px-line.png</@ofbizContentUrl>" width="54" height="33" alt="" /></code></span>'+
                            '<span class="sep">{sep}</span>'+
                            '<span class="block"><span class="time-unit">{ml}</span><code><span>{m10}</span><span>{m1}</span><img src="<@ofbizContentUrl>/shopmax-default/img/1px-line.png</@ofbizContentUrl>" width="54" height="33" alt="" /></code></span>'+
                            '<span class="sep">{sep}</span>'+
                            '<span class="block"><span class="time-unit">{sl}</span><code><span>{s10}</span><span>{s1}</span><img src="<@ofbizContentUrl>/shopmax-default/img/1px-line.png</@ofbizContentUrl>" width="54" height="33" alt="" /></code></span>'+
                            '</span>'; 
                        var defformat = 'H:M:S';
                        var start = Date.now();
                        var twentySecs = 20000;// milliseconds
                        var twoHours = 7200000;
                        $('#countdown-time-left').countdown({until: new Date(2013, 1/*zero-based*/, 1), timeSeparator:':',format: defformat, compact: false, layout: deflayout, labels:deflabels});
                        $('#countdown-next-deal').countdown({onExpiry:reveal, until: new Date(start+twentySecs), timeSeparator:':',format: defformat, compact: false, layout: deflayout, labels:deflabels});
                    }
                    // example of server time retrieval from here http://keith-wood.name/countdownRef.html#serverSync
            
                
                    /* star rating */
                    if ($('.raty').exists()){
                        $('.raty').raty({
                            score: function() {
                            return $(this).attr('data-rating');
                        }
                        });
                    }
                    
                    $('.tool-tip').tooltip();
            
                    /*
                    var breedte = document.body.clientWidth;
                    console.log(breedte);
                    */
                    
            
                    /* tabs - 
                            hide all but the first .tabcontent, change the style of its tab
                            on click hide all tabs except the one with the id [link]-tab
                            
                    */
                    $(document).ready(function() {
                        if(!$('body').hasClass('help')){
                            $('.tabcontent').not('.tabcontent:eq(0)').hide();
                            $('.tabnavs li:first-child').addClass('active');
                            $('.tabnavs li').css('cursor','pointer');
                            $('.tabnavs li').click(function () {
                                var target = $(this).text().replace(/ /g,"-").toLowerCase();
                                //console.log(target);
                                $(this).parents('ul.tabnavs').find('li').removeClass('active');
                                $(this).addClass('active');
                                $('.tabcontent').hide();
                                $('#'+target+'-tab').show();
                            });
                        }
                    });
                });
            })(jQuery);
        </script>
    </head>
    <body class="home">
        <!-- This code is taken from http://twitter.github.com/bootstrap/examples/hero.html -->
        <header id="topnav" class="navbar navbar-inverse navbar-fixed-top clearfix">
            <div class="navbar-inner">
                <div class="container">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </a>
                    <h1 title="Shopmax"><a class="brand" href="/"><img src="<@ofbizContentUrl>/shopmax-default/img/logo-2.png</@ofbizContentUrl>" width="159" height="55" alt="Shopmax logo" /></a></h1>
                    <!-- was <img src="img/logo.png" width="186" height="65" alt="" /> padding:top 10px right 27 -->
                    <!--<div class="nav-collapse collapse"> to make it collapse -->
                    <div class="header-search">
                        <ul class="nav">
                            <li><a href="upload.html">Upload Product</a></li>
                            <li><a href="manage-product.html">Manage Product</a></li>
                            <li><a href="manage-orders.html">Manage Orders</a></li>
                            <li><a href="shopping-list.html">Shopping List</a></li>
                            <li class="last"><a href="buying-orders.html">Buying Orders</a></li>
                        </ul>
                        <form class="navbar-form pull-left">
                            <div class="field search-filters">
                                <div class="main-search-control">
                                    <div class="main-search-dropdown bold">
                                        <select id="SearchType" name="searchType" class="drop-select chosen combo" data-search-bar="true">
                                                <option value="shop1" selected="selected">This Shop</option>
                                                <option value="shop2">Shop 2</option>
                                                <option value="shop3">Shop 3</option>
                                                <option value="shop4">Shop 4</option>
                                        </select>
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
        <nav id="mainnav" class="navbar navbar-static-top"><!-- blue navbar -->         
            <div class="navbar-inner">
                <div class="container">
                        <ul class="nav">
                            <li class="on"><a href="/">Home</a></li>
                            <li><a href="shops.html">Shops</a></li>
                            <li><a href="group-bang.html">Group Bang</a></li>
                            <li><a href="rush-hour.html">Rush Hour</a></li>
                            <li><a href="multi-buy.html">Multi Buy</a></li>
                            <li><a href="about-us.html">About Us</a></li>
                            <li><a href="help.html">Help</a></li>
                        </ul>
                </div>
            </div>  
        </nav>
        <div class="container content">
            <div class="row">
                <a class="skip-link small" href="#side-menu">Skip to sidebar menu</a>
            </div>
            <div class="row">
            <!-- MAIN CONTENT -->
                <!-- sliderdiv -->
                <div class="span9 main-content">
                    <div class="anythingSlider">
                        <div class="wrapper">
                        <ul id="slider">
                            <li><img src="<@ofbizContentUrl>/shopmax-default/img/slider-frame-1.png</@ofbizContentUrl>" width="652" height="305" alt="" /></li>
                            <li><img src="<@ofbizContentUrl>/shopmax-default/img/slide-civil-1.jpg</@ofbizContentUrl>" width="680" height="317" alt="" /></li>
                            <li><h3>html test</h3>
                            <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
                            <p><a class="btn" href="#">View details &raquo;</a></p></li>
                            <li><img src="<@ofbizContentUrl>/shopmax-default/img/slider-image-4.jpg</@ofbizContentUrl>" width="652" height="305" alt="" />
                            <p class="overlay"><a href="#" class="btn-general">Shop Now</a></p></li>
                        </ul>
                        </div>
                    </div>
                    <div id="events">
                        <h3>Events</h3>
                        <ul><li><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/events-sale.png</@ofbizContentUrl>" width="244" height="213" alt="" /></a></li>
                            <li><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/events-free-shipping.png</@ofbizContentUrl>" width="244" height="214" alt="" /></a></li>
                            <li><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/events-friends.png</@ofbizContentUrl>" width="244" height="214" alt="" /></a></li>
                        </ul>
                    </div>
                    <div id="featured-shops" class="featured green">
                        <h3>Featured Shops</h3>
                        <ul>
                        <li><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/shops-1.png</@ofbizContentUrl>" width="139" height="139" alt="" /></a>
                        <h4>Shop 1</h4>
                        <p>Description</p>
                        <p><a href="#" class="btn-general">Shop Now</a></li>

                        <li><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/shops-2.png</@ofbizContentUrl>" width="139" height="139" alt="" /></a>
                        <h4>Shop 2</h4>
                        <p>Description</p>
                        <p><a href="#" class="btn-general">SHOP NOW</a></li>

                        <li><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/shops-3.png</@ofbizContentUrl>" width="139" height="139" alt="" /></a>
                        <h4>Shop 3</h4>
                        <p>Description</p>
                        <p><a href="#" class="btn-general">SHOP NOW</a></li>

                        <li><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/shops-4.png</@ofbizContentUrl>" width="139" height="139" alt="" /></a>
                        <h4>Shop 4</h4>
                        <p>Description</p>
                        <p><a href="#" class="btn-general">SHOP NOW</a></li>
                        </ul>
                    </div>
                    <div id="featured-products" class="featured blue">
                        <h3>Featured Products</h3>
                        <ul>
                        <li><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/product-1.png</@ofbizContentUrl>" width="136" height="139" alt="" /></a>
                        <h4>Product 1</h4>
                        <p class="price">$129.85</p>
                        <p class="pull-right"><a href="#" class="btn-general">Add To Cart</a></p>
                        <p class="pull-right addshop"><a href="#">Add to Shopping List</a></p></li>
                        
                        <li class="sale"><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/product-2.png</@ofbizContentUrl>" width="136" height="139" alt="" /></a>
                        <h4>Product 2</h4>
                        <p class="price">$129.85</p>
                        <p class="pull-right"><a href="#" class="btn-general">Add To Cart</a></p>
                        <p class="pull-right addshop"><a href="#">Add to Shopping List</a></p></li>

                        <li class="sale"><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/product-3.png</@ofbizContentUrl>" width="136" height="139" alt="" /></a>
                        <h4>Product 3</h4>
                        <p class="price">$129.85</p>
                        <p class="pull-right"><a href="#" class="btn-general">Add To Cart</a></p>
                        <p class="pull-right addshop"><a href="#">Add to Shopping List</a></p></li>
                        
                        <li><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/shops-4.png</@ofbizContentUrl>" width="139" height="139" alt="" /></a>
                        <h4>Product 4</h4>
                        <p class="price">$129.85</p>
                        <p class="pull-right"><a href="#" class="btn-general">Add To Cart</a></p>
                        <p class="pull-right addshop"><a href="#">Add to Shopping List</a></p></li>
                        </ul>
                    </div>
                    <div id="recently-added" class="featured">
                        <h3>Recently Added</h3>
                        <ul>
                            <li><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/rec-added-1.png</@ofbizContentUrl>" width="91" height="91" alt="" /></a></li>
                            <li><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/rec-added-2.png</@ofbizContentUrl>" width="91" height="91" alt="" /></a></li>
                            <li><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/rec-added-4.png</@ofbizContentUrl>" width="91" height="91" alt="" /></a></li>
                            <li><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/rec-added-3.png</@ofbizContentUrl>" width="91" height="91" alt="" /></a></li>
                            <li><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/rec-added-2.png</@ofbizContentUrl>" width="91" height="91" alt="" /></a></li>
                            <li><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/rec-added-1.png</@ofbizContentUrl>" width="91" height="91" alt="" /></a></li>
                            <li><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/rec-added-3.png</@ofbizContentUrl>" width="91" height="91" alt="" /></a></li>
                            <li><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/rec-added-4.png</@ofbizContentUrl>" width="91" height="91" alt="" /></a></li>
                        </ul>
                    </div><!-- /# recently-added -->
                </div><!-- /.span9 -->
                <div class="span3 sidebar" id="side-menu">
                    <div class="categories innerbox georgia">
                        <h2>Categories</h2>
                        <div class="tabbed">
                            <div class="tabs">
                                <ul class="tabnavs">
                                    <li><h3>Product</h3></li>
                                    <li><h3>Services</h3></li>
                                </ul>
                            </div><!-- /.tabs-->
                            <div id="product-tab" class="tabcontent">
                                <ul>
                                <li><a href="/">Electronics &amp; Office</a></li>
                                            <li><a href="#">Movies, Music &amp; Books</a></li>
                                            <li><a href="#">Home, Furniture &amp; Patio</a></li>
                                            <li><a href="#">Apparel, Shoes &amp; Jewellery</a></li>
                                            <li><a href="#">Baby &amp; Kids</a></li>
                                            <li><a href="#">Toys &amp; Video Games</a></li>
                                            <li><a href="#">Sports, Fitness &amp; Outdoors</a></li>
                                </ul>
                            </div><!-- /#product-tab -->
                            <div id="services-tab" class="tabcontent">
                                <ul>
                                <li><a href="#">Services List</a></li>
                                <li><a href="/">Home</a></li>
                                            <li><a href="shops.html">Shops</a></li>
                                            <li><a href="group-bang.html">Group Bang</a></li>
                                            <li><a href="rush-hour.html">Rush Hour</a></li>
                                            <li><a href="multi-buy.html">Multi Buy</a></li>
                                            <li><a href="about-us.html">About Us</a></li>
                                            <li><a href="help.html">Help</a></li>
                                </ul>
                            </div><!-- /#services-tab -->
                        </div><!-- /.tabbed -->
                    </div><!-- /.categories .innerbox -->
                    <div class="promotions innerbox">
                        <h2>Promotions</h2>
                        <h3>Group Bang</h3>
                        <ul class="product-list">
                            <li>
                                <img class="pull-left" src="<@ofbizContentUrl>/shopmax-default/img/sample-img-1.png</@ofbizContentUrl>" width="67" height="67" alt="" />
                                <h5>Product Name</h5>
                                <p>Product description</p>
                                <p class="price">$129.95</p>
                            </li>
                            <li>
                                <img class="pull-left" src="<@ofbizContentUrl>/shopmax-default/img/sample-img-2.png</@ofbizContentUrl>" width="67" height="67" alt="" />
                                <h5>Product Name</h5>
                                <p>Product description</p>
                                <p class="price">$129.95</p>
                            </li>
                            <li>
                                <img class="pull-left" src="<@ofbizContentUrl>/shopmax-default/img/sample-img-3.png</@ofbizContentUrl>" width="67" height="67" alt="" />
                                <h5>Product Name</h5>
                                <p>Product description</p>
                                <p class="price">$129.95</p>
                            </li>
                            <li>
                                <img class="pull-left" src="<@ofbizContentUrl>/shopmax-default/img/sample-img-1.png</@ofbizContentUrl>" width="67" height="67" alt="" />
                                <h5>Product Name</h5>
                                <p>Product description</p>
                                <p class="price">$129.95</p>
                            </li>
                        </ul>
                        <hr />
                        <h3>Rush Hour</h3>
                        <ul class="product-list">
                            <li>
                                <img class="pull-left" src="<@ofbizContentUrl>/shopmax-default/img/sample-img-1.png</@ofbizContentUrl>" width="67" height="67" alt="" />
                                <h5>Product Name</h5>
                                <p>Product description</p>
                                <p class="price">$129.95</p>
                            </li>
                            <li>
                                <img class="pull-left" src="<@ofbizContentUrl>/shopmax-default/img/sample-img-2.png</@ofbizContentUrl>" width="67" height="67" alt="" />
                                <h5>Product Name</h5>
                                <p>Product description</p>
                                <p class="price">$129.95</p>
                            </li>
                            <li>
                                <img class="pull-left" src="<@ofbizContentUrl>/shopmax-default/img/sample-img-3.png</@ofbizContentUrl>" width="67" height="67" alt="" />
                                <h5>Product Name</h5>
                                <p>Product description</p>
                                <p class="price">$129.95</p>
                            </li>
                            <li>
                                <img class="pull-left" src="<@ofbizContentUrl>/shopmax-default/img/sample-img-1.png</@ofbizContentUrl>" width="67" height="67" alt="" />
                                <h5>Product Name</h5>
                                <p>Product description</p>
                                <p class="price">$129.95</p>
                            </li>
                        </ul>
                        <hr />
                        <h3>Multi Buy</h3>
                        <ul class="product-list">
                            <li>
                                <img class="pull-left" src="<@ofbizContentUrl>/shopmax-default/img/sample-img-1.png</@ofbizContentUrl>" width="67" height="67" alt="" />
                                <h5>Product Name</h5>
                                <p>Product description</p>
                                <p class="price">$129.95</p>
                            </li>
                            <li>
                                <img class="pull-left" src="<@ofbizContentUrl>/shopmax-default/img/sample-img-2.png</@ofbizContentUrl>" width="67" height="67" alt="" />
                                <h5>Product Name</h5>
                                <p>Product description</p>
                                <p class="price">$129.95</p>
                            </li>
                            <li>
                                <img class="pull-left" src="<@ofbizContentUrl>/shopmax-default/img/sample-img-3.png</@ofbizContentUrl>" width="67" height="67" alt="" />
                                <h5>Product Name</h5>
                                <p>Product description</p>
                                <p class="price">$129.95</p>
                            </li>
                            <li>
                                <img class="pull-left" src="<@ofbizContentUrl>/shopmax-default/img/sample-img-1.png</@ofbizContentUrl>" width="67" height="67" alt="" />
                                <h5>Product Name</h5>
                                <p>Product description</p>
                                <p class="price">$129.95</p>
                            </li>
                        </ul>
                    </div><!-- /.promotions -->
                    <div id="latest-shops" class="promotions innerbox img-list">
                        <h2>Latest Shops</h2>
                        <ul>
                            <li><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/latest-shops-1.png</@ofbizContentUrl>" width="86" height="86" alt="" /></a></li>
                            <li><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/latest-shops-2.png</@ofbizContentUrl>" width="86" height="86" alt="" /></a></li>
                            <li><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/latest-shops-2.png</@ofbizContentUrl>" width="86" height="86" alt="" /></a></li>
                            <li><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/latest-shops-1.png</@ofbizContentUrl>" width="86" height="86" alt="" /></a></li>                     
                        </ul>
                    </div><!-- /.promotions -->
                </div><!-- /.span3.sidebar -->
                </div><!-- /.row -->                
            </div> <!-- /container -->
            <footer>
                <div id="top-foot" class="georgia">
                    <div class="container">
                        <div class="row">
                            <div class="span2">
                                <h3>Quick Links</h3>
                                <ul>
                                <li><a href="todays-deal.html">Today's Deal</a></li>
                                <li><a href="featured.html">Featured</a></li>
                                <li><a href="special.html">Special</a></li>
                                <li><a href="top-seller.html">Top Seller</a></li>
                                <li><a href="shops.html">Shops</a></li>
                                <li><a href="shipping.html">Shipping &amp; Returns</a></li>
                                </ul>
                            </div>
                            <div class="span2">
                                <h3>Top Categories</h3>
                                <ul>
                                <li><a href="#">Maecenas faucibus</a></li>
                                <li><a href="#">Interdum enean eu</a></li>
                                <li><a href="#">Quam ellentesque</a></li>
                                <li><a href="#">Sem lacinia quam</a></li>
                                <li><a href="#">Venenatis vestibum</a></li>
                                <li><a href="#">Prasent commodo</a></li>
                                </ul>
                                
                            </div>
                            <div class="span2 noheading">
                                <ul>
                                <li><a href="#">Maecenas faucibus</a></li>
                                <li><a href="#">Interdum enean eu</a></li>
                                <li><a href="#">Quam ellentesque</a></li>
                                <li><a href="#">Sem lacinia quam</a></li>
                                <li><a href="#">Venenatis vestibum</a></li>
                                <li><a href="#">Prasent commodo</a></li>
                                </ul>                       
                            </div>
                            <div class="span3">
                                <h3>Looking For Something?</h3>
                                <form class="pull-left">
                                    <input type="text" placeholder="Search through our site" class="pull-left">
                                    <button type="submit" class="btn-search-large pull-left"></button>
                                </form>

                                <h3>Contact us for a Quotation</h3>
                                <p><strong>0800 123 456</strong> <em>or</em> <strong><a href="mailto:abc@xyz.com">Email Us</a></strong><br />
                                <dfn>7 days 9am to 5pm NZDT</dfn></p>
                                

                            </div>
                            <div class="span3">
                                <h3>Sign Up Our Newsletter</h3>
                                <form class="pull-left">
                                    <input type="text" placeholder="Your email address" class="pull-left">
                                    <button type="submit" class="btn-email pull-left"></button>
                                </form>
                                <h3>Connect with us</h3>
                                <ul id="connect">
                                    <li class="pull-left"><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/icon-twitter.png</@ofbizContentUrl>" width="33" height="33" alt="" /></a></li>
                                    <li class="pull-left"><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/icon-fb.png</@ofbizContentUrl>" width="34" height="33" alt="" /></a></li>
                                    <li class="pull-left"><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/icon-gplus.png</@ofbizContentUrl>" width="33" height="33" alt="" /></a></li>
                                    <li class="pull-left"><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/icon-rss.png</@ofbizContentUrl>" width="33" height="33" alt="" /></a></li>
                                </ul>

                            </div>
                        </div><!-- /. row -->
                    </div><!-- /.container -->
                </div><!-- /# top-foot -->
                <div id="blue-foot">
                    <div class="container">
                        <div class="row">
                            <div class="span10">
                                <ul><li>&copy; Copyright 2012 shopmax</li>
                                    <li><a href="contact.html">Contact Us</a></li>
                                    <li><a href="about.html">About Us</a></li>
                                    <li><a href="support.html">Support</a></li>
                                    <li><a href="privacy.html">Privacy Notice</a></li>
                                    <li><a href="conditions.html">Conditions of Use</a></li>
                                </ul>
                            </div>
                            <div id="logo" class="span2">
                                <p><a href="#topnav" title="Jump to page top"><img src="<@ofbizContentUrl>/shopmax-default/img/shopmax-bottom-logo.png</@ofbizContentUrl>" width="106" height="30" alt="" /><!--<img src="img/logo-bottom.png" width="107" height="58" alt="" />--></a></p>
                            </div>
                        </div><!-- /.row -->
                    </div><!-- /. container -->
                </div><!-- /#blue-foot -->
            </footer>
        <script>
        </script>
    </body>
</html>
