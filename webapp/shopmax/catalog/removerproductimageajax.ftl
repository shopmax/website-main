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

<#if imageSequenceList?has_content>
    <#list 1..4 as i>
        <#assign check = 1>
        <#if productImageList?has_content>
            <#list productImageList as productImage>
                <#if productImage.sequenceNum == i>
                    <li>
                        <div class="uploaded-image">
                            <img src="<@ofbizContentUrl>${productImage.productImageThumb}</@ofbizContentUrl>" width="82" style="height: 82px;"/>
                        </div>
                        <a onclick="removeProductImageFullMode('${productId?if_exists}','${productImage.contentId?if_exists}','${productImage.fromDate?if_exists}','IMAGE','${i}')">Remove</a>
                    </li>
                <#else>
                    <#if seqNumNoImage?has_content>
                        <#list seqNumNoImage as seqNoImage>
                            <#if seqNoImage == i && check !=0>
                                <li id="li-${i}">
                                    <div id="prev_upfile_${i}" class="uploaded-image" onclick="getFile('${i}')">
                                        <img id="imgAvatar_${i}">
                                    </div>
                                    <a onclick="getFile('${i}')">Add Photo</a>
                                    <div style='height: 0px;width:0px; overflow:hidden; border:0;'><input class="file" id="upfile_${i}" type="file" onchange="showPreview(this,'${i}')" name="uploadedFile${i}"/></div>
                                </li>
                                <#assign check = 0>
                            </#if>
                        </#list>
                    </#if>
                </#if>
            </#list>
        </#if>
    </#list>
<#else>
    <#list 1..4 as i>
        <li id="li-${i}">
            <div id="prev_upfile_${i}" class="uploaded-image" onclick="getFile('${i}')">
                <img id="imgAvatar_${i}">
            </div>
            <a onclick="getFile('${i}')">Add Photo</a>
            <div style='height: 0px;width:0px; overflow:hidden; border:0;'><input class="file" id="upfile_${i}" type="file" onchange="showPreview(this,'${i}')" name="uploadedFile${i}"/></div>
        </li>
    </#list>
</#if>
