<#--
Licensed to the Apache
 Software Foundation (ASF) under one
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
<script src="<@ofbizContentUrl>/shopmax-default/js/manageproduct.js</@ofbizContentUrl>" type="text/javascript"></script>
<link rel='stylesheet' href='<@ofbizContentUrl>/shopmax-default/css/jquery-ui.css</@ofbizContentUrl>' type='text/css'>
<script src="<@ofbizContentUrl>/shopmax-default/js/jquery-ui.js</@ofbizContentUrl>" type="text/javascript"></script>
<script src="<@ofbizContentUrl>/shopmax-default/js/jquery.accordion.source.js</@ofbizContentUrl>" type="text/javascript"></script>
<script>
    function sumbiteditproduct(index){
        $('#updateproduct-'+index).submit();
    }
    
    function getUrlVars() {
        var vars = {};
        var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) {
            vars[key] = value;
        });
        return vars;
    }
    function removeProductImage(productCategoryId,productId,contentId,fromDate,productContentTypeId,index){
        $('.media-edit').addClass('media-edit-load');
        $('#load-remove-'+index).html("<img src='<@ofbizContentUrl>/shopmax-default/img/ajax-loader.gif</@ofbizContentUrl>'>");
        jQuery.ajax({
            url: 'removeProductContentAndImageFile',
            type: 'POST',
            data: {productCategoryId: productCategoryId, productId: productId, contentId: contentId, fromDate: fromDate, productContentTypeId: productContentTypeId},
            success: function(data) {
                $('#category-container').html(data);
                $('#view-edit-product-'+index).slideDown("slow");
            }
        });
    }
    function getFile(inputIndex){
        document.getElementById("upfile_"+inputIndex).click();
    }
    function sub(obj,inputIndex){
        var file = obj.value;
        if(!inputIndex){
            inputIndex = 0;
        }
        $('#yourBtn'+inputIndex).val(file);
        $('#li-'+inputIndex).addClass('uploaded');
        
    }
    function removeProduct(productCategoryId,productId,index){
        $('#view-edit-product-'+index).slideUp("slow");
        $('#media-'+index).addClass('media-edit-load');
        $('#load-'+index).html("<img src='<@ofbizContentUrl>/shopmax-default/img/ajax-loader.gif</@ofbizContentUrl>'>");
        jQuery.ajax({
            url: 'removeproductfromseller',
            type: 'POST',
            data: {productId: productId, productCategoryId: productCategoryId},
            success: function(data) {
                $('#category-container').html(data);
            }
        });
    }
</script>
<style>
    .prev_container{
        width: 82px;
        height: 82px;
    }
    .prev_thumb{
        height: 82px;
        width: 82px;
    }
