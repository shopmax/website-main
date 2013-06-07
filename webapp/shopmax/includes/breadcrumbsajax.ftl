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

<ul class="breadcrum">
    <li><a href="<@ofbizUrl>main</@ofbizUrl>">Home</a></li>
    <#if categoryBreadcrumbList?has_content>
        <#assign size = categoryBreadcrumbList?size-1>
        <#list size..0 as i>
            <#if i == 0>
                <li>${categoryBreadcrumbList[i].categoryName?if_exists}</li>
            <#else>
                <li><a href="#" class="">${categoryBreadcrumbList[i].categoryName?if_exists}</a></li>
            </#if>
        </#list>
    <#else>
        <#if headerItem?has_content>
            <#if breadcrumbTitle?has_content>
                <li>${breadcrumbTitle?if_exists}</li>
            </#if>
        </#if>
    </#if>
</ul>
