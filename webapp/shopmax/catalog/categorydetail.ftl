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
        $(".main-content").load(pathName + "?productCategoryId=" + productCategoryId + "&VIEW_INDEX=" + index);
    }
    $(function(){
        $('.span2').change(function(){
            window.location='<@ofbizUrl><#if headerItem?if_exists == "categorygridview">categorygridview?productCategoryId=${productCategoryId}<#elseif headerItem?if_exists == "categorylistview">categorylistview?productCategoryId=${productCategoryId}<#elseif headerItem?if_exists == "shopcategorylistview">shopcategorylistview?productCategoryId=${productCategoryId}<#else>shopcategorygridview?productCategoryId=${productCategoryId}</#if></@ofbizUrl>'+'&sortBy='+this.options[ this.selectedIndex ].value;
        });
    });
</script>

<div class="add-product topviewbox clearfix">
    <span class="tital">SORT BY</span>
    <select class="span2">
        <option value="">Sort By</option>
        <option value="price" <#if parameters.sortBy?if_exists == "price">selected="selected"</#if>>Price</option>
        <option value="name" <#if parameters.sortBy?if_exists == "name">selected="selected"</#if>>Name</option>
        <option value="stock" <#if parameters.sortBy?if_exists == "stock">selected="selected"</#if>>Stock</option>
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

<#if productCategoryMembers?has_content>
    <div class="cat_viewing">
    <#list productCategoryMembers as productCategoryMember>
        ${setRequestAttribute("optProductId", productCategoryMember.productId)}
        ${setRequestAttribute("productCategoryMember", productCategoryMember)}
        ${setRequestAttribute("listIndex", productCategoryMember_index)}
        ${screens.render("component://shopmax/widget/CatalogScreens.xml#ProductSummary")}
        <#if productCategoryMember_index%4 == 3 && productCategoryMember_index != 0>
            </div>
            <div class="cat_viewing">
        <#elseif productCategoryMember_index == productCategoryMembers?size-1>
            </div>
        </#if>
    </#list>
<#else>
    <div>${uiLabelMap.ProductNoProductsInThisCategory}</div>
</#if>

<div class="add-product topviewbox clearfix">
    <span class="tital">SORT BY</span>
    <select class="span2">
        <option value="" selected="selected">Sort By</option> 
        <option value="price" <#if parameters.sortBy?if_exists == "price">selected="selected"</#if>>Price</option>
        <option value="name" <#if parameters.sortBy?if_exists == "name">selected="selected"</#if>>Name</option>
        <option value="stock" <#if parameters.sortBy?if_exists == "stock">selected="selected"</#if>>Stock</option>
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
