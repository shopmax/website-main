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
        $('#view-edit-product-'+index).find('input.check,textarea.check').each(function(){
            if(!$(this).val().length){
                $(this).addClass('required');
            }
            else{
            $(this).removeClass('required');
                if($('.required').length == 0){
                    if(!$('#inputDescription-'+index).val().length){
                        $('#inputDescription-'+index).addClass('required');
                    }
                    else if(!$('#inputListPrice-'+index).val().length){
                        $('#inputListPrice-'+index).addClass('required');
                    }
                    else{
                        $('#updateproduct-'+index).submit();
                    }
                }
            }
        });
        $('input.check').focus(function(){
            $('#'+this.id).removeClass('required');
        });
        $('textarea.check').focus(function(){
            $('#'+this.id).removeClass('required');
        });
        $('.edit').click(function(){
            $('.media-list').find('input.check,textarea.check').each(function(){
                $(this).removeClass('required');
            });
        });
    }
    
    function getUrlVars() {
        var vars = {};
        var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) {
            vars[key] = value;
        });
        return vars;
    }
    function removeProductImage(productCategoryId,productId,contentId,fromDate,productContentTypeId,index){
        if(confirm("Do you want to remove this product image?")){
            $('.media-edit').addClass('media-edit-load');
            $('#load-remove-'+index).html("<img src='<@ofbizContentUrl>/shopmax-default/img/ajax-loader.gif</@ofbizContentUrl>'>");
            jQuery.ajax({
                url: 'removeProductContentAndImageFileSeller',
                type: 'POST',
                data: {productCategoryId: productCategoryId, productId: productId, contentId: contentId, fromDate: fromDate, productContentTypeId: productContentTypeId},
                success: function(data) {
                    $('.category-container').html(data);
                    if($('#promo-datePickerFrom'+index).val()){
                        var getFromDate = $('#promo-datePickerFrom'+index).val().split(" ");
                        var fromDateFormat = getFromDate[0].split("-");
                        $('#datePickerFrom'+index).val(fromDateFormat[1]+'/'+fromDateFormat[2]+'/'+fromDateFormat[0]);
                    }
                    if($('#promo-datePickerThru'+index).val()){
                        var getThruDate = $('#promo-datePickerThru'+index).val().split(" ");
                        var thruDateFormat = getThruDate[0].split("-");
                        $('#datePickerThru'+index).val(thruDateFormat[1]+'/'+thruDateFormat[2]+'/'+thruDateFormat[0]);
                    }
                    if($('#promoPrice'+index).val()){
                        document.getElementById("checkBoxManage"+index).checked=true;
                    }
                    $("#datePickerFrom"+index).datepicker();
                    $("#datePickerThru"+index).datepicker();
                    $('#view-edit-product-'+index).slideDown("slow");
                    $('.productCategoryId').val(getUrlVars()["productCategoryId"]);
                    $('#view-edit-product-'+index).slideDown("slow");
                }
            });
        }
        else{
            return false;
        }
    }
    
    function getFile(inputIndex){
        document.getElementById("upfile_"+inputIndex).click();
    }
    
    function removeProduct(productCategoryId,productId,index){
        if(confirm("Do you want to remove this product?")){
            $('#view-edit-product-'+index).slideUp("slow");
            $('#media-'+index).addClass('media-edit-load');
            $('#load-'+index).html("<img src='<@ofbizContentUrl>/shopmax-default/img/ajax-loader.gif</@ofbizContentUrl>'>");
            jQuery.ajax({
                url: 'removeProductFromSeller',
                type: 'POST',
                data: {productId: productId, productCategoryId: productCategoryId},
                success: function(data) {
                    $('.category-container').html(data);
                }
            });
        }
        else{
            return false;
        }
    }
    function paginationPage(index){
        var productCategoryId = getUrlVars()["productCategoryId"];
        jQuery.ajax({
            url: 'manageproductdetail',
            type: 'POST',
            data: {productCategoryId:productCategoryId,VIEW_INDEX: index},
            success: function(data) {
                $('.category-container').html(data);
            }
        });
    }
    
    function showPreview(ele,index)
    {
        $('#imgAvatar_'+index).attr('src', '<@ofbizContentUrl>/shopmax-default/img/product-generic-82x82.jpg</@ofbizContentUrl>');
        if (ele.files && ele.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#imgAvatar_'+index).attr('src', e.target.result);
            }
            reader.readAsDataURL(ele.files[0]);
        }
        $('#li-'+index).addClass('uploaded');
    }
    $(function(){
        $('#sortBy').change(function(){
            if(getUrlVars()["productCategoryId"]){
                var lastURL = window.location.href.split('#')[0];
                var uselocation = lastURL.split('&sortBy')[0];
                window.location = uselocation+'&sortBy='+this.options[ this.selectedIndex ].value;
            }else{
                var lastURL = window.location.href.split('#')[0];
                var uselocation = lastURL.split('?sortBy')[0];
                window.location = uselocation+'?sortBy='+this.options[ this.selectedIndex ].value;
            }
        });
    });
