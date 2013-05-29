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
        $('#submit_uploadProductToSeller').click(function(){
            var valid = false;
            if(typeof getUrlVars()["productId"] != "undefined"){
                var isClickActivityOccur = confirm("Do you want to update this product?");
            }
            else{
                $('#uploadProd').find('input.check,textarea.check').each(function(){
                //var isClickActivityOccur = confirm("Do you want to upload new product?");
                    if(!$(this).val().length){
                        $(this).addClass('required');
                        $('.input-error2').removeClass('hidden');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        if(!$('#prev_upfile_1').find('div').hasClass('prev_thumb')){
                            $('#prev_upfile_1').css({'background-color':'#fef2ee'});
                            $('#prev_upfile_1').css({'border-color':'red'});
                        }
                        else if($('#prev_upfile_1').find('div').hasClass('prev_thumb')){
                            $('#prev_upfile_1').css({'background-color':'#EAE8AD'});
                            $('#prev_upfile_1').css({'border-color':'#358bd8'});
                        }
                        if(!$('.selected-products').find('tr').hasClass('')){
                            valid = true;
                        }
                    }
                    else{
                   $(this).removeClass('required');
                        if(!$('.selected-products').find('tr').hasClass('')){
                            $('.input-error2').removeClass('hidden');
                            $('html, body').animate({ scrollTop: 0 }, 0);
                            valid = true;
                        }
                        if(!$('#prev_upfile_1').find('div').hasClass('prev_thumb')){
                            $('.input-error2').removeClass('hidden');
                            $('html, body').animate({ scrollTop: 0 }, 0);
                        }
                        if($('.required').length == 0 && $('#prev_upfile_1').find('div').hasClass('prev_thumb') && $('.selected-products').find('tr').hasClass('')){
                            $('.input-error2').addClass('hidden');
                            $('#uploadAndUpdateProduct').submit();
                        }
                    }
                });
            }
            if(valid){
            alert("Please select your category!");
            }
        });
        $('#advanced-option-bar').click(function(){
            if($('#advanced-option-detail').is(":hidden")){
                $('.col1.advanced-option.product-upload').css({'padding':'30px'});
                $('#advanced-option-detail').slideDown(300);
            }
            else{
                $('#advanced-option-detail').slideUp(300, function() {
                    $('tr').find('.col1.advanced-option.product-upload').css({'padding':'0'});
                });
            }
        });
        $('input.check').focus(function(){
            $('#'+this.id).removeClass('required');
            $('.input-error2').addClass('hidden');
        });
        $('textarea.check').focus(function(){
            $('#'+this.id).removeClass('required');
            $('.input-error2').addClass('hidden');
        });
        $('#prev_upfile_1').click(function(){
            $('#prev_upfile_1').css({'background-color':'#EAE8AD'});
            $('#prev_upfile_1').css({'border-color':'#358bd8'});
            $('.input-error2').addClass('hidden');
        });
        var success_upload = '${parameters.uploadsuccess?if_exists}';
        success_upload = success_upload ? success_upload : false;
        
        var success_update = '${parameters.updatesuccess?if_exists}';
        success_update = success_update ? success_update : false;
        
        if(success_upload){
            alert('Product is uploaded successfully');
            window.location = "<@ofbizUrl>manageproduct</@ofbizUrl>";
        }
        if(success_update){
            alert('Product is updated successfully');
            window.location = "<@ofbizUrl>manageproduct</@ofbizUrl>";
        }
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
        <div class="span9 main-content" id="uploadProd">
            <table class="table table-condensed sc-table sc-table-promotion">
              <thead>
                <tr class="sc-table-header">
                  <th class="col1">Basic Information</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                    <td class="col1 product-upload">
                        <label class="input-error2 hidden">&nbsp;&nbsp;&nbsp;Please fill in all required fields</label>
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
                                    <#if categoryMemberNameList?has_content>
                                        <#list categoryMemberNameList as categoryMember>
                                            <tr id="tr-${categoryMember.productCategoryId?if_exists}">
                                                <td>${categoryMember.categoryName?if_exists}</td>
                                                <td>
                                                    <a id="remove-${categoryMember.productCategoryId?if_exists}" onclick="removeCategory('${categoryMember.productCategoryId?if_exists}')">Remove</a>
                                                </td>
                                            </tr>
                                        </#list>
                                    </#if>
                                </tbody>
                            </table>
                        </div>
                        <form class="form-horizontal pull-left media-edit" action="<#if parameters.productId?has_content>updateProductFullMode<#else>uploadProductToSeller</#if>" id="uploadAndUpdateProduct" name="uploadAndUpdateProduct" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="productId" value="${parameters.productId?if_exists}"/>
                            <input type="hidden" name="listCategory" value="" id="listCategory">
                            <div class="control-group">
                                <label for="inputProductName" class="control-label">Product name</label>
                                <div class="controls">
                                    <input type="text" id="inputProductName" class="input-xlarge check" name="productName" value="${productName?if_exists}">
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="inputDescription" class="control-label">Product description</label>
                                <div class="controls">
                                    <textarea id="prodDescript" class="input-xlarge check" rows="3" name="description">${description?if_exists}</textarea>
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="inputDescription" class="control-label">Picture upload (4 Max)</label>
                                <div class="controls">
                                    <ul class="uploading">
                                        <#if imageSequenceList?has_content>
                                            <#list 1..4 as i>
                                                <#assign check = 1>
                                                <#if productImageList?has_content>
                                                    <#list productImageList as productImage>
                                                        <#if productImage.sequenceNum == i>
                                                            <li>
                                                                <div class="uploaded-image">
                                                                    <img src="<@ofbizContentUrl>${productImage.productImageThumb}</@ofbizContentUrl>" width="82" style="height: 82px;"/>
                                                                </div>
                                                                <a onclick="removeProductImage('${productId?if_exists}','${productImage.contentId?if_exists}','${productImage.fromDate?if_exists}','IMAGE','${i}')">Remove</a>
                                                            </li>
                                                        <#else>
                                                            <#if seqNumNoImage?has_content>
                                                                <#list seqNumNoImage as seqNoImage>
                                                                    <#if seqNoImage == i && check !=0>
                                                                        <li id="li-${i}">
                                                                            <div id="prev_upfile_${i}" class="uploaded-image" onclick="getFile('${i}')">
                                                                            </div>
                                                                            <a onclick="getFile('${i}')">Add Photo</a>
                                                                            <div style='height: 0px;width:0px; overflow:hidden; border:0;'><input class="file" id="upfile_${i}" type="file" onchange="sub(this,'${i}')" name="uploadedFile${i}"/></div>
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
                                                <li id="li-${i}">
                                                    <div id="prev_upfile_${i}" class="uploaded-image" onclick="getFile('${i}')">
                                                    </div>
                                                    <a onclick="getFile('${i}')">Add Photo</a>
                                                    <div style='height: 0px;width:0px; overflow:hidden; border:0;'><input class="file" id="upfile_${i}" type="file" onchange="sub(this,'${i}')" name="uploadedFile${i}"/></div>
                                                </li>
                                            </#list>
                                        </#if>
                                    </ul>
                                </div>
                            </div>
                            <div class="form-inline input-price-stock">
                                <label>
                                    Listing price
                                    <input type="text" id="listingPrice" class="input-medium check input-price" name="listingPrice" value="${defaultPrice?if_exists}" onkeypress='return isNumberKey(event)'>
                                </label>
                                <label>
                                    Stock
                                    <input type="text" class="input-medium" name="stock" value="${stock?if_exists}">
                                </label>
                            </div>
                            <!-- Promotion price -->
                            <div class="form-inline input-promotion">
                                <input type="checkbox" id="checkboxUpload">
                                <label>
                                    &nbsp;Promotion price&nbsp;
                                    <input type="number" class="input-mini input-price" name="promoPrice" id="promoPrice" value="${promoPrice?if_exists}" onkeypress='return isNumberKey(event)'>
                                </label>
                                <label>&nbsp;&nbsp;Valid from&nbsp;
                                <input id="datepicker1" type="text" class="input-small input-date"/></label>
                                <img src="<@ofbizContentUrl>/shopmax-default/img/icon-calendar.png</@ofbizContentUrl>" id="datepickerimage1"/>
                                <label>&nbsp;&nbsp;To&nbsp;
                                <input type="text" class="input-small input-date" id="datepicker2"/>
                                </label>
                                <img src="<@ofbizContentUrl>/shopmax-default/img/icon-calendar.png</@ofbizContentUrl>" id="datepickerimage2"/>
                                <input type="hidden" name="promoPriceFromDate" id="promoPriceFromDate" value="<#if productPricePromo?has_content>${productPricePromo.fromDate?if_exists}</#if>"/>
                                <input type="hidden" name="promoPriceThruDate" id="promoPriceThruDate" value="<#if productPricePromo?has_content>${productPricePromo.thruDate?if_exists}</#if>"/>
                            </div>
                            <script>
                                $(document).ready(function() {
                                    if($('#promoPrice').val()){
                                        document.getElementById("checkboxUpload").checked = true;
                                    }
                                    if($('#promoPriceFromDate').val()){
                                        var getFromDate = $('#promoPriceFromDate').val().split(" ");
                                        var fromDateFormat = getFromDate[0].split("-");
                                        $('#datepicker1').val(fromDateFormat[1]+'/'+fromDateFormat[2]+'/'+fromDateFormat[0]);
                                    }
                                    if($('#promoPriceThruDate').val()){
                                        var getThruDate = $('#promoPriceThruDate').val().split(" ");
                                        var thruDateFormat = getThruDate[0].split("-");
                                        $('#datepicker2').val(thruDateFormat[1]+'/'+thruDateFormat[2]+'/'+thruDateFormat[0]);
                                    }
                                });
                            </script>
                            <div class="form-inline">
                                <label>Shipping size</label>
                                <a class="btn-dark-grey-small shippingSize" id="XTRA_SMALL" <#if shippingSize?if_exists == 'XTRA_SMALL'>style="color: rgb(53, 139, 219);"</#if>>Xtra Small</a>
                                <a class="btn-dark-grey-small shippingSize" id="SMALL" <#if shippingSize?if_exists == 'SMALL'>style="color: rgb(53, 139, 219);"</#if>>Small</a>
                                <a class="btn-dark-grey-small shippingSize" id="NORMAL" <#if shippingSize?if_exists == 'NORMAL'>style="color: rgb(53, 139, 219);"</#if>>Normal</a>
                                <a class="btn-dark-grey-small shippingSize" id="LARGE" <#if shippingSize?if_exists == 'LARGE'>style="color: rgb(53, 139, 219);"</#if>>Large</a>
                                <a class="btn-dark-grey-small shippingSize" id="XTRA_LARGE" <#if shippingSize?if_exists == 'XTRA_LARGE'>style="color: rgb(53, 139, 219);"</#if>>Xtra Large</a>
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
                                SKU&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="input-large" />
                            </label>
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
