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
    <#include "component://shopmax/webapp/shopmax/includes/breadcrum.ftl" />
    
    <div class="row">
    <!-- MAIN CONTENT -->
        <!-- sliderdiv -->
        <div class="span9 main-content manage-product cat_grid_view cat_list_view">
            <div class="serbox clearfix">
                <p><strong>Your current location is “30 Queen st, Auckland, cbd, 1001”</strong></p>
                <div class="leftside">
                    <input type="text" class="span4" placeholder="Mollis Inceptos Vulputate Porta">
                    <input type="submit" value="apply" class="btn-general">
                </div>
                <span>About 6,970 results</span>
            </div>
            <div class="add-product topviewbox clearfix">
                <span class="tital">SORT BY</span>
                <div class="shortbybox">
                    <select id="accountOp" class="chosen actionable" name="accountOptions">
                        <option selected="selected">My Account</option>
                        <option value="selling.html">Selling</option>
                        <option value="buying.html">Buying</option>
                        <option value="profile.html">Profile</option>
                        <option value="log-out.html">Log Out</option>
                    </select>
                </div>
                <span class="tital">VIEW BY</span>
                <a href="<@ofbizUrl>searchgridview</@ofbizUrl>" class="grid_view"><span class="b"></span>Grid</a>
                <a href="<@ofbizUrl>searchlistview</@ofbizUrl>" class="list_view"><span class="b"></span>List</a>
                <div class="paging">
                    <ul>
                        <li><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/arrow-prev-grey.png</@ofbizContentUrl>" /></a></li>
                        <li><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">...</a></li>
                        <li><a href="#">10</a></li>
                        <li><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/arrow-next-blue.png</@ofbizContentUrl>" /></a></li>
                    </ul>
                </div>
            </div>
            
            <div class="cat_viewing">
                <div class="block_1">
                    <div class="image"><img src="<@ofbizContentUrl>/shopmax-default/img/img_1.png</@ofbizContentUrl>" alt=""></div>
                    <div class="mdic">Duis cursus iaculis dui a viverra. Donec metus massa.</div>
                    <div class="pricestar">
                        <div class="price"><span>$179.00 NZD</span>$135.00 NZD</div>
                        <div class="stars">
                            <div class="raty" data-rating="3"></div>
                        </div>
                    </div>
                    <p>lacinia dui pharetra. Quisque semper gravida ipsum, ut hendrerit erat auctor at. Curabitur nunc tortor, pharetra.</p>
                    <div class="distancebox"><p>Shop: <strong>The Warehouse</strong><span></span>Destance: <strong>About 1km</strong></p></div>
                    <div class="buttonbox"><a href="#" class="btn-general">ADD TO CART</a><a href="#" class="addtolist">Add to shopping List</a></div>
                </div>
                <div class="block_1">
                    <div class="image"><img src="<@ofbizContentUrl>/shopmax-default/img/img_1.png</@ofbizContentUrl>" alt=""></div>
                    <div class="mdic">Duis cursus iaculis dui a viverra. Donec metus massa.</div>
                    <div class="pricestar">
                        <div class="price"><span>$179.00 NZD</span>$135.00 NZD</div>
                        <div class="stars">
                            <div class="raty" data-rating="3"></div>
                        </div>
                    </div>
                    <p>lacinia dui pharetra. Quisque semper gravida ipsum, ut hendrerit erat auctor at. Curabitur nunc tortor, pharetra.</p>
                    <div class="distancebox"><p>Shop: <strong>The Warehouse</strong><span></span>Destance: <strong>About 1km</strong></p></div>
                    <div class="buttonbox"><a href="#" class="btn-general">ADD TO CART</a><a href="#" class="addtolist">Add to shopping List</a></div>
                </div>
                <div class="block_1">
                    <div class="image"><img src="<@ofbizContentUrl>/shopmax-default/img/img_1.png</@ofbizContentUrl>" alt=""></div>
                    <div class="mdic">Duis cursus iaculis dui a viverra. Donec metus massa.</div>
                    <div class="pricestar">
                        <div class="price"><span>$179.00 NZD</span>$135.00 NZD</div>
                        <div class="stars">
                            <div class="raty" data-rating="3"></div>
                        </div>
                    </div>
                    <p>lacinia dui pharetra. Quisque semper gravida ipsum, ut hendrerit erat auctor at. Curabitur nunc tortor, pharetra.</p>
                    <div class="distancebox"><p>Shop: <strong>The Warehouse</strong><span></span>Destance: <strong>About 1km</strong></p></div>
                    <div class="buttonbox"><a href="#" class="btn-general">ADD TO CART</a><a href="#" class="addtolist">Add to shopping List</a></div>
                </div>
                <div class="block_1">
                    <div class="image"><img src="<@ofbizContentUrl>/shopmax-default/img/img_1.png</@ofbizContentUrl>" alt=""></div>
                    <div class="mdic">Duis cursus iaculis dui a viverra. Donec metus massa.</div>
                    <div class="pricestar">
                        <div class="price"><span>$179.00 NZD</span>$135.00 NZD</div>
                        <div class="stars">
                            <div class="raty" data-rating="3"></div>
                        </div>
                    </div>
                    <p>lacinia dui pharetra. Quisque semper gravida ipsum, ut hendrerit erat auctor at. Curabitur nunc tortor, pharetra.</p>
                    <div class="distancebox"><p>Shop: <strong>The Warehouse</strong><span></span>Destance: <strong>About 1km</strong></p></div>
                    <div class="buttonbox"><a href="#" class="btn-general">ADD TO CART</a><a href="#" class="addtolist">Add to shopping List</a></div>
                </div>
                <div class="block_1">
                    <div class="image"><img src="<@ofbizContentUrl>/shopmax-default/img/img_1.png</@ofbizContentUrl>" alt=""></div>
                    <div class="mdic">Duis cursus iaculis dui a viverra. Donec metus massa.</div>
                    <div class="pricestar">
                        <div class="price"><span>$179.00 NZD</span>$135.00 NZD</div>
                        <div class="stars">
                            <div class="raty" data-rating="3"></div>
                        </div>
                    </div>
                    <p>lacinia dui pharetra. Quisque semper gravida ipsum, ut hendrerit erat auctor at. Curabitur nunc tortor, pharetra.</p>
                    <div class="distancebox"><p>Shop: <strong>The Warehouse</strong><span></span>Destance: <strong>About 1km</strong></p></div>
                    <div class="buttonbox"><a href="#" class="btn-general">ADD TO CART</a><a href="#" class="addtolist">Add to shopping List</a></div>
                </div>
                <div class="block_1">
                    <div class="image"><img src="<@ofbizContentUrl>/shopmax-default/img/img_1.png</@ofbizContentUrl>" alt=""></div>
                    <div class="mdic">Duis cursus iaculis dui a viverra. Donec metus massa.</div>
                    <div class="pricestar">
                        <div class="price"><span>$179.00 NZD</span>$135.00 NZD</div>
                        <div class="stars">
                            <div class="raty" data-rating="3"></div>
                        </div>
                    </div>
                    <p>lacinia dui pharetra. Quisque semper gravida ipsum, ut hendrerit erat auctor at. Curabitur nunc tortor, pharetra.</p>
                    <div class="distancebox"><p>Shop: <strong>The Warehouse</strong><span></span>Destance: <strong>About 1km</strong></p></div>
                    <div class="buttonbox"><a href="#" class="btn-general">ADD TO CART</a><a href="#" class="addtolist">Add to shopping List</a></div>
                </div>
                <div class="block_1">
                    <div class="image"><img src="<@ofbizContentUrl>/shopmax-default/img/img_1.png</@ofbizContentUrl>" alt=""></div>
                    <div class="mdic">Duis cursus iaculis dui a viverra. Donec metus massa.</div>
                    <div class="pricestar">
                        <div class="price"><span>$179.00 NZD</span>$135.00 NZD</div>
                        <div class="stars">
                            <div class="raty" data-rating="3"></div>
                        </div>
                    </div>
                    <p>lacinia dui pharetra. Quisque semper gravida ipsum, ut hendrerit erat auctor at. Curabitur nunc tortor, pharetra.</p>
                    <div class="distancebox"><p>Shop: <strong>The Warehouse</strong><span></span>Destance: <strong>About 1km</strong></p></div>
                    <div class="buttonbox"><a href="#" class="btn-general">ADD TO CART</a><a href="#" class="addtolist">Add to shopping List</a></div>
                </div>
                <div class="block_1">
                    <div class="image"><img src="<@ofbizContentUrl>/shopmax-default/img/img_1.png</@ofbizContentUrl>" alt=""></div>
                    <div class="mdic">Duis cursus iaculis dui a viverra. Donec metus massa.</div>
                    <div class="pricestar">
                        <div class="price"><span>$179.00 NZD</span>$135.00 NZD</div>
                        <div class="stars">
                            <div class="raty" data-rating="3"></div>
                        </div>
                    </div>
                    <p>lacinia dui pharetra. Quisque semper gravida ipsum, ut hendrerit erat auctor at. Curabitur nunc tortor, pharetra.</p>
                    <div class="distancebox"><p>Shop: <strong>The Warehouse</strong><span></span>Destance: <strong>About 1km</strong></p></div>
                    <div class="buttonbox"><a href="#" class="btn-general">ADD TO CART</a><a href="#" class="addtolist">Add to shopping List</a></div>
                </div>
            </div>
            <div class="add-product topviewbox clearfix">
                <span class="tital">SORT BY</span>
                <select class="span2">
                    <option></option>
                </select>
                <span class="tital">VIEW BY</span>
                <a href="<@ofbizUrl>searchgridview</@ofbizUrl>" class="grid_view"><span class="b"></span>Grid</a>
                <a href="<@ofbizUrl>searchlistview</@ofbizUrl>" class="list_view"><span class="b"></span>List</a>
                <div class="paging">
                    <ul>
                        <li><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/arrow-prev-grey.png</@ofbizContentUrl>" /></a></li>
                        <li><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">...</a></li>
                        <li><a href="#">10</a></li>
                        <li><a href="#"><img src="<@ofbizContentUrl>/shopmax-default/img/arrow-next-blue.png</@ofbizContentUrl>" /></a></li>
                    </ul>
                </div>
            </div>
        </div><!-- /.span9 -->
        <div class="span3 sidebar" id="side-menu">
            <#include "component://shopmax/webapp/shopmax/catalog/categorylist.ftl" />
            <#include "component://shopmax/webapp/shopmax/catalog/categoryrefineby.ftl" />
        </div><!-- /.span3.sidebar -->
    </div><!-- /.row -->
</div> <!-- /container -->
