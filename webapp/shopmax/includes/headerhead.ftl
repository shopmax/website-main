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

<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
        <title>ShopMax <#if titleProperty?has_content>: ${uiLabelMap.get(titleProperty)}</#if></title>
        <meta name="description" content=""/>
        <meta name="viewport" content="width=device-width"/>
        <!-- what happens with this with mobile phones? 
        <meta name="viewport" content="width=device-width, initial-scale=1" />-->
        <#if layoutSettings.VT_SHORTCUT_ICON?has_content>
            <link rel="shortcut icon" href="<@ofbizContentUrl>${StringUtil.wrapString(layoutSettings.VT_SHORTCUT_ICON[0])}</@ofbizContentUrl>" type="text/css"/>
        </#if>
        <#if layoutSettings.VT_STYLESHEET?has_content>
            <#list layoutSettings.VT_STYLESHEET as styleSheet>
                <link rel="stylesheet" href="<@ofbizContentUrl>${StringUtil.wrapString(styleSheet)}</@ofbizContentUrl>" type="text/css"/>
            </#list>
        </#if>
        <#if layoutSettings.styleSheets?has_content>
            <#--layoutSettings.styleSheets is a list of style sheets. So, you can have a user-specified "main" style sheet, AND a component style sheet.-->
            <#list layoutSettings.styleSheets as styleSheet>
              <link rel="stylesheet" href="<@ofbizContentUrl>${StringUtil.wrapString(styleSheet)}</@ofbizContentUrl>" type="text/css"/>
            </#list>
        </#if>
        <#if layoutSettings.javaScripts?has_content>
            <#--layoutSettings.javaScripts is a list of java scripts. -->
            <#-- use a Set to make sure each javascript is declared only once, but iterate the list to maintain the correct order -->
            <#assign javaScriptsSet = Static["org.ofbiz.base.util.UtilMisc"].toSet(layoutSettings.javaScripts)/>
            <#list layoutSettings.javaScripts as javaScript>
              <#if javaScriptsSet.contains(javaScript)>
                <#assign nothing = javaScriptsSet.remove(javaScript)/>
                <script type="text/javascript" src="<@ofbizContentUrl>${StringUtil.wrapString(javaScript)}</@ofbizContentUrl>"></script>
              </#if>
            </#list>
        </#if>
        <#include "component://shopmax/webapp/shopmax/includes/mainjavascript.ftl" />
        <#include "component://shopmax/webapp/shopmax/includes/ratyjavascript.ftl" />
        <script type="text/javascript">
           var gaJsHost = (("https:" == document.location.protocol) ? "https://" : "http://");
           document.write(unescape("%3Cscript src='" + gaJsHost + "maps.google.com/maps/api/js?sensor=false&libraries=places&language=en-AU' type='text/javascript'%3E%3C/script%3E"));
           document.write("<style>@import url('"+gaJsHost+"fonts.googleapis.com/css?family=Lobster');</style>");
        </script>
        
        <script type="text/javascript">
        $(document).ready(function() {
            addItem();
            $.support.cors = true;
            $(".various").fancybox({
                'titlePosition'     : 'inside',
                'transitionIn'      : 'none',
                'transitionOut'     : 'none',
                'onClosed'  : function() {
                    $('#username').removeClass('check');
                    $('#password').removeClass('check');
                    $('#username').removeClass('required');
                    $('#password').removeClass('required');
                    $('#emailPassword').removeClass('check');
                    $('#emailPassword').removeClass('required');
                    $('.content-messages').remove();
                    $('.input-error').addClass('hidden');
                    $('#username').css({'background-color':'#FFFFFF'});
                    $('#password').css({'background-color':'#FFFFFF'});
                }
            });
            
            $(".various").click(function(){
                if($('.login_popup').is(":visible")){
                    $('#username').addClass('check');
                    $('#password').addClass('check');
                }
            });
            
            makeAccordion($("#category-menu"));
            
            $('#advanced-option-detail').slideUp(300, function() {
                $('tr').find('.col1.advanced-option.product-upload').css({'padding':'0'});
            });
            
            $('.additem').each(function(){
                var img = $('#image_'+this.id).find('img');
                $(this).click(function(){
                    flyToElement($(img), $('#cart-info'));
                    return false;
                });
            });
        });
        function makeAccordion($ul) {
            var $accordion = $($ul).accordion();
            $.each($accordion.find('a'), function(index, value) {
                $(this).click(function(e){
                    var productCategoryId = $(this).attr("href").substring(1);
                    var $div = $(this).next("div")[0];
                    $.ajax({
                        url: "subcategoriesaccordionview?parentProductCategoryId=" + productCategoryId
                    }).done(function (data) {
                        $($div).html(data);
                        makeAccordion($($div).find("ul")[0]);
                        window.history.pushState("", "", '?productCategoryId='+productCategoryId);
                    });
                    
                    // load category screen
                    var currentPathName = (window.location.pathname).split(';');
                    var currentPath = currentPathName[0].split('/');
                    var pathName = "";
                    if(currentPath.length == 4){
                        pathName = currentPath[3];
                    }
                    else{
                        pathName = currentPath[2];
                    }
                    pathName = pathName+"detail";
                    $(".main-content").load(pathName + "?productCategoryId=" + productCategoryId);
                    $("#breadcrum").load("breadcrumbsajax?productCategoryId=" + productCategoryId);
                });
            });
        }
        
        function addItem(productId){
            jQuery.ajax({
                url: '<@ofbizUrl>additem</@ofbizUrl>',
                type: 'POST',
                data: $('#'+productId).serialize(),
                success: function(data) {
                    $('#cart-info').html(data);
                }
            });
        }
            function flyToElement(flyer, flyingTo, callBack /*callback is optional*/) {
                var $func = $(this);
 
                var divider = 3;
 
                var flyerClone = $(flyer).clone();
                $(flyerClone).css({
                    position: 'absolute',
                    top: $(flyer).offset().top + "px",
                    left: $(flyer).offset().left + "px",
                    opacity: 1,
                    'z-index': 1000
                });
                $('body').append($(flyerClone));
 
                var gotoX = $(flyingTo).offset().left + ($(flyingTo).width() / 2) - ($(flyer).width()/divider)/2;
                var gotoY = $(flyingTo).offset().top + ($(flyingTo).height() / 2) - ($(flyer).height()/divider)/2;
 
                $(flyerClone).animate({
                    opacity: 0.4,
                    left: gotoX,
                    top: gotoY,
                    width: $(flyer).width()/divider,
                    height: $(flyer).height()/divider
                }, 700,
                    function () {
                        $(flyingTo).fadeOut('fast', function () {
                            $(flyingTo).fadeIn('fast', function () {
                                $(flyerClone).fadeOut('fast', function () {
                                    $(flyerClone).remove();
                                    if( callBack != null ) {
                                        callBack.apply($func);
                                    }
                                });
                            });
                        });
                    });
            }
 
            function flyFromElement(flyer, flyingTo, callBack /*callback is optional*/) {
                var $func = $(this);
 
                var divider = 3;
 
                var beginAtX = $(flyingTo).offset().left + ($(flyingTo).width() / 2) - ($(flyer).width()/divider)/2;
                var beginAtY = $(flyingTo).offset().top + ($(flyingTo).width() / 2) - ($(flyer).height()/divider)/2;
 
                var gotoX = $(flyer).offset().left;
                var gotoY = $(flyer).offset().top;
 
                var flyerClone = $(flyer).clone();
 
                $(flyerClone).css({
                    position: 'absolute',
                    top: beginAtY + "px",
                    left: beginAtX + "px",
                    opacity: 0.4,
                    'z-index': 1000,
                    width:$(flyer).width()/divider,
                    height:$(flyer).height()/divider
                });
                $('body').append($(flyerClone));
 
                $(flyerClone).animate({
                    opacity: 1,
                    left: gotoX,
                    top: gotoY,
                    width: $(flyer).width(),
                    height: $(flyer).height()
                }, 700,
                    function () {
                        $(flyerClone).remove();
                        $(flyer).fadeOut('fast', function () {
                            $(flyer).fadeIn('fast', function () {
                                if (callBack != null) {
                                    callBack.apply($func);
                                }
                            });
                        });
                    });
            }
        </script>
        <style> 
            .btn-general1{
                background: url("img/btn-general-rpt.png") repeat-x scroll 0 0 transparent;
                border-radius: 3px 3px 3px 3px;
                color: white;
                display: inline-block;
                font-weight: bold;
                height: 27px;
                line-height: 27px;
                padding: 0 13px;
                text-align: center;
                text-transform: uppercase;
            }
        </style>
    </head>
    <body class="home">
