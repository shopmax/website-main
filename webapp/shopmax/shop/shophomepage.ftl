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
jQuery(document).ready(function() {
    $("#changeTheme").click(function() {
        $.fancybox([
            '<@ofbizContentUrl>/shopmax-default/img/template/shophome_v1.jpg</@ofbizContentUrl>',
            '<@ofbizContentUrl>/shopmax-default/img/template/shophome_v6_v2.jpg</@ofbizContentUrl>',
            '<@ofbizContentUrl>/shopmax-default/img/template/shophome_v7.jpg</@ofbizContentUrl>',
        ], {
            'padding'           : 0,
            'transitionIn'      : 'none',
            'transitionOut'     : 'none',
            'type'              : 'image',
            'changeFade'        : 0
        });
    });
});
</script>
<div class="container content">
    
    <div class="row">
    <!-- MAIN CONTENT -->
        <#include "component://shopmax/webapp/shopmax/shop/shopheader.ftl" />
        <div class="span9 main-content">
            
            <div id="featured-shops" class="featured blue shophomev1_blue">
                <h3>Featured Products</h3>
                <ul>
                <li><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/shops-1.png</@ofbizContentUrl>" width="139" height="139" alt="" /></a>
                <h4>Shop 1</h4>
                <p class="price">$189.95</p>
                <p class="pull-right"><a href="#" class="btn-general">Shop Now</a>
                <p class="pull-right addshop"><a href="#">Add to Shopping List</a></p>
                </li>

                <li><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/shops-2.png</@ofbizContentUrl>" width="139" height="139" alt="" /></a>
                <h4>Shop 2</h4>
                <p class="price">$189.95</p>
                <p class="pull-right"><a href="#" class="btn-general">Shop Now</a>
                <p class="pull-right addshop"><a href="#">Add to Shopping List</a></p>
                </li>

                <li><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/shops-3.png</@ofbizContentUrl>" width="139" height="139" alt="" /></a>
                <h4>Shop 3</h4>
                <p class="price">$189.95</p>
                <p class="pull-right"><a href="#" class="btn-general">Shop Now</a>
                <p class="pull-right addshop"><a href="#">Add to Shopping List</a></p>
                </li>

                <!--li><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/shops-4.png</@ofbizContentUrl>" width="139" height="139" alt="" /></a>
                <h4>Shop 4</h4>
                <p>Description</p>
                <p><a href="#" class="btn-general">SHOP NOW</a></li-->
                </ul>
            </div>
            <div id="featured-products" class="featured bluetextbox">
                <h3>What others have viewed</h3>
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
            
        </div><!-- /.span9 -->
        <div class="span3 sidebar shophomev1_sidebar" id="side-menu">
            <div class="categories innerbox georgia">
                <h2>Shop categories</h2>
                <div class="category-list nested-list">
                     <#if categoryList?has_content>
                        <ul>
	                        <#list categoryList as productCategory>
	                            <li><a href="<@ofbizUrl>shopcategorygridview?productCategoryId=${productCategory.productCategoryId}</@ofbizUrl>">${productCategory.categoryName}</a></li>
	                        </#list>
                        </ul>
                    </#if>
                </div><!-- /#product-tab -->
            </div><!-- /.categories .innerbox -->
            <div class="greybar_last">
                <a href="#">View all categories</a>
            </div>
            <div class="promotions innerbox">
                <h2>Shop information</h2>
                <table cellpadding="0" cellspacing="0" border="0" class="table table_shopinfo">
                    <tr>
                        <td>
                            <select class="span2">
                                <option>Select a branch</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Phone number<br><strong>09 458 4857</strong></td>
                    </tr>
                    <tr>
                        <td>Address<br><strong>E12, Sollicitudin Shapping Mall<br>78 Vehicula Bibendum Rd<br>Cursus, Wellington</strong></td>
                    </tr>
                    <tr>
                        <td>Map<br><img class="map-img" alt="" src="<@ofbizContentUrl>/shopmax-default/img/map_img.jpg</@ofbizContentUrl>"></td>
                    </tr>
                    <tr>
                        <td><span class="span-1">Pick up in store</span><span class="span-2">Delivery</span></td>
                    </tr>
                    <tr>
                        <td></td>
                    </tr>
                </table>
            </div><!-- /.promotions -->
        </div><!-- /.span3.sidebar -->
        <div style="margin-left:20px">
            <a id="changeTheme" href="javascript:;" class="btn-general">Change Theme</a>
            <a href="#" class="btn-general">Decorate Your Shop</a>
        </div>
    </div><!-- /.row -->
</div> <!-- /container -->
