<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->

	<head>
	
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <meta name="description" content="Circular Content Carousel with jQuery" />
        <meta name="keywords" content="jquery, conent slider, content carousel, circular, expanding, sliding, css3" />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="../favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="css/demo.css" />
		<link rel="stylesheet" type="text/css" href="css/style1.css" />
		<link rel="stylesheet" type="text/css" href="css/jquery.jscrollpane.css" media="all" />
		<link href='http://fonts.googleapis.com/css?family=PT+Sans+Narrow&v1' rel='stylesheet' type='text/css' />
		<link href='http://fonts.googleapis.com/css?family=Coustard:900' rel='stylesheet' type='text/css' />
		<link href='http://fonts.googleapis.com/css?family=Rochester' rel='stylesheet' type='text/css' />
<!--script type="text/javascript" src="http://code.jquery.com/jquery-1.6.1.min.js"></script-->
<script type="text/javascript" src="jquery.gmap.min.js"></script>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>ShopMax - Shop - About us</title>
        <meta name="description" content="">

        <meta name="viewport" content="width=device-width">

		<!-- what happens with this with mobile phones? 
		<meta name="viewport" content="width=device-width, initial-scale=1" />-->
		
      	
		<link rel="stylesheet" href="css/bootstrap.css">     
		
		<link rel="stylesheet" href="css/bootstrap-responsive.css">
		
		<link rel="stylesheet" href="js/vendor/chosen.css">
		
		<link rel="stylesheet" href="css/new_style.css" />
        <link rel="stylesheet" href="css/main.css" />
        <link rel="stylesheet" href="css/product_details.css" />
        <link href="favicon.ico" rel="shortcut icon">
       

        <script src="js/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script>

		<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.8.3.min.js"><\/script>')</script>

        <script src="js/vendor/bootstrap.min.js"></script>

		<script src="js/vendor/chosen.jquery.min.js"></script>

		<link rel="stylesheet" href="css/anythingslider.css">

		<script src="js/vendor/jquery.anythingslider.min.js"></script>
		
		<link rel="stylesheet" href="js/fancybox/source/jquery.fancybox.css">
		
		<script src="js/fancybox/source/jquery.fancybox.pack.js"></script>

		<script src="js/vendor/jquery.countdown.min.js"></script>

		<script src="js/vendor/jquery.raty.min.js"></script>
	
		<script src="js/main.js"></script>
		
		
		 
	
    </head>
    <body >
        <!-- This code is taken from http://twitter.github.com/bootstrap/examples/hero.html -->

        <header id="topnav" class="navbar navbar-inverse navbar-fixed-top clearfix">
            <div class="navbar-inner">
                <div class="container">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </a>
                    <h1 title="Shopmax"><a class="brand" href="/"><img src="img/logo-2.png" width="159" height="55" alt="Shopmax logo" /></a></h1>
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
												<option value="shop1.html" selected="selected">This Shop</option>
												<option value="shop2.html">Shop 2</option>
												<option value="shop3.html">Shop 3</option>
												<option value="shop4.html">Shop 4</option>
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
							<li><a href="index.html">Home</a></li>
							<li class="on"><a href="shops.html">Shops</a></li>
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
			<div>
				<ul class="breadcrum"><li><a href="/">Home</a></li><li>Shops</li><li>Shops name</li></ul>
			</div>

			<div class="row content-left">
			<!-- MAIN CONTENT -->
				<!-- sliderdiv -->
				<div class="span12">
					<div class="shop-logo"><img src="img/shop-logo.jpg" /></div>
					<div class="shop-desc georgia"><h2>Imperial Camp</h2>Vivamus sagittv is lacus vel augue laoreet rutrum faucibus dolor auctor. Donec ullamcorper nulla non metus auctor fringilla. Vivamus sagittis lacus vel augue laoreet.</div>
					<ul class="shop-menu georgia">
						<li><a href="#">Shop Home</a></li><li><a href="#">Promotions</a></li><li><a href="#">Vouchers</a></li><li><a href="#">About Us</a></li><li><a href="#">Comments</a></li><li><a href="#">Discussions</a></li>
					</ul>
				</div>
			</div>
			
            <div class="abt_block1">
            	<h4>About our business</h4>
                <p>Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Donec ullamcorper nulla non metus auctor fringilla. Vivamus sagittis lacus vel augue laoreet.Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Donec ullamcorper nulla non metus auctor fringilla. Vivamus sagittis lacus vel augue laoreet.Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Donec ullamcorper nulla non metus auctor fringilla. Vivamus sagittis lacus vel augue laoreet.Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Donec ullamcorper nulla non metus auctor fringilla. Vivamus sagittis lacus vel augue laoreet.Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Donec ullamcorper nulla non metus auctor fringilla. Vivamus sagittis lacus vel augue laoreet.Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Donec ullamcorper nulla non metus auctor fringilla. Vivamus sagittis lacus vel augue laoreet.Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Donec ullamcorper nulla non metus auctor fringilla. Vivamus sagittis lacus vel augue laoreet.</p>
            </div>
			
			
			
            <div class="cont_block">
            	<div class="title"><h6>Contact Infomation</h6></div>
                <div class="block">
                	<div class="block-1">
                		<select class="select-1" id="mySelect">
                           <option selected="selected">Select a branch</option>
						   
						</select>
                        <ul>
					
                            <li><p>Phone number <strong>09 458 4857</strong></p></li>
                            <li><p>Tax number <strong>09458485702</strong></p></li>
                            <li><p>Address <strong>E12, Sollicitudin Shapping Mall<br>78 Vehicula Bibendum Rd<br>Cursus, Wellington</strong></p></li>
                            <li>
                            	<span class="span-1">Pick up in store</span>
                                <span class="span-2">Delivery</span>
                            </li>
					
                        </ul>
                    </div>
                    <div class="map-box"><!--<img src="img/map_img2.jpg" alt="">--->

					
					<?php

