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

<#macro nextPrev commonUrl="" ajaxEnabled=true javaScriptEnabled=true paginateStyle="" paginateFirstStyle="" viewIndex=0 highIndex=0 listSize=0 viewSize=1 ajaxFirstUrl="" firstUrl="" paginateFirstLabel="" paginatePreviousStyle="" ajaxPreviousUrl="${viewIndexPrevious}" previousUrl="" paginatePreviousLabel="" pageLabel="" ajaxSelectUrl="" selectUrl="" ajaxSelectSizeUrl="" selectSizeUrl="" commonDisplaying="" paginateNextStyle="" ajaxNextUrl="${viewIndexNext}" nextUrl="" paginateNextLabel="" paginateLastStyle="" ajaxLastUrl="" lastUrl="" paginateLastLabel="" paginateViewSizeLabel="" >
    <#local javaScriptEnabled = javaScriptEnabled />
    <#if (!javaScriptEnabled)>
        <#local javaScriptEnabled = Static["org.ofbiz.base.util.UtilHttp"].isJavaScriptEnabled(request) />
    </#if>
    <@renderNextPrev paginateStyle paginateFirstStyle viewIndex highIndex listSize viewSize ajaxEnabled javaScriptEnabled ajaxFirstUrl firstUrl uiLabelMap.CommonFirst paginatePreviousStyle ajaxPreviousUrl previousUrl uiLabelMap.CommonPrevious uiLabelMap.CommonPage ajaxSelectUrl selectUrl ajaxSelectSizeUrl selectSizeUrl commonDisplaying paginateNextStyle ajaxNextUrl nextUrl uiLabelMap.CommonNext paginateLastStyle ajaxLastUrl lastUrl uiLabelMap.CommonLast uiLabelMap.CommonItemsPerPage/>
</#macro>

<#macro renderNextPrev paginateStyle paginateFirstStyle viewIndex highIndex listSize viewSize ajaxEnabled javaScriptEnabled ajaxFirstUrl firstUrl paginateFirstLabel paginatePreviousStyle ajaxPreviousUrl previousUrl paginatePreviousLabel pageLabel ajaxSelectUrl selectUrl ajaxSelectSizeUrl selectSizeUrl commonDisplaying paginateNextStyle ajaxNextUrl nextUrl paginateNextLabel paginateLastStyle ajaxLastUrl lastUrl paginateLastLabel paginateViewSizeLabel>
    <#if listSize gt viewSize>
        <#if viewIndex gt 0>
            <ul><li><a href="<#if ajaxEnabled>javascript:paginationPage('${viewIndexPrevious}')<#else>${previousUrl}</#if>"><img src="<@ofbizContentUrl>/shopmax-default/img/arrow-prev-blue.png</@ofbizContentUrl>" /></a></li>
        <#else>
            <ul><li><a><img src="<@ofbizContentUrl>/shopmax-default/img/arrow-prev-grey.png</@ofbizContentUrl>" /></a></li>
        </#if>
        <#list 0..viewIndexLast as i>
            <li><a href="<#if ajaxEnabled>javascript:paginationPage('${i}')<#else>${nextUrl}</#if>" <#if i == viewIndex>style="color:#0E428A;"</#if>>${i+1}</a></li>
        </#list>
        <#if highIndex lt listSize>
            <li><a href="<#if ajaxEnabled>javascript:paginationPage('${viewIndexNext}')<#else>${nextUrl}</#if>"><img src="<@ofbizContentUrl>/shopmax-default/img/arrow-next-blue.png</@ofbizContentUrl>" /></a></li></ul>
        <#else>
            <li><a><img src="<@ofbizContentUrl>/shopmax-default/img/arrow-next-grey.png</@ofbizContentUrl>" /></a></li></ul>
        </#if>
    </#if>
</#macro>
