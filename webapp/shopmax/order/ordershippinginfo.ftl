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

<table cellpadding="0" cellspacing="0" border="0" class="table table_1">
    <thead>
        <tr>
            <th>Shipping Information</th>
        </tr>
    </thead>
    <tbody>
        <#if shippingContactMechList?has_content>
            <#list shippingContactMechList as shippingContactMech>
                <#assign orderContactMechs = shippingContactMech.getRelated("OrderContactMech", Static["org.ofbiz.base.util.UtilMisc"].toMap("orderId", orderId), null, false)/>
                <#if orderContactMechs?has_content>
                    <#assign shippingPostalAddress = shippingContactMech.getRelatedOne("PostalAddress", false)?if_exists>
                    <#assign stateProvinceGeo = shippingPostalAddress.getRelatedOne("StateProvinceGeo", false)?if_exists>
                    <tr><td>${shippingPostalAddress.toName?default("No Contact Name")}</td></tr><#-- Contact Name -->
                    <tr><td>${shippingPostalAddress.address1?if_exists}</td></tr><#-- Street Address Line one -->
                    <tr><td>${shippingPostalAddress.address2?if_exists}</td></tr><#-- Street Address Line two -->
                    <tr><td>${stateProvinceGeo.geoName?if_exists}</td></tr><#-- State -->
                </#if>
            </#list>
        </#if>
        <#if shipToTelecomNumber?exists>
            <tr><td>Phone number: ${shipToTelecomNumber.countryCode?if_exists} <#if shipToTelecomNumber.areaCode?exists>${shipToTelecomNumber.areaCode}-</#if>${shipToTelecomNumber.contactNumber}</td></tr>
        </#if>
    </tbody>
</table>
