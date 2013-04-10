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
        $('.cancel').click(function(){
            window.location.href = '<@ofbizUrl>onlinemarketing</@ofbizUrl>';
        });
    });
</script>

<div class="container content">
    <#include "component://shopmax/webapp/shopmax/includes/breadcrum.ftl" />
    <div class="row content-left">
        <!-- MAIN CONTENT -->
        <div class="span9 main-content">
            <div class="online_marketing clearfix">
                <div class="title_grn"><h6>Set your keyword</h6></div>
                <div class="block clearfix">
                    <div class="note clearfix">
                        <p>Note: This feature allows you to display your product on the top of the search result when customer searches a product that matches the keywords you set. (Sample text, to be changed later)</p>
                    </div>
                    <div class="search clearfix">
                        <span class="span-1">Keywords <strong>(Separated by comma)</strong></span>
                        <input type="text" class="textbox">
                    </div>
                </div>
                <div class="title_grn"><h6>Tender options</h6></div>
                <div class="block clearfix">
                    <div class="box clearfix">
                        <ul>
                            <li>
                                <span class="span-1">Cost per view <strong>(minimum $0.01)</strong></span>
                                <input type="text" class="input-1">
                            </li>
                            <li><span class="span-2">OR</span></li>
                            <li>
                                <input type="checkbox" class="checkbox">
                                <p>Automatically help me out bid my competitor by 1 cent.</p>
                            </li>
                            <li>
                                <span class="span-3">Total budget</span>
                                <label class="label-1">&#36;</label>
                                <input type="text" class="input-2">
                                <strong>(Can't be changed after creation)</strong>
                            </li>
                            <li>
                                <span class="span-3">Remaining budget</span>
                                <label class="label-1">&#36;</label>
                                <input type="text" placeholder="100" class="input-2">
                            </li>
                        </ul>
                    </div>
                    <div class="note clearfix">
                        <p>Note: Your campaign will keep running until your budget runs out, you can change your keywords and cost per view at any time. We will notify you when your budget is run out.</p>
                    </div>
                </div>
                <div class="opt_buttons">
                    <input type="submit" name="" value="CANCEL" class="cancel">
                    <input type="submit" name="" value="SUBMIT" class="submit">
                </div>
            </div>
        </div><!-- /.span9 -->
        
        <!-- sidebar -->
        <div class="span3 sidebar">
            <div class="title"><h6>Tips</h6></div>
            <div class="tips_block">
                <div class="box">
                    <p>Indicative price for these<br>keywords from others</p>
                </div>
                <span class="span-1">&#36;0.30</span>
            </div>
        </div><!-- /.span3.sidebar -->
    </div><!-- /.row -->
</div> <!-- /container -->
