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

<div class="container content">
    <div class="row">
        <a class="skip-link small" href="#side-menu">Skip to sidebar menu</a>
    </div>
    <#include "component://shopmax/webapp/shopmax/includes/breadcrum.ftl" />
    <div class="row content-left">
        <!-- MAIN CONTENT -->
        <!-- sliderdiv -->
        <div class="span9 main-content">
            <div class="tabbed">
                <div class="tabs">
                    <ul class="tabnavs">
                        <li><h3>Profile</h3></li>
                        <li><h3>Merchant</h3></li>
                        <li><h3>Manage Branches</h3></li>
                    </ul>
                </div><!-- /.tabs-->
                <div id="profile-tab" class="tabcontent">
                    <div class="inside">
                        <h4>Personal Details<span><a href="#" class="box-link">Edit</a></span></h4>
                        <div class="span5">
                            <p><strong>David Smith</strong></p>
                            <p>david.smith@davidsmith.com</p>
                        </div>
                        <div class="span3">
                            <p><strong>Connect With</strong></p>
                            <ul>
                                <li><a href="#"><img src="<@ofbizContentUrl>shopmax-default/img/fb.png</@ofbizContentUrl>" width="23" height="23" alt="" /></a></li>
                                <li><a href="#"><img src="<@ofbizContentUrl>shopmax-default/img/tw.png</@ofbizContentUrl>" width="23" height="23" alt="" /></a></li>
                                <li><a href="#"><img src="<@ofbizContentUrl>shopmax-default/img/gplus.png</@ofbizContentUrl>" width="23" height="23" alt="" /></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="inside">
                        <h4>Password</h4>
                        <form class="css-layout">
                            <div class="span9">
                                <p class="span4"><label for="oldpassword">Old password</label><input id="oldpassword" name="oldpassword" type="text" /></p>
                            </div>
                            <p class="span9">
                                <span class="span4">
                                    <label for="newpassword">New password</label><input id="newpassword" name="newpassword" type="text" />  
                                </span>
                                <span class="span4">
                                    <label for="newpassword2">Confirm password</label><input id="newpassword2" name="newpassword2" type="text" />
                                </span>
                                <span class="span1">
                                    <button type="submit" class="btn-general" value="Submit">Submit</button>
                                </span> 
                            </p>
                        </form>
                    </div>
                    <div class="inside">
                        <h4>Credit Card<span>1 credit card stored</span></h4>
                        <div class="span8">
                            <p><strong><a href="#">Remove your saved credit card</a></strong></p>
                            <p><a href="#" class="btn-grey">Forget</a></p>
                        </div>
                    </div>
                    <div class="inside">
                        <h4 class="no-margin">Address Book</h4>
                        <div class="span9 no-margin">
                            <div class="span5">
                                <h5 class="no-margin">Default Shipping address</h5>
                                <p>Contact Name<br />
                                Street address line one<br />
                                Street address line two<br />
                                State<br />
                                Phone Number XX-XXXXXXX
                                </p>
                            </div>
                            <div class="span4">
                                <h5 class="no-margin">Default billing address</h5>
                                <p>Contact Name<br />
                                Street address line one<br />
                                Street address line two<br />
                                State<br />
                                Phone Number XX-XXXXXXX
                                </p>
                            </div>
                        </div>
                        <div class="span9 no-margin">
                            <h5 class="no-margin">Other addresses</h5>
                            <div class="row">
                                <div class="span5">
                                    <p>Contact Name 1<br />
                                    Street address line one<br />
                                    Street address line two<br />
                                    State<br />
                                    Phone Number XX-XXXXXXX
                                    </p>
                                </div>
                                <div class="span4">
                                    <p><a href="#">Edit</a><br />
                                    <a href="#">Remove</a><br />
                                    <a href="#">Set as default shipping</a><br />
                                    <a href="#">Set as default billing</a>
                                    </p>
                                </div>
                                <hr />
                            </div><!-- /.row -->
                            <div class="row">
                                <div class="span5">
                                    <p>Contact Name 2<br />
                                    Street address line one<br />
                                    Street address line two<br />
                                    State<br />
                                    Phone Number XX-XXXXXXX
                                    </p>
                                </div>
                                <div class="span4">
                                    <p><a href="#">Edit</a><br />
                                    <a href="#">Remove</a><br />
                                    <a href="#">Set as default shipping</a><br />
                                    <a href="#">Set as default billing</a>
                                    </p>
                                </div>
                                <hr />
                            </div><!-- /.row -->
                            <div class="row">
                                <p><a href="#" class="btn-general">Add New Addresses</a></p>
                            </div>
                        </div>
                    </div>
                </div><!-- /#profile-tab -->
                <div id="merchant-tab" class="tabcontent">
                    <div class="inside">
                        <h4>Business Details<span><a class="box-link" href="#">Edit</a></span></h4>
                        <form>
                            <div class="span9">
                                <table>
                                    <tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td width="5%">&nbsp;</td></tr>
                                    <tr><td colspan="25">
                                    <p><strong>NAME</strong></p></td></tr>
                                    <tr><td colspan="11">
                                        <label for="obusname">Official business name</label></td>
                                        <td colspan="4">
                                            <input type="text" name="obusname" id="obusname" />
                                        </td>
                                        <td colspan="4" class="align-center">
                                            <label for="tradename">Trading name</label>
                                        </td>
                                        <td colspan="5">
                                            <input type="text" name="tradename" id="tradename" class="pull-right" /> 
                                        </td>
                                        <td colspan="1">&nbsp;</td>
                                    </tr>
                                    <tr><td colspan="25"><hr /></td></tr>
                                    <tr>
                                        <td colspan="25">
                                            <p><strong>DOMAIN</strong></p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="12">
                                            <label for="currdomname">Current domain name</label>
                                        </td>
                                        <td colspan="12" class="full-width">
                                            <input type="text" name="currdomname" id="currdomname" /></td>
                                        <td colspan="1">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="1" class="align-left">
                                            <input type="checkbox" checked="checked" name="usedomname" id="usedomname">
                                        </td>
                                        <td colspan="11">
                                            <label for="domname">Use your own domain name</label>
                                        </td>
                                        <td colspan="12" class="full-width"><input type="text" name="domname" id="domname" /></td>
                                        <td colspan="1" class="align-right"><a href="profile-help.html" class="fancylink fancybox.iframe"><img src="<@ofbizContentUrl>shopmax-default/img/help.png</@ofbizContentUrl>" width="20" height="27" alt="" /></a></td>
                                    </tr>
                                    <tr><td colspan="25"><hr /></td></tr>
                                    <tr>
                                        <td colspan="25">
                                            <p>
                                                <strong>BANK ACCOUNT TO RECEIVE PAYMENT</strong>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="9">
                                            <label for="accntname">Account name</label></td>
                                        <td colspan="6">
                                            <input type="text" id="accntname" name="accntname" /></td>
                                        <td colspan="10">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="8">
                                            <label for="accntnum">Account number</label>
                                        </td>
                                        <td colspan="16"><input type="text" id="accntnum" maxlength="2" class="span1" />&#8212;
                                        
                                            <input type="text" id="accntnum2" maxlength="4" class="span1" />
                                        &#8212;
                                        
                                            <input type="text"  id="accntnum3" maxlength="7" class="span4" />
                                        &#8212;
                                        
                                            <input type="text" id="accntnum4" maxlength="2" class="span1" />
                                        </td>
                                        <td colspan="1">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="22">&nbsp;</td>
                                        <td colspan="1" class="align-right"><button type="submit" class="btn-general">Submit</button></td>
                                        <td colspan="1" class="align-right"><button type="reset" class="btn-grey">Cancel</button></td>
                                        <td colspan="1">&nbsp;</td>
                                    </tr>
                                    <tr><td colspan="25"><p><strong>Note:</strong> For your security, your change request will be sent to our website administration for action, you will receive a confirmation email once the change has been made.</p></td></tr>
                                    <!-- horrible hack to get table working --> 
                                </table>
                            </div>
                        </form>
                    </div>
                </div><!-- /#merchant-tab -->
                <div id="manage-branches-tab" class="tabcontent">
                    <div class="inside">
                    <h4>Manage Branches</h4>
                        <div class="span8">
                            <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Cras non mauris. Praesent quam lorem, scelerisque et, mattis cursus, porttitor sit amet, libero. Praesent pulvinar.</p>
                            <p>Duis vitae nunc ut sapien mollis scelerisque. Sed tempor libero sed nisl. Praesent ultricies nulla. Proin sit amet mi. Sed dignissim eleifend odio. Mauris viverra lectus. Etiam tellus diam, pharetra sit amet, convallis nec, cursus eu, urna. Aliquam erat volutpat.</p>
                        </div>
                    </div>
                </div><!-- /#branches-tab -->
            </div><!-- /.tabbed -->
        </div><!-- /.span9 -->
        <!-- sidebar -->
        <div class="span3 sidebar dropped" id="side-menu">
            <div class="categories innerbox georgia grey">
                <h2>Reserved</h2>
                <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Cras non mauris. Praesent quam lorem, scelerisque et, mattis cursus, porttitor sit amet, libero. Praesent pulvinar. Duis vitae nunc ut sapien mollis scelerisque. Sed tempor libero sed nisl. Praesent ultricies nulla. Proin sit amet mi. Sed dignissim eleifend odio. Mauris viverra lectus. Etiam tellus diam, pharetra sit amet, convallis nec, cursus eu, urna. Aliquam erat volutpat.</p>
            </div><!-- /.categories .innerbox -->
        </div><!-- /.span3.sidebar -->
    </div><!-- /.row -->
</div> <!-- /container -->
