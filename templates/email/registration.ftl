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

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>Registration email</title>
    </head>
    <body style="margin:0 auto; padding:0;">
        <table width="730" border="0" cellspacing="0" cellpadding="0" align="center">
            <tr>
                <td valign="top" align="left">
                    <table width="730" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td valign="top"  height="26" align="left"></td>
                        </tr>
                        <tr>
                            <td valign="top"  align="left"  style="padding:0 0 0 18px"><a href="http://shopmax.co.nz"><img src="${StringUtil.wrapString(webSite.secureContentPrefix?if_exists)}/shopmax-default/img/logo-img.png" width="202" height="57" alt="logo" border="0" align="left"></a></td>
                        </tr>
                        <tr>
                            <td valign="top"  align="left" ><p style="padding:0;margin:0 0 0 38px;font-family:Georgia, 'Times New Roman', Times, serif;font-style:italic;font-size:19px;color:#469beb">Buy from pros, not Joes</p></td>
                        </tr>
                        <tr>
                            <td valign="top"  height="26" align="left"></td>
                        </tr>
                        <tr>
                            <td valign="top"  height="0" align="left">
                                <table width="730" border="0" cellspacing="0" cellpadding="0" align="center" >
                                    <tr>
                                        <td  valign="top"  align="left">
                                            <table width="730" border="0" cellspacing="0" cellpadding="0" style="background:#469beb;">
                                                <tr>
                                                    <td valign="top"  align="left" height="8" ></td>
                                                </tr>
                                                <tr>
                                                    <td><p style=" padding:0;font-size:15px;color:#fff;font-weight:bold;margin:0px 0 0px 32px">Thanks for joining Shopmax</p></td>
                                                </tr>
                                                <tr>
                                                    <td valign="top"  align="left" height="8"></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top"  align="left">
                                            <table width="730" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #e1e1e1">
                                                <tr>
                                                    <td valign="top"  height="16" align="left"></td>
                                                </tr>
                                                <tr>
                                                    <td valign="top"  align="left"><p style="font-family:Arial, Helvetica, sans-serif;font-weight:bold;font-size:12px;color:#000;margin:0 0 0 32px;padding:0;">Hi ${person.firstName?if_exists} ${person.lastName?if_exists},</p></td>
                                                </tr>
                                                <tr>
                                                    <td valign="top"  height="10" align="left"></td>
                                                </tr>
                                                <tr>
                                                    <td valign="top"   align="left"><img src="${StringUtil.wrapString(webSite.secureContentPrefix?if_exists)}/shopmax-default/img/line-spt.jpg" width="695" height="1" alt="img" border="0" align="left" ></td>
                                                </tr>
                                                <tr>
                                                    <td valign="top"  height="16" align="left"></td>
                                                </tr>
                                                <tr>
                                                    <#if businessUser?has_content && businessUser == "Y">
                                                        <td valign="top"  align="left"><p style="font-family:Arial, Helvetica, sans-serif;line-height:14px; font-size:12px;color:#000;margin:0 0 0 32px;padding:0;">Welcome to Shopmax! You can now use your new Shopmax user ID shopmax123 to be a part of a worldwide community of Shopmax buyers, sellers, and shoppers. 
                                                    Keep an eye out for our emails - they'll be packed with helpful tips to get you started over the next few weeks.</p></td>
                                                    <#else>
                                                        <td valign="top"  align="left"><p style="font-family:Arial, Helvetica, sans-serif;line-height:14px; font-size:12px;color:#000;margin:0 0 0 32px;padding:0;">Welcome to Shopmax! You can now use your new Shopmax user ID shopmax123 to be a part of a worldwide community of Shopmax buyers, sellers, and shoppers. 
                                                    Keep an eye out for our emails - they'll be packed with helpful tips to get you started over the next few weeks.</p></td>
                                                    </#if>
                                                </tr>
                                                <tr>
                                                    <td valign="top"  height="30" align="left"></td>
                                                </tr>
                                                <tr>
                                                    <td valign="top"  align="left"><p style="font-family:Arial, Helvetica, sans-serif;font-weight:bold;font-size:12px;color:#000;padding:0 0 0 0;margin:0 0 0 32px;">User name: ${username?if_exists}<br/>
                                                    Password: ${password?if_exists}</p></td>
                                                </tr>
                                                <tr>
                                                    <td valign="top"  height="26" align="left"></td>
                                                </tr>
                                                <tr>
                                                    <td valign="top"  align="left" style="padding:0 0 0 32px"><a href="http://shopmax.co.nz"><img src="${StringUtil.wrapString(webSite.secureContentPrefix?if_exists)}/shopmax-default/img/sharp-btn-img.png" width="138" height="31" alt="start shopping" border="0" align="left"></a></td>
                                                </tr>
                                                <tr>
                                                    <td valign="top"  height="28" align="left"></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" align="left"> 
                                <table width="730" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td valign="top"  height="14" align="left"></td>
                                    </tr>
                                    <tr>
                                        <td valign="top"  align="left">
                                            <table width="730" border="0" cellspacing="0" cellpadding="0" style="background:#5d980b;">
                                                <tr>
                                                    <td valign="top"  align="left" height="8" ></td>
                                                </tr>
                                                <tr>
                                                    <td><p style=" padding:0;font-size:15px;color:#fff;font-weight:bold;margin:0px 0 0px 32px">How to get started</p></td>
                                                </tr>
                                                <tr>
                                                    <td valign="top"  align="left" height="8"></td>
                                                </tr>
                                            </table>
                                            <table width="730" border="0" cellspacing="0" cellpadding="5" style="border:1px solid #e1e1e1">
                                                <tr>
                                                    <td valign="top"  height="22" align="left"></td>
                                                </tr>
                                                <tr>
                                                    <td valign="top"  align="left"><p style=" margin:0 0 0 42px;font-size:12px;color:#000000;padding:0px 0 0px 0px"> •&nbsp;   Start bidding and buying on eBay with these helpful tips.</p>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td valign="top"  align="left"><p style=" margin:0 0 0 42px;font-size:12px;color:#000000;padding:0px 0 0px 0px"> •&nbsp;  Learn more about selling on eBay.</p>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td valign="top"  align="left"><p style=" margin:0 0 0 42px;font-size:12px;color:#000000;padding:0px 0 0px 0px"> •&nbsp;  Download our free mobile app to shop, bid, and buy all from your phone.</p>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td valign="top"  align="left"><p style=" margin:0 0 0 42px;font-size:12px;color:#000000;padding:0px 0 0px 0px"> •&nbsp;  Go to My eBay to manage your account.</p>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td  valign="top"  align="left"><p style=" margin:0 0 0 42px;font-size:12px;color:#000000;padding:0px 0 0px 0px"> •&nbsp;   Customize your My World public profile.</p>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td valign="top"  align="left"><p style="margin:0 0 0 42px;font-size:12px;color:#000000;padding:0px 0 0px 0px"> •&nbsp;  Sign up for PayPal, the safer and faster way to pay on eBay.</p>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td valign="top"  height="10" align="left"></td>
                                                </tr>
                                                <tr>
                                                    <td valign="top"   align="left"><img src="https://backend.shopmax.localhost:8443/shopmax-default/img/line-spt.jpg" width="695" height="1" alt="img" border="0" align="left" ></td>
                                                </tr>
                                                <tr>
                                                    <td valign="top"  height="2" align="left"></td>
                                                </tr>
                                                <tr>
                                                    <td  valign="top"  align="left"><p style=" margin:0 0 0 42px;font-size:15px;color:#000000; line-height:26px;padding:0px 0 0px 0px"> If you did not request a new Shopmax account, please contact Shopmax Customer Support for further<br/>
                                                    assistance.</p>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td valign="top"  height="2" align="left"></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <tr>
                        <td valign="top"   align="left">
                            <table width="730" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td valign="top"  height="20" align="left"></td>
                                </tr>
                                <tr>
                                    <td  valign="top"  align="left"><p style=" padding:0;font-size:15px;color:#000000; line-height:26px;margin:0px 0 0px 42px"> eBay sent this message to Shop Max (shopmax123). Learn more</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td  valign="top"  align="left"><p style="  padding:0;font-size:15px;color:#000000; line-height:26px;margin:0px 0 0px 42px"> eBay is committed to your privacy. Learn more about our privacy policy and user agreement.</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td  valign="top"  align="left"><p style="  padding:0;font-size:15px;color:#000000; line-height:26px;margin:0px 0 0px 42px"> &copy; 2013 eBay Inc., 2145 Hamilton Avenue, San Jose, CA 95125</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top"  height="30" align="left"></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </td>
            </tr>
        </table>
    </body>