// First, setup the variables you will use on your <iframe> code
// Your Iframe will need a Width and Height set
// as well as the address you plan to Iframe
// Don't forget to get a Google Maps API key

$latitude = '';
$longitude = '';
$iframe_width = '565px';
$iframe_height = '350px';

$address = 'E12, Sollicitudin Shapping Mall, 78 Vehicula Bibendum Rd, Cursus, Wellington';
$address = urlencode($address);
$key = "ABQIAAAAnfs7bKE82qgb3Zc2YyS-oBT2yXp_ZAY8_ufC3CFXhHIE1NvwkxSySz_REpPq-4WZA27OwgbtyR3VcA";
$url = "http://maps.google.com/maps/geo?q=".$address."&output=json&key=".$key;
$ch = curl_init();

curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_HEADER,0);
curl_setopt($ch, CURLOPT_USERAGENT, $_SERVER["HTTP_USER_AGENT"]);
// Comment out the line below if you receive an error on certain hosts that have security restrictions
//curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);

$data = curl_exec($ch);
curl_close($ch);

$geo_json = json_decode($data, true);

// Uncomment the line below to see the full output from the API request
// var_dump($geo_json);

// If the Json request was successful (status 200) proceed
if ($geo_json['Status']['code'] == '200') {

$latitude = $geo_json['Placemark'][0]['Point']['coordinates'][0];
$longitude = $geo_json['Placemark'][0]['Point']['coordinates'][1]; ?>

<iframe width="<?php echo $iframe_width; ?>" height="<?php echo $iframe_height; ?>" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="

http://maps.google.com/maps

?f=q
&amp;source=s_q
&amp;hl=en
&amp;geocode=
&amp;q=<?php echo $address; ?>
&amp;aq=0
&amp;ie=UTF8
&amp;hq=
&amp;hnear=<?php echo $address; ?>
&amp;t=m
&amp;ll=<?php echo $longitude; ?>,<?php echo $latitude; ?>
&amp;z=12
&amp;iwloc=
&amp;output=embed"></iframe>

<?php

} else { echo "<p>No Address Available</p>";}

