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

<nav id="mainnav" class="navbar navbar-static-top"><!-- blue navbar -->
    <div class="navbar-inner">
        <div class="container">
            <ul class="nav">
                <#if headerItem?has_content>
                    <li <#if headerItem?if_exists == "home">class="on"</#if>><a href="${shopmaxCentralDomain}main">Home</a></li>
                    <li <#if headerItem?if_exists == "shops">class="on"</#if>><a href="${shopmaxCentralDomain}shops">Shops</a></li>
                    <li <#if headerItem?if_exists == "groupbang">class="on"</#if>><a href="${shopmaxCentralDomain}groupbang">Group Bang</a></li>
                    <li <#if headerItem?if_exists == "rushhour">class="on"</#if>><a href="${shopmaxCentralDomain}rushhour">Rush Hour</a></li>
                    <li <#if headerItem?if_exists == "multibuy">class="on"</#if>><a href="${shopmaxCentralDomain}multibuy">Multi Buy</a></li>
                    <li <#if headerItem?if_exists == "aboutus">class="on"</#if>><a href="${shopmaxCentralDomain}aboutus">About Us</a></li>
                    <li <#if headerItem?if_exists == "helpcenter">class="on"</#if>><a href="${shopmaxCentralDomain}helpcenter?contentId=SHOPMAX_FAQs">Help</a></li>
                </#if>
            </ul>
        </div>
    </div>
</nav>
