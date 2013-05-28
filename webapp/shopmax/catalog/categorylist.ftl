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


<div class="categories innerbox georgia">
    <#if headerItem?if_exists == "manageproduct">
        <h2><a href="<@ofbizUrl>manageproduct</@ofbizUrl>">See All Products</a></h2>
    <#else>
        <h2>Category list</h2>
    </#if>
    <div class="category-list nested-list">
         <ul id="category-menu">
           <#if categoryList?has_content>
                <#list categoryList as productCategory>
                    <li class="">
                        <a class="" href="#${productCategory.productCategoryId}"><span>${productCategory.categoryName}</span></a>
                        <div class="">
                        </div>
                    </li>
                </#list>
            </#if>
        </ul>
    </div>
</div><!-- /.categories .innerbox -->
