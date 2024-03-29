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
    
    <div class="row">
    <!-- MAIN CONTENT -->
        <!-- sliderdiv -->
        <div class="span9 main-content manage-product cat_grid_view">
            <div class="serbox clearfix">
                <p><strong>Your current location is “30 Queen st, Auckland, cbd, 1001”</strong></p>
                <div class="leftside">
                    <input type="text" class="span3">
                    <input type="submit" value="apply" class="btn-general">
                    <span class="pull-right">About 6,970 results</span>
                </div>
            </div>
            <#--<#include "component://shopmax/webapp/shopmax/catalog/categorydetail.ftl" />-->
        </div><!-- /.span9 -->
        <div class="span3 sidebar" id="side-menu">
            <#include "component://shopmax/webapp/shopmax/catalog/categorylist.ftl" />
            <#include "component://shopmax/webapp/shopmax/catalog/categoryrefineby.ftl" />
        </div><!-- /.span3.sidebar -->
    </div><!-- /.row -->
</div> <!-- /container -->
