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
    <!-- include breadcrum -->
    <#include "component://shopmax/webapp/shopmax/includes/breadcrum.ftl" />
    
    <div class="row content-left">
        <!-- include shop header -->
        <#include "component://shopmax/webapp/shopmax/shop/shopheader.ftl" />
    </div>
    
    <!-- include shop product detail -->
    <#if productDetailType?has_content>
        <#if productDetailType?if_exists == "shopgroupbang">
            <#include "component://shopmax/webapp/shopmax/shop/shopgroupbang.ftl" />
        <#elseif productDetailType?if_exists == "shopmultibuy">
            <#include "component://shopmax/webapp/shopmax/shop/shopmultibuy.ftl" />
        <#elseif productDetailType?if_exists == "shopnormal">
            <#include "component://shopmax/webapp/shopmax/shop/shopnormal.ftl" />
        <#elseif productDetailType?if_exists == "shoprushhour">
            <#include "component://shopmax/webapp/shopmax/shop/shoprushhour.ftl" />
        </#if>
    </#if>
    
    <!-- include product description -->
    <#include "component://shopmax/webapp/shopmax/shop/productdescription.ftl" />
    
    <!-- include product related -->
    <#include "component://shopmax/webapp/shopmax/shop/productrelated.ftl" />
    
    <!-- include product description -->
    <#include "component://shopmax/webapp/shopmax/shop/productpopular.ftl" />
</div>
