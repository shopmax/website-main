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
<script language="javascript" type="text/javascript" src="<@ofbizContentUrl>/shopmax-default/js/vendor/jquery-1.8.3.min.js</@ofbizContentUrl>"></script>
<script>
if($('header').length == 0){
    window.location.href=window.location.href;
}
</script>
<h3>${shoppingCartSize} Items</h3>
<#if shoppingCartSize &gt; 0>
    <p><a href="<@ofbizUrl>shoppingcart</@ofbizUrl>" class="btn-flat round">View Cart</a></p>
    <p><a href="<@ofbizUrl>shoppingcart</@ofbizUrl>" class="btn-flat checkout">Check Out</a></p>
<#else>
    <p><label class="btn-flat round disabled">View Cart</label></p>
    <p><label class="btn-flat checkout disabled">Check Out</label></p>
</#if>
