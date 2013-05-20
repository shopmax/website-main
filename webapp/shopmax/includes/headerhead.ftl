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

<!DOCTYPE html>
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
        <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&libraries=places&language=en-AU"></script>
        
        <script type="text/javascript">
        $(document).ready(function() {
            $(".various").fancybox({
                'titlePosition'     : 'inside',
                'transitionIn'      : 'none',
                'transitionOut'     : 'none'
            });
            
            makeAccordion($("#category-menu"));
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
                        pathName = pathName+"detail";
                    }
                    else{
                        pathName = currentPath[2];
                        pathName = pathName+"detail";
                    }
                    $("#category-container").load(pathName + "?productCategoryId=" + productCategoryId);
                });
            });
        }
        </script>
    </head>
    <body class="home">