</style>
<div class="container content">
    <!-- include breadcrumb -->
    ${screens.render("component://shopmax/widget/ShopMaxScreens.xml#Breadcrumbs")}
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
            
            <#include "component://shopmax/webapp/shopmax/catalog/manageproductpaginate.ftl" />
            <div id="category-container">
                <ul class="media-list edit-product-list manage_pro">
                    <#if productList?has_content>
                        <#list productList as product>
                            <li class="media" id="media-${product_index}">
                                <div id="load-${product_index}" class="loadimage"></div>
                                <a class="pull-left" href="#">
                                    <img class="media-object" src="<@ofbizContentUrl>/shopmax-default/img/product-generic-2.jpg</@ofbizContentUrl>" />
                                </a>
                                <div class="media-body">
                                    <h5 class="media-category">
                                        <#assign count = 1>
                                        <#assign size = product.categoryMember?size>
                                        <#list product.categoryMember as categoryMember>
                                            ${categoryMember?if_exists}
                                            <#if size != count>
                                            /
                                            </#if>
                                            <#assign count = count+1>
                                        </#list>
                                    </h5>
                                    <h4 class="media-heading">${product.productName?if_exists}</h4>
                                    <h6 class="media-code">SKU : ${product.productId?if_exists}</h6>
                                    <ul class="media-price">
                                        <#if product.promoPrice?exists>
                                            <li class="old"><@ofbizCurrency amount=product.defaultPrice/> NZD</li>
                                            <li class="current-price"><@ofbizCurrency amount=product.promoPrice/> NZD</li>
                                        <#else>
                                            <div class="price"><@ofbizCurrency amount=product.defaultPrice/> NZD</div>
                                        </#if>
                                    </ul>
                                    <p>Stocks : ${product.stock?if_exists}</p>
                                    <a class="btn-general edit" id="edit-product-${product_index}">Edit</a>
                                    <a class="btn-green-small" href="#">Promote</a>
                                    <a class="btn-grey-small" onclick="removeProduct('${productCategoryId?if_exists}','${product.productId?if_exists}',${product_index})">Remove</a>
                                </div>
                            </li>
                            <li class="media media-edit" style="display: none;" id="view-edit-product-${product_index}">
                                <div id="load-remove-${product_index}" class="loadremoveimage"></div>
                                <a class="pull-left" href="#">
                                <img class="media-object" src="<@ofbizContentUrl>/shopmax-default/img/product-generic-170x170.jpg</@ofbizContentUrl>" />
                                </a>
                                <div class="media-body">
                                    <form class="form-horizontal pull-left" id="updateproduct-${product_index}" name="updateproduct-${product_index}" action="<@ofbizUrl>updateproduct</@ofbizUrl>" method="post" enctype="multipart/form-data">
                                        <input type="hidden" name="productCategoryId" class="productCategoryId"/>
                                        <input type="hidden" name="productId" value="${product.productId?if_exists}"/>
                                        <div class="control-group">
                                            <label class="control-label" for="inputProductName">Product name</label>
                                            <div class="controls">
                                                <input type="text" class="input-xlarge" id="inputProductName" name="productName" value="${product.productName?if_exists}">
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label for="inputProductSKU" class="control-label">Product SKU</label>
                                            <div class="controls">
                                                <input type="text" id="inputProductSKU" class="input-xlarge" name="productSKU" value="${product.productSKU?if_exists}">
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label" for="inputDescription">Description</label>
                                            <div class="controls">
                                                <textarea rows="3" class="input-xlarge" name="description">${product.description?if_exists}</textarea>
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label" for="inputDescription">Picture upload (4 Max)</label>
                                            <div class="controls">
                                                <ul class="uploading">
                                                    <#if product.imageSequenceList?has_content>
                                                        <#list 1..4 as i>
                                                            <#assign check = 1>
                                                            <#if product.productImageList?has_content>
                                                                <#list product.productImageList as productImage>
                                                                    <#if productImage.sequenceNum == i>
                                                                        <li>
                                                                            <div class="uploaded-image">
                                                                                <img src="<@ofbizContentUrl>${productImage.productImageThumb}</@ofbizContentUrl>" />
                                                                            </div>
                                                                            <a onclick="removeProductImage('${productCategoryId?if_exists}','${product.productId?if_exists}','${productImage.contentId?if_exists}','${productImage.fromDate?if_exists}','IMAGE','${product_index}')">Remove</a>
                                                                        </li>
                                                                    <#else>
                                                                        <#if product.seqNumNoImage?has_content>
                                                                            <#list product.seqNumNoImage as seqNoImage>
                                                                                <#if seqNoImage == i && check !=0>
                                                                                    <li id="li-${product_index}_${i}">
                                                                                        <div id="prev_upfile_${product_index}_${i}" class="uploaded-image" onclick="getFile('${product_index}_${i}')">
                                                                                        </div>
                                                                                        <a onclick="getFile('${product_index}_${i}')">Add Photo</a>
                                                                                        <div style='height: 0px;width:0px; overflow:hidden; border:0;'><input class="file" id="upfile_${product_index}_${i}" type="file" onchange="sub(this,'${product_index}_${i}')" name="uploadedFile${i}"/></div>
                                                                                    </li>
                                                                                    <#assign check = 0>
                                                                                </#if>
                                                                            </#list>
                                                                        </#if>
                                                                    </#if>
                                                                </#list>
                                                            </#if>
                                                        </#list>
                                                    <#else>
                                                        <#list 1..4 as i>
                                                            <li id="li-${product_index}_${i}">
                                                                <div id="prev_upfile_${product_index}_${i}" class="uploaded-image" onclick="getFile('${product_index}_${i}')">
                                                                </div>
                                                                <a onclick="getFile('${product_index}_${i}')">Add Photo</a>
                                                                <div style='height: 0px;width:0px; overflow:hidden; border:0;'><input class="file" id="upfile_${product_index}_${i}" type="file" onchange="sub(this,'${product_index}_${i}')" name="uploadedFile${i}"/></div>
                                                            </li>
                                                        </#list>
                                                    </#if>
                                                </ul>
                                            </div>
                                        </div>
                                        
                                        <div class="form-inline input-price-stock">
                                            <label>
                                                Listing price
                                                <input type="text" class="input-medium" name="listingPrice" value="${product.defaultPrice?if_exists}">
                                            </label>
                                            <label style="border:1px solid #E0E0E0;">
                                                Available stock
                                                <input type="text" class="input-medium" name="stock" value="${product.stock?if_exists}">
                                            </label>
                                        </div>
                                        
                                        <div class="form-inline input-promotion">
                                            <input type="checkbox" id="checkBoxManage${product_index}">
                                            <label>
                                                <input type="number" class="input-mini" name="promoPrice" value="${product.promoPrice?if_exists}" id="promoPrice${product_index}">
                                            </label>
                                            <label>
                                                &nbsp;&nbsp;Valid from&nbsp;
                                                <input type="text" class="input-small dateText" id="datePickerFrom${product_index}">
                                            </label>
                                            <img src="<@ofbizContentUrl>/shopmax-default/img/icon-calendar.png</@ofbizContentUrl>" id="From${product_index}" class="datepicker"/>
                                            <label>
                                                &nbsp;&nbsp;To&nbsp;
                                                <input type="text" class="input-small dateText" id="datePickerThru${product_index}">
                                            </label>
                                            <img src="<@ofbizContentUrl>/shopmax-default/img/icon-calendar.png</@ofbizContentUrl>" id="Thru${product_index}" class="datepicker"/>
                                        </div>
                                        <input type="hidden" name="promoPriceFromDate" id="promo-datePickerFrom${product_index}" value="<#if product.productPricePromo?has_content>${product.productPricePromo.fromDate?if_exists}</#if>"/>
                                        <input type="hidden" name="promoPriceThruDate" id="promo-datePickerThru${product_index}" value="<#if product.productPricePromo?has_content>${product.productPricePromo.thruDate?if_exists}</#if>"/>
                                        <div class="form-inline">
                                            <label>Shipping size</label><br />
                                            <a class="btn-dark-grey-small shippingSize" id="XTRA_SMALL-shippingSize${product_index}" <#if product.shippingSize?if_exists == 'XTRA_SMALL'>style="color: rgb(53, 139, 219);"</#if>>Xtra Small</a>
                                            <a class="btn-dark-grey-small shippingSize" id="SMALL-shippingSize${product_index}" <#if product.shippingSize?if_exists == 'SMALL'>style="color: rgb(53, 139, 219);"</#if>>Small</a>
                                            <a class="btn-dark-grey-small shippingSize" id="NORMAL-shippingSize${product_index}" <#if product.shippingSize?if_exists == 'NORMAL'>style="color: rgb(53, 139, 219);"</#if>>Normal</a>
                                            <a class="btn-dark-grey-small shippingSize" id="LARGE-shippingSize${product_index}" <#if product.shippingSize?if_exists == 'LARGE'>style="color: rgb(53, 139, 219);"</#if>>Large</a>
                                            <a class="btn-dark-grey-small shippingSize" id="XTRA_LARGE-shippingSize${product_index}" <#if product.shippingSize?if_exists == 'XTRA_LARGE'>style="color: rgb(53, 139, 219);"</#if>>Xtra Large</a>
                                        </div>
                                        <input type="hidden" id="shippingSize${product_index}" name="shippingSize" value="${product.shippingSize?if_exists}">
                                    </form>
                                    <div class="input-save">
                                        <a class="btn-general" onclick="sumbiteditproduct('${product_index}')">Save</a><br /><br />
                                        <a href="<@ofbizUrl>uploadproduct?productId=${product.productId?if_exists}</@ofbizUrl>" class="edit-full-mode">Switch to full edit mode</a>
                                    </div>
                                </div>
                            </li>
                        </#list>
                    <#else>
                        <div>${uiLabelMap.ProductNoProductsInThisCategory}</div>
                    </#if>
                </ul>
            </div>
            <#include "component://shopmax/webapp/shopmax/catalog/manageproductpaginate.ftl" />
            
        </div><!-- /.span9 -->
        <div class="span3 sidebar" id="side-menu">
            <#include "component://shopmax/webapp/shopmax/catalog/categorylist.ftl" />
        </div><!-- /.span3.sidebar -->
    </div><!-- /.row --> 
</div> <!-- /container -->
