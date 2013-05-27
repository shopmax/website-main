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

def supplierCarrierMap = [:];
def supplierShippingMethodTypeMap = [:];

// find supplier shopping options
def rowCount = UtilHttp.getMultiFormRowCount(request);
for (i = 0; i < rowCount; i++) {
    def curSuffix = UtilHttp.MULTI_ROW_DELIMITER + i;
    def parameterNames = request.getParameterNames();
    while(parameterNames.hasMoreElements()) {
        def parameterName = parameterNames.nextElement();
        if (parameterName.contains(":")) {
            def tokens = StringUtil.split(parameterName, ":");
            def paramName = tokens[0];
            def paramSuffix = tokens[1];
            def partyId = paramSuffix.substring(0, paramSuffix.indexOf(curSuffix));
            
            if ("shipmentCarrierPartyId".equals(paramName)) {
                def carrierPartyId = request.getParameter(parameterName);
                supplierCarrierMap.put(partyId, carrierPartyId)
            } else if ("shipmentMethodTypeId".equals(paramName)) {
                def shipmentMethodTypeId = request.getParameter(parameterName);
                supplierShippingMethodTypeMap.put(partyId, shipmentMethodTypeId);
            }
        }
    }
}

context.supplierCarrierMap = supplierCarrierMap;
context.supplierShippingMethodTypeMap = supplierShippingMethodTypeMap;
