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

<div class="row content-left">
    <div class="span12 product-detail product-tab">
        <ul class="nav nav-tabs georgia" id="myTab">
          <li class="active"><a data-toggle="tab" href="#prdDesc">Product Description</a></li>
          <li class=""><a data-toggle="tab" href="#prdReviews">Reviews</a></li>
        </ul>
        <div class="tab-content" id="myTabContent">
          <div id="prdDesc" class="tab-pane fade active in">
            <p>${productContentWrapper.get("DESCRIPTION")?if_exists}</p>
          </div>
          <div id="prdReviews" class="tab-pane fade">
              <#if productReviews?has_content>
                  <#list productReviews as productReview>
                      <#assign postedUserLogin = productReview.getRelatedOne("UserLogin", false) />
                      <#assign postedPerson = postedUserLogin.getRelatedOne("Person", false)?if_exists />
                      <p>
                          <#--
                          <div><strong>${uiLabelMap.CommonBy}: </strong><#if productReview.postedAnonymous?default("N") == "Y"> ${uiLabelMap.OrderAnonymous}<#else> ${postedPerson.firstName} ${postedPerson.lastName}&nbsp;</#if></div>
                          <div><strong>${uiLabelMap.CommonAt}: </strong>${productReview.postedDateTime?if_exists}&nbsp;</div>
                          <div><strong>${uiLabelMap.OrderRanking}: </strong>${productReview.productRating?if_exists?string}</div>
                          <div>&nbsp;</div>
                          -->
                          <div>${productReview.productReview?if_exists}</div>
                          <hr />
                      </p>
                  </#list>
              </#if>
          </div>
        </div>
    </div>
</div>
