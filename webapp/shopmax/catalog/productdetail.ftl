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

<#-- variable setup -->
<#assign price = priceMap?if_exists />
<#-- end variable setup -->

<div class="container content">
    <!-- include breadcrum -->
    <#include "component://shopmax/webapp/shopmax/includes/breadcrum.ftl" />
    
    <div class="row content-left">
        <!-- include shop header -->
        <#include "component://shopmax/webapp/shopmax/shop/shopheader.ftl" />
    </div>
    
    <!-- include shop product detail -->
    <#if productDetailType?has_content>
        <#if productDetailType?if_exists == "productgroupbang">
            <#include "component://shopmax/webapp/shopmax/catalog/productgroupbang.ftl" />
        <#elseif productDetailType?if_exists == "productmultibuy">
            <#include "component://shopmax/webapp/shopmax/catalog/productmultibuy.ftl" />
        <#elseif productDetailType?if_exists == "productnormal">
            <#include "component://shopmax/webapp/shopmax/catalog/productnormal.ftl" />
        <#elseif productDetailType?if_exists == "productrushhour">
            <#include "component://shopmax/webapp/shopmax/catalog/productrushhour.ftl" />
        </#if>
    </#if>
    
    <!-- include product description -->
    <#include "component://shopmax/webapp/shopmax/catalog/productdescription.ftl" />
    
    <!-- include product related -->
    <#include "component://shopmax/webapp/shopmax/catalog/productrelated.ftl" />
    
    <!-- include product description -->
    <#include "component://shopmax/webapp/shopmax/catalog/productpopular.ftl" />
</div>
