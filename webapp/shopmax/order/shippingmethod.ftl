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

<div class="container content promotion">
    <#include "component://shopmax/webapp/shopmax/includes/breadcrum.ftl" />
    <div class="row content-left">
        <!-- MAIN CONTENT -->
        <div class="span9 main-content">
            <div class="my_acc">
                <div class="title_grn"><h6>YOUR SHIPPING METHOD</h6></div>
                <div class="block">
                    <form class="form-horizontal form-horizontal_bigwidth">
                        <div class="control-group">
                            <label class="control-label">Enter your distribution centre code</label>
                            <div class="controls">
                                <input type="text" class="span2">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Choose your shipping method</label>
                            <div class="controls">
                                <select class="span2">
                                    <option>Create your own</option>
                                    <option>NZ Courier</option>
                                    <option>PBT</option>
                                    <option>Fastway</option>
                                    <option>Create your own</option>
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="title_grn"><h6>YOUR OWN SHIPPING METHOD</h6></div>
                <div class="block block_mar">
                    <ul class="storevouc">
                        <li>
                            <span class="heading">Name of your shipping method</span>
                            <input type="text" class="span3">
                        </li>
                    </ul>
                    <table cellpadding="0" cellspacing="0" border="0" class="table table_m">
                        <thead>
                            <tr>
                                <th>POSTAL AREA</th>
                                <th>PRODUCT SIZE</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="bor_right" width="30%">
                                    <table cellpadding="0" cellspacing="0" border="0" class="table table_m2">
                                        <tr>
                                            <td><select ></select></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <span>Postcode from</span>
                                                <input type="text" class="span1">
                                                <span>To</span>
                                                <input type="text" class="span1">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><select ></select></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <span>Postcode from</span>
                                                <input type="text" class="span1">
                                                <span>To</span>
                                                <input type="text" class="span1">
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td>
                                    <div class="sizelist">
                                        <ul>
                                            <li class="licol_1">
                                                <strong>XS</strong>
                                                <input type="text" class="text">
                                                <input type="text" class="text">
                                            </li>
                                            <li class="licol_2">
                                                <strong>S</strong>
                                                <input type="text" class="text">
                                                <input type="text" class="text">
                                            </li>
                                            <li class="licol_3">
                                                <strong>M</strong>
                                                <input type="text" class="text">
                                                <input type="text" class="text">
                                            </li>
                                            <li class="licol_4">
                                                <strong>L</strong>
                                                <input type="text" class="text">
                                                <input type="text" class="text">
                                            </li>
                                            <li class="licol_5">
                                                <strong>XL</strong>
                                                <input type="text" class="text">
                                                <input type="text" class="text">
                                            </li>
                                            <li class="licol_6">
                                                <strong>Special 1</strong>
                                                <input type="text" class="text">
                                                <input type="text" class="text">
                                            </li>
                                            <li class="licol_7">
                                                <strong>Special 2</strong>
                                                <input type="text" class="text">
                                                <input type="text" class="text">
                                            </li>
                                            <li class="licol_8">
                                                <strong>Special 3</strong>
                                                <input type="text" class="text">
                                                <input type="text" class="text">
                                            </li>
                                        </ul>
                                    </div>
                                    
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <table cellpadding="0" cellspacing="0" border="0" class="table table_m3">
                        <tr>
                            <td><h6>Combination Index</h6></td>
                        </tr>
                        <tr>
                            <td>
                                <span>XL=</span>
                                <input type="text" class="text">
                                <span>XS;</span>
                                <input type="text" class="text">
                                <span>S;</span>
                                <input type="text" class="text">
                                <span>M;</span>
                                <input type="text" class="text">
                                <span>L;</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>L=</span>
                                <input type="text" class="text">
                                <span>XS;</span>
                                <input type="text" class="text">
                                <span>S;</span>
                                <input type="text" class="text">
                                <span>M;</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>M=</span>
                                <input type="text" class="text">
                                <span>XS;</span>
                                <input type="text" class="text">
                                <span>S;</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>S=</span>
                                <input type="text" class="text">
                                <span>XS;</span>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="buttonbox_last clearfix">
                    <a href="#" class="btn-general">SUBMIT</a>
                    <a href="#" class="btn-grey">CANCEL</a>
                </div>
            </div>
        </div><!-- /.span9 -->
        <div class="span3 sidebar" id="side-menu">
            <div class="categories innerbox">
                <h2>Tips</h2>
                <div class="category-list">
                    <p>
                    content here
                    </p>
                </div>
            </div><!-- /.categories .innerbox -->
        </div><!-- /.span3.sidebar -->
    </div><!-- /.row -->
</div> <!-- /container -->