</script>
<style>
    .uploaded-image{
        width: 82px;
        height: 82px;
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
                <select name="SortBy" class="drop-select chosen combo sortBy" id="sortBy" data-search-bar="true">
                    <option value="" <#if parameters.sortBy?if_exists == "">selected="selected"</#if>>Sort By</option>
                    <option value="price" <#if parameters.sortBy?if_exists == "price">selected="selected"</#if>>Price</option>
                    <option value="name" <#if parameters.sortBy?if_exists == "name">selected="selected"</#if>>Name</option>
                    <option value="stock" <#if parameters.sortBy?if_exists == "stock">selected="selected"</#if>>Stock</option>
                </select>
                
                <div class="input-search">
                    <label>Search Product By Name or SKU  
                    </label>
                    <input type="text" class="input-large"> 
                    <button type="submit" class="btn btn-small">Edit</button>
                </div>
            </form>
            
            <div class="category-container">
                <div class="add-product">
                    <a class="btn-general" href="<@ofbizUrl>uploadproduct</@ofbizUrl>">Add New Product</a>
                    <div class="paging">
                        <#include "component://shopmax/webapp/shopmax/catalog/manageproductpaginate.ftl" />
                        <#assign commonUrl = "manageproduct?" + paramStirng?if_exists/>
                        <#assign viewIndexFirst = 0/>
                        <#assign viewIndexPrevious = viewIndex - 1/>
                        <#assign viewIndexNext = viewIndex + 1/>
                        <#assign viewIndexLast = Static["java.lang.Math"].floor(listSize/viewSize)/>
                        <#assign viewIndexLastIndex = viewIndexLast-1/>
                        <#assign messageMap = Static["org.ofbiz.base.util.UtilMisc"].toMap("lowCount", lowIndex, "highCount", highIndex, "total", listSize)/>
                        <#assign commonDisplaying = Static["org.ofbiz.base.util.UtilProperties"].getMessage("CommonUiLabels", "CommonDisplaying", messageMap, locale)/>
                        <@nextPrev commonUrl=commonUrl ajaxEnabled=true javaScriptEnabled=true paginateStyle="" paginateFirstStyle="" viewIndex=viewIndex highIndex=highIndex listSize=listSize viewSize=viewSize ajaxFirstUrl="" firstUrl="" paginateFirstLabel="" paginatePreviousStyle="" ajaxPreviousUrl="" previousUrl="" paginatePreviousLabel="" pageLabel="" ajaxSelectUrl="" selectUrl="" ajaxSelectSizeUrl="" selectSizeUrl="" commonDisplaying=commonDisplaying paginateNextStyle="" ajaxNextUrl="${viewIndexNext}" nextUrl="" paginateNextLabel="" paginateLastStyle="" ajaxLastUrl="" lastUrl="" paginateLastLabel="" paginateViewSizeLabel="" />
                    </div>
                </div>
                <ul class="media-list edit-product-list manage_pro">
                    <#if productList?has_content>
                        <#list productList as product>
                            <li class="media" id="media-${product_index}">
                                <div id="load-${product_index}" class="loadimage"></div>
                                <a class="pull-left" href="#">
                                    <#if product.productImage?exists>
                                        <img class="media-object" src="<@ofbizContentUrl>${product.productImage}</@ofbizContentUrl>" width="170" style="height: 170px;"/>
                                    <#else>
                                        <img class="media-object" src="<@ofbizContentUrl>/images/defaultImage.jpg</@ofbizContentUrl>" width="170" style="height: 170px;"/>
                                    </#if>
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
                                    <h6 class="media-code">SKU : <#if product.productSKU?exists>${product.productSKU?if_exists}<#else>${product.productId?if_exists}</#if></h6>
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
                                    <#if product.productImage?exists>
                                        <img class="media-object" src="<@ofbizContentUrl>${product.productImage}</@ofbizContentUrl>" width="170" style="height: 170px;"/>
                                    <#else>
                                        <img class="media-object" src="<@ofbizContentUrl>/images/defaultImage.jpg</@ofbizContentUrl>" width="170" style="height: 170px;"/>
                                    </#if>
                                </a>
                                <div class="media-body">
                                    <form class="form-horizontal pull-left" id="updateproduct-${product_index}" name="updateproduct-${product_index}" action="<@ofbizUrl><#if parameters.productCategoryId?has_content>updateProduct<#else>updateProductNoCate</#if></@ofbizUrl>" method="post" enctype="multipart/form-data">
                                        <input type="hidden" name="productCategoryId" class="productCategoryId"/>
                                        <input type="hidden" name="productId" value="${product.productId?if_exists}"/>
                                        <div class="control-group">
                                            <label class="control-label" for="inputProductName">Product name</label>
                                            <div class="controls">
                                                <input type="text" class="input-xlarge check" id="inputProductName-${product_index}" name="productName" value="${product.productName?if_exists}">
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label" for="inputDescription">Product description</label>
                                            <div class="controls">
                                                <textarea rows="3" id="inputDescription-${product_index}" class="input-xlarge check" name="description">${product.description?if_exists}</textarea>
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
                                                                                <img src="<@ofbizContentUrl>${productImage.productImageThumb}</@ofbizContentUrl>" width="82" style="height: 82px;"/>
                                                                            </div>
                                                                            <a onclick="removeProductImage('${productCategoryId?if_exists}','${product.productId?if_exists}','${productImage.contentId?if_exists}','${productImage.fromDate?if_exists}','IMAGE','${product_index}')">Remove</a>
                                                                        </li>
                                                                    <#else>
                                                                        <#if product.seqNumNoImage?has_content>
                                                                            <#list product.seqNumNoImage as seqNoImage>
                                                                                <#if seqNoImage == i && check !=0>
                                                                                    <li id="li-${product_index}_${i}">
                                                                                        <div class="uploaded-image" onclick="getFile('${product_index}_${i}')">
                                                                                            <img id="imgAvatar_${product_index}_${i}">
                                                                                        </div>
                                                                                        <a onclick="getFile('${product_index}_${i}')">Add Photo</a>
                                                                                        <div style='height: 0px;width:0px; overflow:hidden; border:0;'><input class="file" id="upfile_${product_index}_${i}" type="file" onchange="showPreview(this,'${product_index}_${i}')" name="uploadedFile${i}"/></div>
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
                                                                <div class="uploaded-image" onclick="getFile('${product_index}_${i}')">
                                                                    <img id="imgAvatar_${product_index}_${i}">
                                                                </div>
                                                                <a onclick="getFile('${product_index}_${i}')">Add Photo</a>
                                                                <div style='height: 0px;width:0px; overflow:hidden; border:0;'><input class="file" id="upfile_${product_index}_${i}" type="file" onchange="showPreview(this,'${product_index}_${i}')" name="uploadedFile${i}"/></div>
                                                            </li>
                                                        </#list>
                                                    </#if>
                                                </ul>
                                            </div>
                                        </div>
                                        
                                        <div class="form-inline input-price-stock">
                                            <label>
                                                Listing price
                                                <input type="text" id="inputListPrice-${product_index}" class="input-medium check input-price" name="listingPrice" value="${product.defaultPrice?if_exists}" onkeypress='return isNumberKey(event)'>
                                            </label>
                                            <label style="border:1px solid #E0E0E0;">
                                                Stock
                                                <input type="text" class="input-medium input-stock" name="stock" id="stock-${product_index}" value="${product.stock?if_exists}" onkeypress='return isNumberKeyNoneDecimal(event)'>
                                            </label>
                                        </div>
                                        <div class="form-inline input-promotion">
                                            <input type="checkbox" id="checkBoxManage${product_index}">
                                            <label>
                                                 &nbsp;Promotion price&nbsp;
                                                <input type="number" class="input-mini input-price" name="promoPrice" value="${product.promoPrice?if_exists}" id="promoPrice${product_index}" onkeypress='return isNumberKey(event)'>
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
                <div class="add-product">
                    <a class="btn-general" href="<@ofbizUrl>uploadproduct</@ofbizUrl>">Add New Product</a>
                    <div class="paging">
                        <#include "component://shopmax/webapp/shopmax/catalog/manageproductpaginate.ftl" />
                        <#assign commonUrl = "manageproduct?" + paramStirng?if_exists/>
                        <#assign viewIndexFirst = 0/>
                        <#assign viewIndexPrevious = viewIndex - 1/>
                        <#assign viewIndexNext = viewIndex + 1/>
                        <#assign viewIndexLast = Static["java.lang.Math"].floor(listSize/viewSize)/>
                        <#assign viewIndexLastIndex = viewIndexLast-1/>
                        <#assign messageMap = Static["org.ofbiz.base.util.UtilMisc"].toMap("lowCount", lowIndex, "highCount", highIndex, "total", listSize)/>
                        <#assign commonDisplaying = Static["org.ofbiz.base.util.UtilProperties"].getMessage("CommonUiLabels", "CommonDisplaying", messageMap, locale)/>
                        <@nextPrev commonUrl=commonUrl ajaxEnabled=true javaScriptEnabled=true paginateStyle="" paginateFirstStyle="" viewIndex=viewIndex highIndex=highIndex listSize=listSize viewSize=viewSize ajaxFirstUrl="" firstUrl="" paginateFirstLabel="" paginatePreviousStyle="" ajaxPreviousUrl="" previousUrl="" paginatePreviousLabel="" pageLabel="" ajaxSelectUrl="" selectUrl="" ajaxSelectSizeUrl="" selectSizeUrl="" commonDisplaying=commonDisplaying paginateNextStyle="" ajaxNextUrl="${viewIndexNext}" nextUrl="" paginateNextLabel="" paginateLastStyle="" ajaxLastUrl="" lastUrl="" paginateLastLabel="" paginateViewSizeLabel="" />
                    </div>
                </div>
            </div>
        </div><!-- /.span9 -->
        <div class="span3 sidebar" id="side-menu">
            <#include "component://shopmax/webapp/shopmax/catalog/categorylist.ftl" />
        </div><!-- /.span3.sidebar -->
    </div><!-- /.row --> 
</div> <!-- /container -->
