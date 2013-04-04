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
    <#include "component://shopmax/webapp/shopmax/includes/breadcrum.ftl" />
    <div class="row">
    <!-- MAIN CONTENT -->
        <!-- sliderdiv -->
        <div class="span9 main-content manage-product">
            <form class="form-inline form-search">
            <label>Sort By</label>
            
            <select name="SortBy" class="drop-select chosen combo sortBy" data-search-bar="true">
                    <option value="" selected="selected">Price</option>
                    <option value="1">Name</option>
                    <option value="2">Stock</option>
            </select>
            
            <div class="input-search">
            <label>Search Product By Name or SKU  
            </label>
            <input type="text" class="input-large"> 
            <button type="submit" class="btn btn-small">Edit</button>   
            </div>
            </form>
            <div class="add-product">
                <a class="btn-general" href="#">Add New Product</a>
                <div class="paging">
                <ul>
                <li><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/arrow-prev-grey.png</@ofbizContentUrl>" /></a></li>
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">...</a></li>
                <li><a href="#">10</a></li>
                <li><a href="#"><img src="img/arrow-next-blue.png" /></a></li>
                </ul>
                </div>
            </div>
            <ul class="media-list edit-product-list manage_pro">
                <li class="media">
                    <a class="pull-left" href="#">
                    <img class="media-object" src="<@ofbizContentUrl>/shopmax-default/img/product-generic-2.jpg</@ofbizContentUrl>" />
                    </a>
                    <div class="media-body">
                        <h5 class="media-category">Art/Print/Other</h5>
                        <h4 class="media-heading">Product name</h4>
                        <h6 class="media-code">SKU:189798</h6>
                        <ul class="media-price">
                            <li class="old">$179.00NZD</li>
                            <li class="current-price">$135.00NZD</li>
                        </ul>
                        <p>Stocks: 98</p>   
                        <a class="btn-general" href="#">Edit</a>
                        <a class="btn-green-small" href="#">Promote</a>
                        <a class="btn-grey-small" href="#">Remove</a>
                    </div>
                </li>
                <li class="media">
                    <a class="pull-left" href="#">
                    <img class="media-object" src="<@ofbizContentUrl>/shopmax-default/img/product-generic-3.jpg</@ofbizContentUrl>" />
                    </a>
                    <div class="media-body">
                        <h5 class="media-category">Art/Print/Other</h5>
                        <h4 class="media-heading">Product name</h4>
                        <h6 class="media-code">SKU:189798</h6>
                        <ul class="media-price">
                            <li class="old">$179.00NZD</li>
                            <li class="current-price">$135.00NZD</li>
                        </ul>
                        <p>Stocks: 98</p>   
                        <a class="btn-general" href="#">Edit</a>
                        <a class="btn-green-small" href="#">Promote</a>
                        <a class="btn-grey-small" href="#">Remove</a>
                    </div>
                </li>
                <li class="media">
                    <a class="pull-left" href="#">
                    <img class="media-object" src="<@ofbizContentUrl>/shopmax-default/img/product-generic-170x170.jpg</@ofbizContentUrl>" />
                    </a>
                    <div class="media-body">
                        <h5 class="media-category">Art/Print/Other</h5>
                        <h4 class="media-heading">Product name</h4>
                        <h6 class="media-code">SKU:189798</h6>
                        <ul class="media-price">
                            <li class="old">$179.00NZD</li>
                            <li class="current-price">$135.00NZD</li>
                        </ul>
                        <p>Stocks: 98</p>   
                        <a class="btn-general" href="#">Edit</a>
                        <a class="btn-green-small" href="#">Promote</a>
                        <a class="btn-grey-small" href="#">Remove</a>
                    </div>
                </li>
                <li class="media">
                    <a class="pull-left" href="#">
                    <img class="media-object" src="<@ofbizContentUrl>/shopmax-default/img/product-generic-4.jpg</@ofbizContentUrl>" />
                    </a>
                    <div class="media-body">
                        <h5 class="media-category">Art/Print/Other</h5>
                        <h4 class="media-heading">Product name</h4>
                        <h6 class="media-code">SKU:189798</h6>
                        <ul class="media-price">
                            <li class="old">$179.00NZD</li>
                            <li class="current-price">$135.00NZD</li>
                        </ul>
                        <p>Stocks: 98</p>   
                        <a class="btn-general" href="#">Edit</a>
                        <a class="btn-green-small" href="#">Promote</a>
                        <a class="btn-grey-small" href="#">Remove</a>
                    </div>
                </li>
                <li class="media">
                    <a class="pull-left" href="#">
                    <img class="media-object" src="<@ofbizContentUrl>/shopmax-default/img/product-generic-5.jpg</@ofbizContentUrl>" />
                    </a>
                    <div class="media-body">
                        <h5 class="media-category">Art/Print/Other</h5>
                        <h4 class="media-heading">Product name</h4>
                        <h6 class="media-code">SKU:189798</h6>
                        <ul class="media-price">
                            <li class="old">$179.00NZD</li>
                            <li class="current-price">$135.00NZD</li>
                        </ul>
                        <p>Stocks: 98</p>   
                        <a class="btn-general" href="#">Edit</a>
                        <a class="btn-green-small" href="#">Promote</a>
                        <a class="btn-grey-small" href="#">Remove</a>
                    </div>
                </li>
                <li class="media">
                    <a class="pull-left" href="#">
                    <img class="media-object" src="<@ofbizContentUrl>/shopmax-default/img/product-generic-6.jpg</@ofbizContentUrl>" />
                    </a>
                    <div class="media-body">
                        <h5 class="media-category">Art/Print/Other</h5>
                        <h4 class="media-heading">Product name</h4>
                        <h6 class="media-code">SKU:189798</h6>
                        <ul class="media-price">
                            <li class="old">$179.00NZD</li>
                            <li class="current-price">$135.00NZD</li>
                        </ul>
                        <p>Stocks: 98</p>   
                        <a class="btn-general" href="#">Edit</a>
                        <a class="btn-green-small" href="#">Promote</a>
                        <a class="btn-grey-small" href="#">Remove</a>
                    </div>
                </li>
                <li class="media">
                    <a class="pull-left" href="#">
                    <img class="media-object" src="<@ofbizContentUrl>/shopmax-default/img/product-generic-7.jpg</@ofbizContentUrl>" />
                    </a>
                    <div class="media-body">
                        <h5 class="media-category">Art/Print/Other</h5>
                        <h4 class="media-heading">Product name</h4>
                        <h6 class="media-code">SKU:189798</h6>
                        <ul class="media-price">
                            <li class="old">$179.00NZD</li>
                            <li class="current-price">$135.00NZD</li>
                        </ul>
                        <p>Stocks: 98</p>   
                        <a class="btn-general" href="#">Edit</a>
                        <a class="btn-green-small" href="#">Promote</a>
                        <a class="btn-grey-small" href="#">Remove</a>
                    </div>
                </li>
            </ul>
            <div class="add-product">
                <a class="btn-general" href="#">Add New Product</a>
                <div class="paging">
                    <ul>
                        <li><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/arrow-prev-grey.png</@ofbizContentUrl>" /></a></li>
                        <li><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">...</a></li>
                        <li><a href="#">10</a></li>
                        <li><a href="#"><img src="img/arrow-next-blue.png" /></a></li>
                    </ul>
                </div>
            </div>
        </div><!-- /.span9 -->
        <div class="span3 sidebar" id="side-menu">
            <#include "component://shopmax/webapp/shopmax/catalog/categorylist.ftl" />
        </div><!-- /.span3.sidebar -->
    </div><!-- /.row --> 
</div> <!-- /container -->
