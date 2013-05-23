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
<script src="<@ofbizContentUrl>/shopmax-default/js/uploadproduct.js</@ofbizContentUrl>" type="text/javascript"></script>
<link rel='stylesheet' href='<@ofbizContentUrl>/shopmax-default/css/jquery-ui.css</@ofbizContentUrl>' type='text/css'>
<script src="<@ofbizContentUrl>/shopmax-default/js/jquery-ui.js</@ofbizContentUrl>" type="text/javascript"></script>
<script>
    $(function(){
        $('#submit_uploadProductToSeller').click(function(e){
            if(typeof getUrlVars()["productId"] != "undefined"){
                var isClickActivityOccur = confirm("Do you want to update this product?");
            }
            else{
                var isClickActivityOccur = confirm("Do you want to upload new product?");
            }
            if (isClickActivityOccur==true)
            {
                $('#uploadProductToSeller').submit();
            }
            e.preventDefault();
        });
    });
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
<div class="container content promotion">
    <!-- include breadcrumb -->
    ${screens.render("component://shopmax/widget/ShopMaxScreens.xml#Breadcrumbs")}
    <div class="row">
        <div class="span3 sidebar" id="side-menu">
            <div class="categories innerbox">
                <h2>Tips</h2>
                <div class="category-list">
                    <p>
                    content here
                    </p>
                </div>
            </div><!-- /.categories .innerbox -->
        </div><!-- /.span3.sidebar -->
        <!-- MAIN CONTENT -->
        <!-- sliderdiv -->
        <div class="span9 main-content">
            <table class="table table-condensed sc-table sc-table-promotion">
              <thead>
                <tr class="sc-table-header">
                  <th class="col1">Basic Information</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                    <td class="col1 product-upload">
                        <label>&nbsp;&nbsp;&nbsp;Select your category</label>
                        <div id="ajax-container">
                            <div class="controls controls-row select-category pull-left">
                                <div class="span3">
                                    <select size=9 id="category_1">
                                        <#if categoryList?has_content>
                                            <#list categoryList as category>
                                                <#assign productCatelogId = category.productCategoryId/>
                                                <option value="${productCatelogId}-${category.categoryName}" id="${productCatelogId}" class="category_1" <#if parameters.categoryFirstId?has_content><#if parameters.categoryFirstId == productCatelogId>selected="selected"</#if></#if>>${category.categoryName?if_exists}</option>
                                            </#list>
                                        </#if>
                                    </select>
                                </div>
                                <div class="span3">
                                    <select size=9 id="category_2">
                                        <#if categorySecondList?has_content>
                                            <#list categorySecondList as category>
                                                <#assign productCatelogId = category.productCategoryId/>
                                                <option value="${productCatelogId}-${category.categoryName}" id="${productCatelogId}" class="category_2" <#if parameters.categorySecondId?has_content><#if parameters.categorySecondId == productCatelogId>selected="selected"</#if></#if>>${category.categoryName?if_exists}</option>
                                            </#list>
                                        </#if>
                                    </select>
                                </div>
                                <div class="span3">
                                    <select size=9 id="category_3">
                                        <#if categoryThirdList?has_content>
                                            <#list categoryThirdList as category>
                                                <#assign productCatelogId = category.productCategoryId/>
                                                <option value="${productCatelogId}-${category.categoryName}" id="${productCatelogId}" class="category_3" <#if parameters.categoryThirdId?has_content><#if parameters.categoryThirdId == productCatelogId>selected="selected"</#if></#if>>${category.categoryName?if_exists}</option>
                                            </#list>
                                        </#if>
                                    </select>
                                </div>
                                <div class="span3">
                                    <select size=9 id="category_4">
                                        <#if categoryFourthList?has_content>
                                            <#list categoryFourthList as category>
                                                <#assign productCatelogId = category.productCategoryId/>
                                                <option value="${productCatelogId}-${category.categoryName}" id="${productCatelogId}" class="category_4" <#if parameters.categoryFourthId?has_content><#if parameters.categoryFourthId == productCatelogId>selected="selected"</#if></#if>>${category.categoryName?if_exists}</option>
                                            </#list>
                                        </#if>
                                    </select>
                                </div>
                            </div>
                            <div class="assign-category">
                                &nbsp;&nbsp; * You can assign a product to more than one category
                                <a id="assign-category" class="btn-general pull-right">Assign</a>
                            </div>
                        </div>
                        <div class="select-products-wrapper">
                            <table class="selected-products">
                                <tbody>
                            </tbody></table>
                        </div>
                        <form class="form-horizontal pull-left media-edit" action="uploadProductToSeller" id="uploadProductToSeller" name="uploadProductToSeller" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="listCategory" value="" id="listCategory">
                            <div class="control-group">
                                <label for="inputProductName" class="control-label">Product name</label>
                                <div class="controls">
                                    <input type="text" id="inputProductName" class="input-xlarge" name="productName">
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="inputDescription" class="control-label">Product description</label>
                                <div class="controls">
                                    <textarea class="input-xlarge" rows="3" name="description"></textarea>
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="inputDescription" class="control-label">Picture upload (4 Max)</label>
                                <div class="controls">
                                    <ul class="uploading">
                                        <li id="li-1">
                                            <div id="prev_upfile1" class="uploaded-image" onclick="getFile(1)">
                                                <label id="main-photo">Main Photo</label>
                                                <img src="<@ofbizContentUrl>/shopmax-default/img/product-generic-82x82.jpg</@ofbizContentUrl>">
                                            </div>
                                            <a onclick="getFile(1)">Add Photo</a>
                                            <div style='height: 0px;width:0px; overflow:hidden; border:0;'><input class="file" id="upfile1" type="file" onchange="sub(this,1)" name="uploadedFile1"/></div>
                                        </li>
                                        <li id="li-2">
                                            <div id="prev_upfile2" class="uploaded-image" onclick="getFile(2)">
                                                <label id="main-photo">Main Photo</label>
                                                <img src="<@ofbizContentUrl>/shopmax-default/img/product-generic-82x82.jpg</@ofbizContentUrl>">
                                            </div>
                                            <a onclick="getFile(2)">Add Photo</a>
                                            <div style='height: 0px;width:0px; overflow:hidden; border:0;'><input class="file" id="upfile2" type="file" onchange="sub(this,2)" name="uploadedFile2"/></div>
                                        </li>
                                        <li id="li-3">
                                            <div id="prev_upfile3" class="uploaded-image" onclick="getFile(3)">
                                                <label id="main-photo">Main Photo</label>
                                                <img src="<@ofbizContentUrl>/shopmax-default/img/product-generic-82x82.jpg</@ofbizContentUrl>">
                                            </div>
                                            <a onclick="getFile(3)">Add Photo</a>
                                            <div style='height: 0px;width:0px; overflow:hidden; border:0;'><input class="file" id="upfile3" type="file" onchange="sub(this,3)" name="uploadedFile3"/></div>
                                        </li>
                                        <li id="li-4">
                                            <div id="prev_upfile4" class="uploaded-image" onclick="getFile(4)">
                                                <label id="main-photo">Main Photo</label>
                                                <img src="<@ofbizContentUrl>/shopmax-default/img/product-generic-82x82.jpg</@ofbizContentUrl>">
                                            </div>
                                            <a onclick="getFile(4)">Add Photo</a>
                                            <div style='height: 0px;width:0px; overflow:hidden; border:0;'><input class="file" id="upfile4" type="file" onchange="sub(this,4)" name="uploadedFile4"/></div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="form-inline input-price-stock">
                                <label>
                                    Listing price
                                    <input type="number" class="input-medium" name="listingPrice">
                                </label>
                                <label>
                                    Stock
                                    <input type="number" class="input-medium" name="stock">
                                </label>
                            </div>
                            <!-- Promotion price -->
                            <div class="form-inline input-promotion">
                                <input type="checkbox" id="checkboxUpload">
                                <label>
                                    &nbsp;Promotion price&nbsp;
                                    <input type="number" class="input-mini" name="promoPrice" id="promoPrice">
                                </label>
                                <#-- <label>
                                    &nbsp;&nbsp;Valid from&nbsp;
                                    <input type="number" class="input-small">
                                </label>
                                <img src="<@ofbizContentUrl>/shopmax-default/img/icon-calendar.png</@ofbizContentUrl>" />
                                <label>
                                    &nbsp;&nbsp;To&nbsp;
                                    <input type="number" class="input-small">
                                </label>
                                <img src="<@ofbizContentUrl>/shopmax-default/img/icon-calendar.png</@ofbizContentUrl>" />-->
                                <label>&nbsp;&nbsp;Valid from&nbsp;
                                <input id="datepicker1" type="number" class="input-small"/></label>
                                <img src="<@ofbizContentUrl>/shopmax-default/img/icon-calendar.png</@ofbizContentUrl>" id="datepickerimage1"/>
                                <label>&nbsp;&nbsp;To&nbsp;
                                <input type="number" class="input-small" id="datepicker2" />
                                </label>
                                <img src="<@ofbizContentUrl>/shopmax-default/img/icon-calendar.png</@ofbizContentUrl>" id="datepickerimage2"/>
                                <input type="hidden" name="promoPriceFromDate" id="promoPriceFromDate" value=""/>
                                <input type="hidden" name="promoPriceThruDate" id="promoPriceThruDate" value=""/>
                            </div>  
                            <div class="form-inline">
                                <label>Shipping size</label>
                                <a class="btn-dark-grey-small shippingSize" id="XTRA_SMALL">Xtra Small</a>
                                <a class="btn-dark-grey-small shippingSize" id="SMALL">Small</a>
                                <a class="btn-dark-grey-small shippingSize" id="NORMAL">Normal</a>
                                <a class="btn-dark-grey-small shippingSize" id="LARGE">Large</a>
                                <a class="btn-dark-grey-small shippingSize" id="XTRA_LARGE">Xtra Large</a>
                            </div>
                            <input type="hidden" id="shippingSize" name="shippingSize" value="">
                        </form>
                    </td>
                </tr>
              </tbody>
            </table>
            <table class="table table-condensed sc-table sc-table-promotion">
              <thead>
                <tr class="sc-table-header">
                  <th class="col1 collapsing" id="advanced-option-bar">Advanced Options</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                    <td class="col1 advanced-option product-upload">
                        <div id="advanced-option-detail">
                                <label class="checkbox">
                                    <input type="checkbox"> Always show Advanced Option
                                </label><br />
                                <label>
                                    Brand&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="input-large" />
                                </label>
                                <table class="size-color">
                                    <tr>
                                        <td class="col1">Variations:</td><td class="col2">Size</td><td class="col3">
                                            <ul class="list-size"><li><a href="#">6</a>
                                            </li><li><a href="#">8</a>
                                            </li><li><a href="#">10</a>
                                            </li><li><a href="#">12</a>
                                            </li><li class="selected"><a href="#">14</a>
                                            </li><li><a href="#">16</a>
                                            </li><li><a href="#">18</a>
                                            </li></ul>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="col1">&nbsp;</td><td class="col2">Colour</td>
                                        <td class="col3">
                                        <ul class="list-color">
                                            <li>
                                                <a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/color-black.png</@ofbizContentUrl>"></a>
                                            </li>
                                            <li>
                                                <a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/color-grey.png</@ofbizContentUrl>"></a>
                                            </li>
                                            <li>
                                                <a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/color-white.png</@ofbizContentUrl>"></a>
                                            </li>
                                            <li>
                                                <a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/color-dark-organ.png</@ofbizContentUrl>"></a>
                                            </li>
                                            <li>
                                                <a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/color-red.png</@ofbizContentUrl>"></a>
                                            </li>
                                            <li class="selected">
                                                <a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/color-pink.png</@ofbizContentUrl>"></a>
                                            </li>
                                            <li>
                                                <a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/color-organ.png</@ofbizContentUrl>"></a>
                                            </li>
                                            <li>
                                                <a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/color-yellow.png</@ofbizContentUrl>"></a>
                                            </li>
                                            <li>
                                                <a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/color-green.png</@ofbizContentUrl>"></a>
                                            </li>
                                            <li>
                                                <a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/color-light-blue.png</@ofbizContentUrl>"></a>
                                            </li>
                                            <li>
                                                <a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/color-purple.png</@ofbizContentUrl>"></a>
                                            </li>
                                            <li>
                                                <a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/color-dark-yellow.png</@ofbizContentUrl>"></a>
                                            </li>
                                        </ul>
                                        </td>
                                    </tr>
                                </table>
                        </div>
                    </td>
                </tr>
              </tbody>
            </table>
            <div class="sc-table-promotion footer-button">
                <a href="#" class="btn-green-small" style="width:80px;">Preview</a>&nbsp;&nbsp;
                <a class="btn-general-small" id="submit_uploadProductToSeller">Submit</a>&nbsp;&nbsp;
                <a class="btn-grey-small" href="#">Cancel</a>
            </div>
        </div><!-- /.span9 -->
    </div><!-- /.row -->
</div> <!-- /container -->
