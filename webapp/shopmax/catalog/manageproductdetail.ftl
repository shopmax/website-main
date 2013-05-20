<ul class="media-list edit-product-list manage_pro">
    <#if productList?has_content>
        <#list productList as product>
            <li class="media">
                <a class="pull-left" href="#">
                    <img class="media-object" src="<@ofbizContentUrl>/shopmax-default/img/product-generic-2.jpg</@ofbizContentUrl>" />
                </a>
                <div class="media-body">
                    <h5 class="media-category">
                        <#assign count = 1>
                        <#assign size = product.categoryMember?size>
                        <#list product.categoryMember as categoryMember>
                            ${categoryMember?if_exists}
                            <#if size != count>
                            /
                            </#if>
                            <#assign count = count+1>
                        </#list>
                    </h5>
                    <h4 class="media-heading">${product.productName?if_exists}</h4>
                    <h6 class="media-code">SKU : ${product.productId?if_exists}</h6>
                    <ul class="media-price">
                        <#if product.promoPrice?exists>
                            <li class="old"><@ofbizCurrency amount=product.defaultPrice/> NZD</li>
                            <li class="current-price"><@ofbizCurrency amount=product.promoPrice/> NZD</li>
                        <#else>
                            <div class="price"><@ofbizCurrency amount=product.defaultPrice/> NZD</div>
                        </#if>
                    </ul>
                    <p>Stocks : 99</p>   
                    <a class="btn-general edit" id="edit-product-${product_index}">Edit</a>
                    <a class="btn-green-small" href="#">Promote</a>
                    <a class="btn-grey-small" href="#">Remove</a>
                </div>
            </li>
            <li class="media media-edit" style="display: none;" id="view-edit-product-${product_index}">
                <a class="pull-left" href="#">
                <img class="media-object" src="<@ofbizContentUrl>/shopmax-default/img/product-generic-170x170.jpg</@ofbizContentUrl>" />
                </a>
                <div class="media-body">
                    <form class="form-horizontal pull-left">
                        <div class="control-group">
                            <label class="control-label" for="inputProductName">Product name</label>
                            <div class="controls">
                                <input type="text" class="input-xlarge" id="inputProductName" value="${product.productName?if_exists}">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="inputDescription">Description</label>
                            <div class="controls">
                                <textarea rows="3" class="input-xlarge">${product.description?if_exists}</textarea>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="inputDescription">Picture upload (4 Max)</label>
                            <div class="controls">
                                <ul class="uploading">
                                    <li class="uploaded">
                                        <div>
                                            <#if productImage?exists>
                                                <#-- <img src="<@ofbizContentUrl>${contentPathPrefix?if_exists}${productImage?if_exists}</@ofbizContentUrl>" /> -->
                                                <img src="<@ofbizContentUrl>/shopmax-default/img/product-generic-82x82.jpg</@ofbizContentUrl>" />
                                            <#else>
                                                <img src="<@ofbizContentUrl>/shopmax-default/img/product-generic-82x82.jpg</@ofbizContentUrl>" />
                                            </#if>
                                        </div>
                                        <a href="#">Remove</a>
                                    </li>
                                    <li>
                                        <div class="uploaded-image">
                                            <img src="<@ofbizContentUrl>/shopmax-default/img/product-generic-82x82.jpg</@ofbizContentUrl>" />
                                        </div>
                                        <a href="#">Add Photo</a>
                                    </li>
                                    <li>
                                        <div class="uploaded-image">
                                            <img src="<@ofbizContentUrl>/shopmax-default/img/product-generic-82x82.jpg</@ofbizContentUrl>" />
                                        </div>
                                        <a href="#">Add Photo</a>
                                    </li>
                                    <li>
                                        <div class="uploaded-image">
                                            <img src="<@ofbizContentUrl>/shopmax-default/img/product-generic-82x82.jpg</@ofbizContentUrl>" />
                                        </div>
                                        <a href="#">Add Photo</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        
                        <div class="form-inline input-price-stock">
                            <label>
                                Listing price
                                <input type="number" class="input-medium" value="${product.defaultPrice?if_exists}">
                            </label>
                            <label style="border:1px solid #E0E0E0;">
                                Available stock
                                <input type="number" class="input-medium">
                            </label>
                        </div>
                        
                        <div class="form-inline input-promotion">
                            <input type="checkbox">
                            <label>
                                &nbsp;Promotion price&nbsp;
                                <input type="number" class="input-mini" value="${product.promoPrice?if_exists}">
                            </label>
                            <label>
                                &nbsp;&nbsp;Valid from&nbsp;
                                <input type="number" class="input-small">
                            </label>
                            <img src="<@ofbizContentUrl>/shopmax-default/img/icon-calendar.png</@ofbizContentUrl>" />
                            <label>
                                &nbsp;&nbsp;To&nbsp;
                                <input type="number" class="input-small">
                            </label>
                            <img src="<@ofbizContentUrl>/shopmax-default/img/icon-calendar.png</@ofbizContentUrl>" />
                        </div>
                        
                        <div class="form-inline">
                            <label>Shipping size</label><br />
                            <a href="#" class="btn-dark-grey-small">Xtra small</a>
                            <a href="#" class="btn-dark-grey-small">Small</a>
                            <a href="#" class="btn-dark-grey-small">Normal</a>
                            <a href="#" class="btn-dark-grey-small">Large</a>
                            <a href="#" class="btn-dark-grey-small">Xtra Large</a>
                        </div>
                        <div class="input-save">
                            <a href="#" class="btn-general">Save</a><br /><br />
                            <a href="#" class="edit-full-mode">Switch to full edit mode</a>
                        </div>
                    </form>
                </div>
            </li>
        </#list>
    </#if>
</ul>