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

<div class="imperial_champ">
    <div class="span12">
        <div class="block_1"><img alt="" src="<@ofbizContentUrl>/shopmax-default/img/logo_imp.png</@ofbizContentUrl>"></div>
        <div class="block_2">
            <h6>Imperial Camp</h6>
            <p>Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Donec ullamcorper nulla non metus auctor fringilla. Vivamus sagittis lacus vel augue laoreet.</p>
        </div>
        <div class="white_nav">
            <ul>
                <li><a class="active" href="<@ofbizUrl>shophomepage</@ofbizUrl>">Shop Home</a></li>
                <li><a href="#">Promotions</a></li>
                <li><a href="#">Vouchers</a></li>
                <li><a href="#">About Us</a></li>
                <li><a href="#">Comments</a></li>
                <li><a href="#">Discussions</a></li>
            </ul>
        </div>
        
        <#if headerItem?has_content>
            <#if headerItem?if_exists == "shophome">
                <div class="banner_box">
                    <img alt="" src="<@ofbizContentUrl>/shopmax-default/img/banner_img.jpg</@ofbizContentUrl>">
                    <div class="caption"><p>10% off everything &ndash; ends soon!</p></div>
                </div>
            </#if>
        </#if>
    </div>
</div>
