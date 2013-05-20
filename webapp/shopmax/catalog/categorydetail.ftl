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

<#include "component://shopmax/webapp/shopmax/catalog/categorypaginate.ftl" />

<div class="cat_viewing">
    <#if productCategoryMembers?has_content>
        <#list productCategoryMembers as productCategoryMember>
            ${setRequestAttribute("optProductId", productCategoryMember.productId)}
            ${setRequestAttribute("productCategoryMember", productCategoryMember)}
            ${setRequestAttribute("listIndex", productCategoryMember_index)}
            ${screens.render("component://shopmax/widget/CatalogScreens.xml#ProductSummary")}
        </#list>
    <#else>
        <div>${uiLabelMap.ProductNoProductsInThisCategory}</div>
    </#if>
</div>

<#include "component://shopmax/webapp/shopmax/catalog/categorypaginate.ftl" />