?>


	
	
					</div>
                </div>
            </div>
            
            <div class="store_photos clearfix">
                <div class="caption"><h6>Store Photos</h6></div>
			
					 
           <div class="block clearfix" id="ca-container" style="overflow:hidden!important;">
		   
				<div class="ca-wrapper" style="overflow:visible !important;">
                	<div class="ca-item ca-item-2" >
                    	<li id="li" style="list-style: none;"><a href="#"><img class="itemimage" src="img/pro-abt_img2.jpg" alt=""></a></li>
					</div>
					<div class="ca-item ca-item-3">
                    	<li id="li2" style="list-style: none;"><a href="#"><img class="itemimage" src="img/pro-abt_img1.jpg" alt=""></a></li>
					</div>
					<div class="ca-item ca-item-4" style="list-style: none;">
                    	<li id="li3"><a href="#"><img class="itemimage" src="img/pro-abt_img2.jpg" alt=""></a></li>
					</div>
					<div class="ca-item ca-item-5" style="list-style: none;">
                    	<li id="li4"><a href="#"><img class="itemimage" src="img/pro-abt_img1.jpg" alt=""></a></li>
					</div>
					<div class="ca-item ca-item-6" style="list-style: none;">
                    	<li id="li5"><a href="#"><img class="itemimage" src="img/pro-abt_img2.jpg" alt=""></a></li>
					</div>
					<div class="ca-item ca-item-7" style="list-style: none;">
                    	<li id="li5"><a href="#"><img class="itemimage" src="img/pro-abt_img1.jpg" alt=""></a></li>
					</div>
                        <!--li id="li1"><a href="#"><img src="img/pro-abt_img2.jpg" alt=""></a></li>
                        <li id="li1"><a href="#"><img src="img/pro-abt_img1.jpg" alt=""></a></li>
                        <li id="li1"><a href="#"><img src="img/pro-abt_img2.jpg" alt=""></a></li>
                        <li id="li1"><a href="#"><img src="img/pro-abt_img2.jpg" alt=""></a></li>
                        <li id="li1"><a href="#"><img src="img/pro-abt_img2.jpg" alt=""></a></li>
                        <li id="li1"><a href="#"><img src="img/pro-abt_img2.jpg" alt=""></a></li>
                        <li id="li1"><a href="#"><img src="img/pro-abt_img2.jpg" alt=""></a></li>
                        <li id="li1"><a href="#"><img src="img/pro-abt_img2.jpg" alt=""></a></li-->
				
                    <!--a href="#" class="left"><img src="img/arrow-prev-black.png" alt=""></a>
                    <a href="#" class="right"><img src="img/arrow-next-black.png" alt=""></a-->
                </div>		
                 <div class="ca-nav"><span class="ca-nav-prev">Previous</span><span class="ca-nav-next">Next</span></div>
				</div>  
            </div> 
            
            <div class="store_videos clearfix">
            	<div class="caption"><h6>Store Videos</h6></div>
                <div class="block"><a href="#"><img src="img/vid-img.jpg" alt=""></a></div>
            </div>

			<!-- /.row -->				
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
									<li class="pull-left"><a href="#"><img src="img/icon-twitter.png" width="33" height="33" alt="" /></a></li>
									<li class="pull-left"><a href="#"><img src="img/icon-fb.png" width="34" height="33" alt="" /></a></li>
									<li class="pull-left"><a href="#"><img src="img/icon-gplus.png" width="33" height="33" alt="" /></a></li>
									<li class="pull-left"><a href="#"><img src="img/icon-rss.png" width="33" height="33" alt="" /></a></li>
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
								<p><a href="#topnav" title="Jump to page top"><img src="img/shopmax-bottom-logo.png" width="106" height="30" alt="" /><!--<img src="img/logo-bottom.png" width="107" height="58" alt="" />--></a></p>
							</div>
						</div><!-- /.row -->
					</div><!-- /. container -->
				</div><!-- /#blue-foot -->
            </footer>

        

        
        <script>
        /*    var _gaq=[['_setAccount','UA-XXXXX-X'],['_trackPageview']];
            (function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];
            g.src=('https:'==location.protocol?'//ssl':'//www')+'.google-analytics.com/ga.js';
            s.parentNode.insertBefore(g,s)}(document,'script'));
		*/
		
        </script>
			<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
		<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
		<!-- the jScrollPane script -->
		<script type="text/javascript" src="js/jquery.mousewheel.js"></script>
		<script type="text/javascript" src="js/jquery.contentcarousel.js"></script>
		<script type="text/javascript">
			$('#ca-container').contentcarousel();
		</script>
    </body>
</html>
