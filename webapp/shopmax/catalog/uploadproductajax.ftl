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
<script src="<@ofbizContentUrl>/shopmax-default/js/uploadproduct.js</@ofbizContentUrl>" type="text/javascript"></script>
<div class="controls controls-row select-category pull-left">
    <div class="span3">
        <select size=9 id="category_1">
            <#if categoryList?has_content>
                <#list categoryList as category>
                    <#assign productCatelogId = category.productCategoryId/>
                    <option value="${productCatelogId}" id="${productCatelogId}" class="category_1" <#if parameters.categoryFirstId?has_content><#if parameters.categoryFirstId == productCatelogId>selected="selected"</#if></#if>>${category.categoryName?if_exists}</option>
                </#list>
            </#if>
        </select>
    </div>
    <div class="span3">
        <select size=9 id="category_2">
            <#if categorySecondList?has_content>
                <#list categorySecondList as category>
                    <#assign productCatelogId = category.productCategoryId/>
                    <option value="${productCatelogId}" id="${productCatelogId}" class="category_2" <#if parameters.categorySecondId?has_content><#if parameters.categorySecondId == productCatelogId>selected="selected"</#if></#if>>${category.categoryName?if_exists}</option>
                </#list>
            </#if>
        </select>
    </div>
    <div class="span3">
        <select size=9 id="category_3">
            <#if categoryThirdList?has_content>
                <#list categoryThirdList as category>
                    <#assign productCatelogId = category.productCategoryId/>
                    <option value="${productCatelogId}" id="${productCatelogId}" class="category_3" <#if parameters.categoryThirdId?has_content><#if parameters.categoryThirdId == productCatelogId>selected="selected"</#if></#if>>${category.categoryName?if_exists}</option>
                </#list>
            </#if>
        </select>
    </div>
    <div class="span3">
        <select size=9 id="category_4">
            <#if categoryFourthList?has_content>
                <#list categoryFourthList as category>
                    <#assign productCatelogId = category.productCategoryId/>
                    <option value="${productCatelogId}" id="${productCatelogId}" class="category_4" <#if parameters.categoryFourthId?has_content><#if parameters.categoryFourthId == productCatelogId>selected="selected"</#if></#if>>${category.categoryName?if_exists}</option>
                </#list>
            </#if>
        </select>
    </div>
</div>
<div class="assign-category">
    &nbsp;&nbsp; * You can assign a product to more than one category
    <a id="assign-category" class="btn-general pull-right">Assign</a>
</div>
