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
    function getUrlVars() {
        var vars = {};
        var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) {
            vars[key] = value;
        });
        return vars;
    }
    
    function paginationPage(index){
        var productCategoryId = getUrlVars()["productCategoryId"];
        var currentPathName = (window.location.pathname).split(';');
        var currentPath = currentPathName[0].split('/');
        var pathName = "";
        if(currentPath.length == 4){
            pathName = currentPath[3];
        }
        else{
            pathName = currentPath[2];
        }
        pathName = pathName+"detail";
        $("#category-container").load(pathName + "?productCategoryId=" + productCategoryId + "&VIEW_INDEX=" + index);
    }
</script>

<div class="add-product topviewbox clearfix">
    <span class="tital">SORT BY</span>
    <select class="span2">
        <option value="" selected="selected">Price</option>
        <option value="1">Name</option>
        <option value="2">Stock</option>
    </select>
    <span class="tital">VIEW BY</span>
    <a href="<@ofbizUrl><#if headerItem?if_exists == "categorygridview" || headerItem?if_exists == "categorylistview">categorygridview?productCategoryId=${productCategoryId}<#else>shopcategorygridview?productCategoryId=${productCategoryId}</#if></@ofbizUrl>" class="grid_view"><span class="b"></span>Grid</a>
    <a href="<@ofbizUrl><#if headerItem?if_exists == "categorygridview" || headerItem?if_exists == "categorylistview">categorylistview?productCategoryId=${productCategoryId}<#else>shopcategorylistview?productCategoryId=${productCategoryId}</#if></@ofbizUrl>" class="list_view"><span class="b"></span>List</a>
    <div class="paging">
        <#include "component://shopmax/webapp/shopmax/catalog/categorypaginate.ftl" />
        <#assign viewIndexFirst = 0/>
        <#assign viewIndexPrevious = viewIndex - 1/>
        <#assign viewIndexNext = viewIndex + 1/>
        <#assign viewIndexLast = Static["java.lang.Math"].floor(listSize/viewSize)/>
        <#assign viewIndexLastIndex = viewIndexLast-1/>
        <#assign messageMap = Static["org.ofbiz.base.util.UtilMisc"].toMap("lowCount", lowIndex, "highCount", highIndex, "total", listSize)/>
        <#assign commonDisplaying = Static["org.ofbiz.base.util.UtilProperties"].getMessage("CommonUiLabels", "CommonDisplaying", messageMap, locale)/>
        <@nextPrev commonUrl=false ajaxEnabled=true javaScriptEnabled=true paginateStyle="" paginateFirstStyle="" viewIndex=viewIndex highIndex=highIndex listSize=listSize viewSize=viewSize ajaxFirstUrl="" firstUrl="" paginateFirstLabel="" paginatePreviousStyle="" ajaxPreviousUrl="" previousUrl="" paginatePreviousLabel="" pageLabel="" ajaxSelectUrl="" selectUrl="" ajaxSelectSizeUrl="" selectSizeUrl="" commonDisplaying=commonDisplaying paginateNextStyle="" ajaxNextUrl="${viewIndexNext}" nextUrl="" paginateNextLabel="" paginateLastStyle="" ajaxLastUrl="" lastUrl="" paginateLastLabel="" paginateViewSizeLabel="" />
    </div>
</div>

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

<div class="add-product topviewbox clearfix">
    <span class="tital">SORT BY</span>
    <select class="span2">
        <option value="" selected="selected">Price</option>
        <option value="1">Name</option>
        <option value="2">Stock</option>
    </select>
    <span class="tital">VIEW BY</span>
    <a href="<@ofbizUrl><#if headerItem?if_exists == "categorygridview" || headerItem?if_exists == "categorylistview">categorygridview?productCategoryId=${productCategoryId}<#else>shopcategorygridview?productCategoryId=${productCategoryId}</#if></@ofbizUrl>" class="grid_view"><span class="b"></span>Grid</a>
    <a href="<@ofbizUrl><#if headerItem?if_exists == "categorygridview" || headerItem?if_exists == "categorylistview">categorylistview?productCategoryId=${productCategoryId}<#else>shopcategorylistview?productCategoryId=${productCategoryId}</#if></@ofbizUrl>" class="list_view"><span class="b"></span>List</a>
    <div class="paging">
        <#include "component://shopmax/webapp/shopmax/catalog/categorypaginate.ftl" />
        <#assign viewIndexFirst = 0/>
        <#assign viewIndexPrevious = viewIndex - 1/>
        <#assign viewIndexNext = viewIndex + 1/>
        <#assign viewIndexLast = Static["java.lang.Math"].floor(listSize/viewSize)/>
        <#assign viewIndexLastIndex = viewIndexLast-1/>
        <#assign messageMap = Static["org.ofbiz.base.util.UtilMisc"].toMap("lowCount", lowIndex, "highCount", highIndex, "total", listSize)/>
        <#assign commonDisplaying = Static["org.ofbiz.base.util.UtilProperties"].getMessage("CommonUiLabels", "CommonDisplaying", messageMap, locale)/>
        <@nextPrev commonUrl=false ajaxEnabled=true javaScriptEnabled=true paginateStyle="" paginateFirstStyle="" viewIndex=viewIndex highIndex=highIndex listSize=listSize viewSize=viewSize ajaxFirstUrl="" firstUrl="" paginateFirstLabel="" paginatePreviousStyle="" ajaxPreviousUrl="" previousUrl="" paginatePreviousLabel="" pageLabel="" ajaxSelectUrl="" selectUrl="" ajaxSelectSizeUrl="" selectSizeUrl="" commonDisplaying=commonDisplaying paginateNextStyle="" ajaxNextUrl="${viewIndexNext}" nextUrl="" paginateNextLabel="" paginateLastStyle="" ajaxLastUrl="" lastUrl="" paginateLastLabel="" paginateViewSizeLabel="" />
    </div>
</div>
