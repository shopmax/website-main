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
    <!-- include breadcrumb -->
    ${screens.render("component://shopmax/widget/ShopMaxScreens.xml#Breadcrumbs")}
    
    <div class="row content-left">
        <!-- include shop header -->
        <#include "component://shopmax/webapp/shopmax/shop/shopheader.ftl" />
    </div>
    <div class="abt_block1">
        <h4>About our business</h4>
        <p>Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Donec ullamcorper nulla non metus auctor fringilla. Vivamus sagittis lacus vel augue laoreet.Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Donec ullamcorper nulla non metus auctor fringilla. Vivamus sagittis lacus vel augue laoreet.Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Donec ullamcorper nulla non metus auctor fringilla. Vivamus sagittis lacus vel augue laoreet.Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Donec ullamcorper nulla non metus auctor fringilla. Vivamus sagittis lacus vel augue laoreet.Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Donec ullamcorper nulla non metus auctor fringilla. Vivamus sagittis lacus vel augue laoreet.Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Donec ullamcorper nulla non metus auctor fringilla. Vivamus sagittis lacus vel augue laoreet.Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Donec ullamcorper nulla non metus auctor fringilla. Vivamus sagittis lacus vel augue laoreet.</p>
    </div>
    <div class="cont_block">
        <div class="title"><h6>Contact Infomation</h6></div>
        <div class="block">
            <div class="block-1">
                <select class="select-1"><option>Select a branch</option></select>
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
            <div class="map-box"><img src="<@ofbizContentUrl>shopmax-default/img/map_img2.jpg</@ofbizContentUrl>" alt=""></div>
        </div>
    </div>
    
    <div class="store_photos clearfix">
        <div class="caption"><h6>Store Photos</h6></div>
        <div class="block clearfix">
            <ul>
                <li><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/pro-abt_img1.jpg</@ofbizContentUrl>" alt=""></a></li>
                <li><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/pro-abt_img2.jpg</@ofbizContentUrl>" alt=""></a></li>
                <li><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/pro-abt_img1.jpg</@ofbizContentUrl>" alt=""></a></li>
                <li><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/pro-abt_img2.jpg</@ofbizContentUrl>" alt=""></a></li>
                <li><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/pro-abt_img2.jpg</@ofbizContentUrl>" alt=""></a></li>
            </ul>
            <a href="#" class="left"><img src="<@ofbizContentUrl>/shopmax-default/img/arrow-prev-black.png</@ofbizContentUrl>" alt=""></a>
            <a href="#" class="right"><img src="<@ofbizContentUrl>/shopmax-default/img/arrow-next-black.png</@ofbizContentUrl>" alt=""></a>
        </div>
    </div>
    
    <div class="store_videos clearfix">
        <div class="caption"><h6>Store Videos</h6></div>
        <div class="block"><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/vid-img.jpg</@ofbizContentUrl>" alt=""></a></div>
    </div>
    <!-- /.row -->
</div> <!-- /container -->
