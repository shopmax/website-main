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
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>ShopMax <#if titleProperty?has_content>: ${uiLabelMap.get(titleProperty)}</#if></title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width">
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
        <link rel="stylesheet" href="<@ofbizContentUrl>/shopmax-default/css/product_details.css</@ofbizContentUrl>">
        <link rel="stylesheet" href="<@ofbizContentUrl>/shopmax-default/css/new_style.css</@ofbizContentUrl>">
        <link rel="stylesheet" type="text/css" href="<@ofbizContentUrl>/shopmax-default/css/jquery.fancybox-1.3.4.css</@ofbizContentUrl>" media="screen" />
        <link rel="stylesheet" href="<@ofbizContentUrl>/shopmax-default/js/fancybox/source/jquery.fancybox.css</@ofbizContentUrl>">
        <script src="<@ofbizContentUrl>/shopmax-default/js/vendor/modernizr-2.6.2-respond-1.1.0.min.js</@ofbizContentUrl>"></script>
        <script>window.jQuery || document.write('<script src="<@ofbizContentUrl>/shopmax-default/js/vendor/jquery-1.8.3.min.js</@ofbizContentUrl>"><\/script>')</script>
        <script src="<@ofbizContentUrl>/shopmax-default/js/vendor/bootstrap.min.js</@ofbizContentUrl>"></script>
        <script src="<@ofbizContentUrl>/shopmax-default/js/vendor/chosen.jquery.min.js</@ofbizContentUrl>"></script>
        <script src="<@ofbizContentUrl>/shopmax-default/js/vendor/jquery.anythingslider.min.js</@ofbizContentUrl>"></script>
        <script src="<@ofbizContentUrl>/shopmax-default/js/fancybox/source/jquery.fancybox.pack.js</@ofbizContentUrl>"></script>
        <#-- <script src="<@ofbizContentUrl>/shopmax-default/js/main.js</@ofbizContentUrl>"></script>-->
        <script src="<@ofbizContentUrl>/shopmax-default/js/vendor/jquery.countdown.min.js</@ofbizContentUrl>"></script>
        <#include "component://shopmax/webapp/shopmax/includes/mainjavascript.ftl" />
        <#include "component://shopmax/webapp/shopmax/includes/ratyjavascript.ftl" />
        <#-- <script src="<@ofbizContentUrl>/shopmax-default/js/vendor/jquery.raty.min.js</@ofbizContentUrl>"></script>-->
        <script src="<@ofbizContentUrl>/shopmax-default/js/jquery.mousewheel-3.0.4.pack.js</@ofbizContentUrl>"></script>
        <script src="<@ofbizContentUrl>/shopmax-default/js/jquery.fancybox-1.3.4.js</@ofbizContentUrl>"></script>
        <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&libraries=places&language=en-AU"></script>
        
        <script type="text/javascript">
        $(document).ready(function() {
            $("#various1").fancybox({
                'titlePosition'     : 'inside',
                'transitionIn'      : 'none',
                'transitionOut'     : 'none'
            });
        });
        </script>
    </head>
    <body class="home">
