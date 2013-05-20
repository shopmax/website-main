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
    $('#scPromo').change(function(){
        if($('.sub-promotion').is(':visible')){
            $('.sub-promotion').addClass('hidden');
        }
        var currentPromotion = $('#scPromo').val();
        $('#'+currentPromotion+'-div').removeClass('hidden');
    });
});
</script>

<div class="container content promotion">
    <!-- include breadcrumb -->
    ${screens.render("component://shopmax/widget/ShopMaxScreens.xml#Breadcrumbs")}
    <div class="row content-left">
    <!-- MAIN CONTENT -->
        <div class="span9 main-content">
            <div class="my_acc">
                <div class="title_grn"><h6>Create shopmax promotion</h6></div>
                <div class="block">
                    <form class="form-horizontal">
                        <div class="control-group">
                            <label class="control-label">Create promo type</label>
                            <div class="controls">
                                <div class="selebox">
                                    <select name="scPromo" class="drop-select chosen combo" id="scPromo" data-search-bar="true">
                                        <option value="free-shipping" selected="selected" id="free-shipping">Free Shipping</option>
                                        <option value="group-bang" id="group-bang">Group Bang</option>
                                        <option value="in-store-voucher" id="in-store-voucher">In Store Voucher</option>
                                        <option value="multi-buy" id="multi-buy">Multiple Buy</option>
                                        <option value="rush-hour" id="rush-hour">Rush Hour</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Promotion name</label>
                            <div class="controls">
                                <input type="text" class="span4">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Promotion description</label>
                            <div class="controls">
                                <textarea cols="" rows="3" class="span4"></textarea>
                            </div>
                        </div>
                    </form>
                </div>
                
                <#-- Free Shipping -->
                <div class="sub-promotion" id="free-shipping-div">
                    <div class="title_grn"><h6>Free Shipping</h6></div>
                    <table class="table table-condensed sc-table sc-table-promotion">
                      <tbody>
                        <tr class="sc-table-body">
                            <td class="col1">
                                <div class="form-inline">
                                    <label class="radio">
                                        <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>
                                        Order value is greater than
                                    </label>&nbsp;&nbsp;&nbsp;<strong>$</strong>&nbsp;&nbsp;<input type="text" class="input-small"/><div class="sc-or"><strong>OR</strong></div>
                                    <label class="radio">
                                        <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
                                        Buy at least
                                    </label>&nbsp;&nbsp;<input type="text" class="input-mini"/>&nbsp;&nbsp;(Quantity) of&nbsp;&nbsp;
                                    <input type="text" class="input-xxlarge" style="width:283px;" placeholder="Select your product or category">
                                    <a class="btn-general-small" href="#">Browse</a>
                                </div>
                                
                                <table class="selected-products">
                                    <tr><td class="col1">Electronics > Mobiles > Smartphones</td><td class="col2"><a href="#">Remove</a></td></tr>
                                    <tr><td class="col1">Electronics > Mobiles > Smartphones</td><td class="col2"><a href="#">Remove</a></td></tr>      
                                </table>
                                
                                <div class="form-inline">
                                    <br />
                                    <label>
                                        Start date&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="text" class="input-small" />
                                    </label>
                                    <img src="<@ofbizContentUrl>/shopmax-default/img/icon-calendar.png</@ofbizContentUrl>" />
                                    <label class="offset1">
                                        End date&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="text" class="input-small" />
                                    </label>
                                    <img src="<@ofbizContentUrl>/shopmax-default/img/icon-calendar.png</@ofbizContentUrl>" /> 
                                </div>
                            </td>
                        </tr>
                      </tbody>
                    </table>
                </div>
                
                <#-- Group Bang -->
                <div class="sub-promotion hidden" id="group-bang-div">
                    <div class="title_grn"><h6>Group bang</h6></div>
                    <div class="block">
                        <form class="form-horizontal">
                            <div class="control-group">
                                <label class="control-label">Select your product</label>
                                <div class="controls">
                                    <input type="text" class="span4">
                                    <input type="button" class="btn-general" value="BROWSE" style="margin-left:10px; border:none;">
                                </div>
                            </div>
                            <div class="addedlist">
                                <ul>
                                    <li><a href="#">Remove</a>Electronics > Mobiles > Smart phones</li>
                                    <li><a href="#">Remove</a>Sony Bravia 32” TV</li>
                                </ul>
                            </div>
                            <div class="control-group">
                                <label class="control-label">Total available quantity</label>
                                <div class="controls">
                                    <input type="text" class="span3">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">Starting price</label>
                                <div class="controls">
                                    <input type="text" class="span2">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">Price @ 10% stocks sold</label>
                                <div class="controls">
                                    <input type="text" class="span2">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">Price @ 30% stocks sold</label>
                                <div class="controls">
                                    <input type="text" class="span2">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">Price @ 50% stocks sold</label>
                                <div class="controls">
                                    <input type="text" class="span2">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">Price @ 70% stocks sold</label>
                                <div class="controls">
                                    <input type="text" class="span2">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">Price @ 90% stocks sold</label>
                                <div class="controls">
                                    <input type="text" class="span2">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">Ending price</label>
                                <div class="controls">
                                    <input type="text" class="span2">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">Intended promotion day</label>
                                <div class="controls">
                                    <input type="text" class="span2"><img src="<@ofbizContentUrl>/shopmax-default/img/icon-calendar.png</@ofbizContentUrl>" alt="" style="margin:5px 0 0 10px;">
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                
                <#-- In Store Voucher -->
                <div class="sub-promotion hidden" id="in-store-voucher-div">
                    <div class="title_grn"><h6>In store voucher</h6></div>
                    <div class="block">
                        <ul class="storevouc">
                            <li>
                                <span class="heading">If order value is greater than</span>
                                <span class="doller">$</span>
                                <input type="text" class="span1">
                                <span class="heading">Than grant</span>
                                <span class="doller">$</span>
                                <input type="text" class="span1">
                                <span class="heading">voucher</span>
                            </li>
                            <li>
                                <span class="heading widthfix_1">Start date:</span>
                                <input type="text" class="span1">
                                <img src="<@ofbizContentUrl>/shopmax-default/img/icon-calendar.png</@ofbizContentUrl>" alt="" style="float:left; margin:5px 0 0 5px;">
                                <span class="heading widthfix_2">End date:</span>
                                <input type="text" class="span1">
                                <img src="<@ofbizContentUrl>/shopmax-default/img/icon-calendar.png</@ofbizContentUrl>" alt="" style="float:left; margin:5px 0 0 5px;">
                            </li>
                            <li>
                                <span class="heading widthfix_1">Voucher expiry date:</span>
                                <input type="text" class="span1">
                                <img src="<@ofbizContentUrl>/shopmax-default/img/icon-calendar.png</@ofbizContentUrl>" alt="" style="float:left; margin:5px 0 0 5px;">
                            </li>
                            <li>
                                <div class="note">Note: Voucher code will be automatically emailed to the purchaser’s email address. Voucher can only be redeemed online, and can only be used once. Different voucher can not be used in conjunction.</div>
                            </li>
                        </ul>
                    </div>
                </div>
                
                <#-- Multiple Buy -->
                <div class="sub-promotion hidden" id="multi-buy-div">
                    <div class="title_grn"><h6>Multiple Buy</h6></div>
                    <div class="block">
                        <ul class="storevouc">
                            <li>
                                <span class="heading">Buy any</span>
                                <input type="text" class="span1">
                                <span class="heading">(Quantity) of</span>
                                <input type="text" class="span3">
                                <a href="#" class="btn-general">Browse</a>
                            </li>
                            <li>
                                <div class="addedlist">
                                    <ul>
                                        <li><a href="#">Remove</a>Electronics &gt; Mobiles &gt; Smart phones</li>
                                        <li><a href="#">Remove</a>Sony Bravia 32” TV</li>
                                    </ul>
                                </div>
                            </li>
                            <li>
                                <span class="heading">Buy any</span>
                                <input type="text" class="span1">
                                <span class="heading">(Quantity) of</span>
                                <input type="text" class="span3">
                                <a href="#" class="btn-general">Browse</a>
                            </li>
                            <li>
                                <div class="addedlist">
                                    <ul>
                                        <li><a href="#">Remove</a>Electronics &gt; Mobiles &gt; Smart phones</li>
                                        <li><a href="#">Remove</a>Sony Bravia 32” TV</li>
                                    </ul>
                                </div>
                            </li>
                            <li>
                                <span class="heading">For</span>
                                <span class="doller">$</span>
                                <input type="text" class="span2">
                            </li>
                            <li>
                                <input type="checkbox" class="checkbox">
                                <span class="heading">Limit per order</span>
                                <input type="text" class="span1">
                            </li>
                            <li>
                                <div class="blk_1">
                                    <input type="radio" class="checkbox">
                                    <span class="heading">Create in-store promotion</span>
                                </div>
                                <div class="blk_1">
                                    <input type="radio" class="checkbox">
                                    <span class="heading">Upgrade to homepage channel promotion</span>
                                </div>
                            </li>
                            <li>
                                <div class="blk_1">
                                    <span class="heading">Start date</span>
                                    <input type="text" class="span1">
                                    <img style="margin:5px 0 0 10px;" alt="" src="<@ofbizContentUrl>/shopmax-default/img/icon-calendar.png</@ofbizContentUrl>">
                                </div>
                                <div class="blk_1">
                                    <span class="lightext">Please note participating product commision fee will change to 15%</span>
                                </div>
                            </li>
                            <li>
                                <div class="blk_1">
                                    <span class="heading">End date</span>
                                    <input type="text" class="span1">
                                    <img style="margin:5px 0 0 10px;" alt="" src="<@ofbizContentUrl>/shopmax-default/img/icon-calendar.png</@ofbizContentUrl>">
                                </div>
                                <div class="blk_1">
                                    <span class="heading">Intended promotion day</span>
                                    <input type="text" class="span1">
                                    <img style="margin:5px 0 0 10px;" alt="" src="<@ofbizContentUrl>/shopmax-default/img/icon-calendar.png</@ofbizContentUrl>">
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                
                <#-- Rush Hour -->
                <div class="sub-promotion hidden" id="rush-hour-div">
                    <div class="title_grn"><h6>Rush Hour</h6></div>
                    <div class="block">
                        <ul class="storevouc">
                            <li>
                                <div class="blk_1">
                                    <input type="radio" class="checkbox">
                                    <span class="heading">Limited time $1 auction</span>
                                </div>
                                <div class="blk_1">
                                    <input type="radio" class="checkbox">
                                    <span class="heading">Limited time big discount</span>
                                </div>
                            </li>
                            <li>
                                <input type="radio" class="checkbox">
                                <span class="heading">Select your product</span>
                                <input type="text" class="span4" placeholder="Select your product or category">
                                <a href="#" class="btn-general">Browse</a>
                            </li>
                            <li>
                                <div class="addedlist">
                                    <ul>
                                        <li><a href="#">Remove</a>Electronics &gt; Mobiles &gt; Smart phones</li>
                                        <li><a href="#">Remove</a>Sony Bravia 32” TV</li>
                                    </ul>
                                </div>
                            </li>
                            <li><span class="doller">OR</span></li>
                            <li>
                                <input type="radio" class="checkbox">
                                <span class="heading">Select your product</span>
                                <input type="text" class="span4" placeholder="Select your product or category">
                                <a href="#" class="btn-general">Browse</a>
                            </li>
                            <li>
                                <div class="addedlist">
                                    <ul>
                                        <li><a href="#">Remove</a>Electronics &gt; Mobiles &gt; Smart phones</li>
                                        <li><a href="#">Remove</a>Sony Bravia 32” TV</li>
                                    </ul>
                                </div>
                            </li>
                            <li>
                                <span class="heading">Discount percentage</span>
                                <input type="text" class="span2">
                                <span class="doller">%</span>
                                <span class="heading">(Minimum 50%)</span>
                            </li>
                            <li>
                                <input type="checkbox" class="checkbox">
                                <span class="heading">Limit per order</span>
                                <input type="text" class="span1">
                            </li>
                            <li>
                                <span class="heading">Total supply quantity</span>
                                <input type="text" class="span1">
                            </li>
                            <li>
                                <span class="heading">Intended promotion day</span>
                                <input type="text" class="span1">
                                <img style="margin:5px 0 0 10px;" alt="" src="<@ofbizContentUrl>/shopmax-default/img/icon-calendar.png</@ofbizContentUrl>">
                            </li>
                        </ul>
                    </div>
                </div>
                
                <div class="buttonbox_last clearfix">
                    <a href="#" class="btn-general">SUBMIT</a>
                    <a href="#" class="btn-grey">CANCEL</a>
                </div>
            </div>
        </div><!-- /.span9 -->
        <#include "component://shopmax/webapp/shopmax/promotion/promotionright.ftl" />
    </div><!-- /.row -->
</div> <!-- /container -->
