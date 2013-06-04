/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

import org.ofbiz.base.util.*;
import org.ofbiz.entity.*;
import org.ofbiz.entity.util.*;
import org.ofbiz.entity.condition.*;
import org.ofbiz.product.store.ProductStoreWorker;

shopmaxCentralDomain = UtilProperties.getPropertyValue("shopmax.properties", "shopmax.central.domain");
context.shopmaxCentralDomain = shopmaxCentralDomain;

tenantId = "default";
shopmaxSellerDomain = null;
if (userLogin) {
    partyId = userLogin.partyId;
    partyRole = delegator.findOne("PartyRole", [partyId : partyId, roleTypeId : "SELLER"], false);
    if (partyRole) {
        tenantId = partyRole.partyId;
        partyAttribute = delegator.findOne("PartyAttribute", [partyId : partyId, attrName : "DOMAIN_NAME"], false)
        if (partyAttribute) {
            shopmaxSellerDomain = partyAttribute.attrValue
        }
    }
}

globalContext.tenantId = tenantId;
globalContext.shopmaxSellerDomain = shopmaxSellerDomain;
