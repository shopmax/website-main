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
        <ul>
            <li><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/arrow-prev-grey.png</@ofbizContentUrl>" /></a></li>
            <li><a href="#">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">...</a></li>
            <li><a href="#">10</a></li>
            <li><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/arrow-next-blue.png</@ofbizContentUrl>" /></a></li>
        </ul>
    </div>
</div>
