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

<tr class="index-tr-physical-stores">
    <td class="col1 form-horizontal" id="physical">
        <div class="control-group">
            <label class="control-label control-label-xsmall" for="inputPromotionDescription">Location</label>
            <div class="pull-left">
                <input type="text" class="input-xxlarge inputLocation" id="inputLocation_0" onclick="inputLocation('0')">
            </div>
        </div>
        <div class="control-group">
            <script src="<@ofbizContentUrl>/shopmax-default/js/registration.js</@ofbizContentUrl>" type="text/javascript"></script>
            <script src="<@ofbizContentUrl>/shopmax-default/js/vendor/chosen.jquery.min.js</@ofbizContentUrl>" type="text/javascript"></script>
            <label class="control-label control-label-small" for="inputPromotionDescription">Store Phone number</label>
            <div class="pull-left">
                <select id="phoneNumber4" class="chosen phoneNumber" name="phoneNumber4">
                    <option selected="selected">09</option>
                    <option value="selling.html">08</option>
                    <option value="buying.html">07</option>
                    <option value="profile.html">06</option>
                    <option value="log-out.html">05</option>
                </select>
                <input type="text" class="input-phone-number" id="inputPassword">
            </div>
            <label class="control-label control-label-small" for="inputPromotionDescription">Store Phone number</label>
            <div class="pull-left">
                <select id="phoneNumber5" class="chosen phoneNumber" name="phoneNumber5">
                    <option selected="selected">09</option>
                    <option value="selling.html">08</option>
                    <option value="buying.html">07</option>
                    <option value="profile.html">06</option>
                    <option value="log-out.html">05</option>
                </select>
                <input type="text" class="input-phone-number" id="inputPassword">
            </div>
        </div>
        <div class="control-group">
            <label class="control-label control-label-xlarge" for="inputOpeningHours">Opening Hours (24 hour format)</label>
            <div class="clearfix"></div>
            
            <label class="control-label control-label-xxsmall pull-left" for="inputMonday"><input type="checkbox" name="optionsRadios" id="optionsRadios1" > Mon </label>
            <div clas="pull-left">
                <input type="text" class="input-xsmall" id="inputMonTimeIn"> : <input type="text" class="input-xsmall" id="inputMonTimeOut"> &nbsp;&nbsp;&nbsp;&nbsp; - &nbsp;&nbsp;&nbsp;&nbsp; <input type="text" class="input-xsmall" id="inputMonTimeIn"> : <input type="text" class="input-xsmall" id="inputMonTimeOut">
            </div>
            <label class="control-label control-label-xxsmall pull-left" for="inputTuesday"><input type="checkbox" name="optionsRadios" id="optionsRadios1" > Tue </label>
            <div clas="pull-left">
                <input type="text" class="input-xsmall" id="inputMonTimeIn"> : <input type="text" class="input-xsmall" id="inputMonTimeOut"> &nbsp;&nbsp;&nbsp;&nbsp; - &nbsp;&nbsp;&nbsp;&nbsp; <input type="text" class="input-xsmall" id="inputMonTimeIn"> : <input type="text" class="input-xsmall" id="inputMonTimeOut">
            </div> 
            <label class="control-label control-label-xxsmall pull-left" for="inputWednesday"><input type="checkbox" name="optionsRadios" id="optionsRadios1" > Wed </label>
            <div clas="pull-left">
                <input type="text" class="input-xsmall" id="inputMonTimeIn"> : <input type="text" class="input-xsmall" id="inputMonTimeOut"> &nbsp;&nbsp;&nbsp;&nbsp; - &nbsp;&nbsp;&nbsp;&nbsp; <input type="text" class="input-xsmall" id="inputMonTimeIn"> : <input type="text" class="input-xsmall" id="inputMonTimeOut">
            </div> 
            <label class="control-label control-label-xxsmall pull-left" for="inputMonday"><input type="checkbox" name="optionsRadios" id="optionsRadios1" > Thu </label>
            <div clas="pull-left">  
                <input type="text" class="input-xsmall" id="inputMonTimeIn"> : <input type="text" class="input-xsmall" id="inputMonTimeOut"> &nbsp;&nbsp;&nbsp;&nbsp; - &nbsp;&nbsp;&nbsp;&nbsp; <input type="text" class="input-xsmall" id="inputMonTimeIn"> : <input type="text" class="input-xsmall" id="inputMonTimeOut">
            </div>      
            <label class="control-label control-label-xxsmall pull-left" for="inputMonday"><input type="checkbox" name="optionsRadios" id="optionsRadios1" > Fri </label>
            <div clas="pull-left">
            <input type="text" class="input-xsmall" id="inputMonTimeIn"> : <input type="text" class="input-xsmall" id="inputMonTimeOut"> &nbsp;&nbsp;&nbsp;&nbsp; - &nbsp;&nbsp;&nbsp;&nbsp; <input type="text" class="input-xsmall" id="inputMonTimeIn"> : <input type="text" class="input-xsmall" id="inputMonTimeOut">
            </div>
            <label class="control-label control-label-xxsmall pull-left" for="inputMonday"><input type="checkbox" name="optionsRadios" id="optionsRadios1" > Sat </label>
            <div clas="pull-left">
            <input type="text" class="input-xsmall" id="inputMonTimeIn"> : <input type="text" class="input-xsmall" id="inputMonTimeOut"> &nbsp;&nbsp;&nbsp;&nbsp; - &nbsp;&nbsp;&nbsp;&nbsp; <input type="text" class="input-xsmall" id="inputMonTimeIn"> : <input type="text" class="input-xsmall" id="inputMonTimeOut">
            </div>
            <label class="control-label control-label-xxsmall pull-left" for="inputMonday"><input type="checkbox" name="optionsRadios" id="optionsRadios1" > Sun</label>
            <div clas="pull-left">
                <input type="text" class="input-xsmall" id="inputMonTimeIn"> : <input type="text" class="input-xsmall" id="inputMonTimeOut"> &nbsp;&nbsp;&nbsp;&nbsp; - &nbsp;&nbsp;&nbsp;&nbsp; <input type="text" class="input-xsmall" id="inputMonTimeIn"> : <input type="text" class="input-xsmall" id="inputMonTimeOut">
            </div>
        </div>  
        <a class="btn-grey-small btn_remove" href="#">Remove Branch</a>
    </td>
</tr>
