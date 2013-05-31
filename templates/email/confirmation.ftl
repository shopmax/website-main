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
        <title>PSD to Email</title>
        <!-- SET: SCRIPTS -->
    </head>
    <body style="margin:0 auto; padding:0;">
        <table width="730" border="0" cellspacing="0" cellpadding="0" align="center">
            <tr>
                <td valign="top" align="left">
                    <table width="730" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td valign="top"  height="26" align="left">&nbsp;</td>
                        </tr>
                        <tr>
                            <td valign="top"  align="left"  height="48" style="padding:0 0 0 18px"><a href="#"><img src="${StringUtil.wrapString(webSite.secureContentPrefix?if_exists)}/shopmax-default/img/logo-img.png" width="202" height="57" alt="img" border="0" align="left"></a></td>
                        </tr>
                        <tr>
                            <td valign="top"  align="left" height="0" style="padding:0 0 0 18px"><p style="margin:0;padding:0;font-family:Georgia, 'Times New Roman', Times, serif;font-style:italic;font-size:19px;color:#469beb">Buy from pros, not Joes</p></td>
                        </tr>
                        <tr>
                            <td valign="top"  height="14" align="left">&nbsp;</td>
                        </tr>
                        <tr>
                            <td valign="top" align="left" height="0" width="730"> <img src="${StringUtil.wrapString(webSite.secureContentPrefix?if_exists)}/shopmax-default/img/border-img.gif" width="727" height="1" alt="line" border="0" align="left"></td>
                        </tr>
                    </table>
                    <table width="730" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td valign="top"  height="23" align="left">&nbsp;</td>
                        </tr>
                        <tr>
                            <td valign="top"  align="left" height="0" style="padding:0 0 0 15px"><p style="margin:0;padding:0;font-family:Arial, Helvetica, sans-serif;font-size:13px;color:#464646">Hi ${orderContext.getSupplierName(partyId)},</p></td>
                        </tr>
                        <tr>
                            <td valign="top"  height="23" align="left">&nbsp;</td>
                        </tr>
                        <tr>
                            <td valign="top"  align="left" height="0" style="padding:0 0 0 15px"><p style="margin:0;padding:0;font-family:Arial, Helvetica, sans-serif;font-size:13px;line-height:20px; color:#464646">
                            Thanks for shopping at 
                            <#list supplierOrderItemsMap.entrySet() as entry>
                            <#assign partyId = entry.getKey()/>
                            <#assign supplierOrderItems = entry.getValue()/> ${orderContext.getSupplierName(partyId)} </#list>! Your order will soon be with you or the recipient of your gift. your order details
                            are below, please check that these are correct, and if any of it is incorrect, contact us immediately so we can make sure the right product gets to the right place for you.</p></td>
                        </tr>
                        <tr>
                            <td valign="top"  height="23" align="left">&nbsp;</td>
                        </tr>
                        <tr>
                            <td valign="top"  align="left" height="0" style="padding:0 0 0 15px"><p style="margin:0;padding:0;font-family:Arial, Helvetica, sans-serif;font-size:13px;line-height:20px; color:#464646">Your order will be dispatched from our distribution centre(s) within the timeframe indicated in the status field below.
                            If your order contains several items, you may receive multiple deliveries to complete your full order.</p></td>
                        </tr>
                        <tr>
                            <td valign="top"  height="53" align="left">&nbsp;</td>
                        </tr>
                    </table>
                    <table width="730"  cellspacing="0" cellpadding="0" >
                        <tr>
                            <td valign="top"  align="left"  height="39"><a href="#"><img src="${StringUtil.wrapString(webSite.secureContentPrefix?if_exists)}/shopmax-default/img/order-img.jpg" width="732" height="39" alt="img" border="0" align="left"></a></td>
                        </tr>
                    </table>
                    <table width="730"  cellspacing="0" cellpadding="0" style="border:1px solid #e1e1e1">
                        <tr>
                            <td valign="top"  height="23" align="left">&nbsp;
                                <table width="730"  cellspacing="0" cellpadding="0" style="border-bottom:1px solid #e1e1e1">
                                    <tr>
                                        <td valign="top"  align="left" width="240"><p style="margin:0;padding:0 0 0 18px;font-family:Arial, Helvetica, sans-serif;font-size:13px; color:#464646"><b> Tax Invoice :</b> </p></td> <#-- 0009439 -->
                                        <td valign="top"  align="left"><p style="margin:0;padding:0 0 0 18px;font-family:Arial, Helvetica, sans-serif;font-size:13px; color:#464646"><b>  Invoice Date :</b> </p></td> <#-- 09/08/2012 -->
                                        <td valign="top"  align="left"><p style="margin:0;padding:0 0 0 18px;font-family:Arial, Helvetica, sans-serif;font-size:13px; color:#464646"><b> GST Number :</b> </p></td> <#-- 74-343-657 -->
                                    </tr>
                                    <tr>
                                        <td valign="top"  height="25" align="left">&nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top"  height="23" align="left">&nbsp;
                                <table width="730"  cellspacing="0" cellpadding="5" >
                                    <tr>
                                        <td valign="top"  align="left" width="240"><p style="margin:0;padding:0 0 0 15px;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-weight:bold; color:#555555">${screens.render("component://shopmax/widget/OrderScreens.xml#ordershippinginfo")}</td> 
                                        <td valign="top"  align="left" width="240"><p style="margin:0;padding:0 0 0 15px;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-weight:bold; color:#555555">${screens.render("component://shopmax/widget/OrderScreens.xml#orderbillinginfo")}</p></td>
                                        <td valign="top"  align="left" width="240"><p style="margin:0;padding:0 0 0 15px;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-weight:bold; color:#555555">${screens.render("component://shopmax/widget/OrderScreens.xml#orderpaymentinfo")}</td>
                                    </tr>
                                    <tr>
                                        <td valign="top"  height="34" align="left"></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <table width="730" border="0" cellspacing="0" cellpadding="0" align="center">
                        <tr>
                            <td valign="top"  height="18" align="left"></td>
                        </tr>
                        <tr>
                        <#list supplierOrderItemsMap.entrySet() as entry>
                            <#assign partyId = entry.getKey()/>
                            <#assign supplierOrderItems = entry.getValue()/>
                            <td  valign="top" align="left" ><p style="margin:0;padding:10px 0 10px 10px;background:#84b234; font-family:Georgia, 'Times New Roman', Times, serif;font-style:italic;font-size:20px;color:#ffffff">${orderContext.getSupplierName(partyId)}</p>
                                <table width="732"  cellspacing="0" cellpadding="0" bgcolor="#555555" style="margin:0 0 0 0px;">
                                    <tr>
                                        <td valign="top"  align="left" width="445"><p style="margin:0;padding:14px 0 14px 18px; font-family:Arial, Helvetica, sans-serif;font-size:13px; color:#ffffff">PRODUCT</p></td>
                                        <td valign="top"  align="left"><p style="margin:0;padding:14px 0 14px 18px;font-family:Arial, Helvetica, sans-serif;font-size:11px; color:#ffffff">UNITPRICE</p></td>
                                        <td valign="top"  align="left"><p style="margin:0;padding:14px 0 14px 18px;font-family:Arial, Helvetica, sans-serif;font-size:11px; color:#ffffff">QUANTITY</p></td>
                                        <td valign="top"  align="left"><p style="margin:0;padding:14px 0 14px 18px;font-family:Arial, Helvetica, sans-serif;font-size:11px; color:#ffffff">SUB TOTAL</p></td>
                                    </tr>
                                </table>
                                <table width="729"  cellspacing="0" cellpadding="0" style="border:1px solid #e1e1e1">  
                                    <tr>
                                        <td valign="top"  align="left"  height="18">
                                            <table width="730"  cellspacing="0" cellpadding="0" style="border-bottom:1px solid #e1e1e1">
                                                <tr>
                                                    <td valign="top"  align="left"  height="18"></td>
                                                </tr>
                                                <#list supplierOrderItems as orderItem>
                                                    <#assign product = orderItem.getRelatedOne("Product", false)/>
                                                    <#assign contentAssocThumbs = ""/>
                                                    <#assign productContentAndInfoImages = Static["org.ofbiz.entity.util.EntityUtil"].filterByDate(delegator.findByAnd("ProductContentAndInfo", {"productId" : product.productId, "productContentTypeId" : "IMAGE", "statusId" : "IM_APPROVED", "drIsPublic" : "Y"}, ["sequenceNum"], false))>
                                                    <#if productContentAndInfoImages?has_content>
                                                        <#assign contentAssocThumbs = delegator.findByAnd("ContentAssocDataResourceViewTo", {"contentIdStart" : productContentAndInfoImages[0].contentId, "caContentAssocTypeId" : "IMAGE_THUMBNAIL"}, null, false)>
                                                    </#if>
                                                    <tr>
                                                        <td valign="top"  align="left"  width="107" style="padding:0 0 0 20px"><a href="#"><img src="<#if contentAssocThumbs?has_content>${StringUtil.wrapString(webSite.secureContentPrefix?if_exists)}${contentAssocThumbs[0].drObjectInfo}<#else>${StringUtil.wrapString(webSite.secureContentPrefix?if_exists)}/images/defaultImage.jpg</#if>" width="100px" height="100px"/></a></td>
                                                        <td valign="top"  align="left" width="326"><p style="margin:0;padding:0 0 0 18px;font-family:Arial, Helvetica, sans-serif;font-size:13px;line-height:20px; color:#464646"><b>${product.productName?if_exists}</b></td>
                                                        <td valign="top"  align="left"><p style="margin:0;padding:0 0 0 18px;font-family:Arial, Helvetica, sans-serif;font-size:13px; color:#464646"><b><@ofbizCurrency amount=orderItem.unitPrice /></b></p></td>
                                                        <td valign="top"><p style="margin:0;padding:0 0 0 18px;font-family:Arial, Helvetica, sans-serif;font-size:13px; color:#464646"><b> ${orderItem.quantity?string.number}</b></p></td>
                                                        <td valign="top"  align="right"><p style="margin:0;padding:0 29px 0 0px;font-family:Arial, Helvetica, sans-serif;font-size:13px; color:#464646"><b> <@ofbizCurrency amount=Static["org.ofbiz.order.order.OrderReadHelper"].getOrderItemSubTotal(orderItem, orderAdjustments)/></b></p></td>
                                                    </tr>
                                                </#list>
                                                <tr>
                                                    <td valign="top"  height="25" align="left">&nbsp;</td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                                <table width="732" border="0" cellspacing="0" cellpadding="0"  style="border:1px solid #dcdcdc;background:#f0f0f0;" >
                                    <tr>
                                        <td valign="top"  height="16" align="left"></td>
                                    </tr>
                                    <tr>
                                        <td valign="top"  align="left"><p style="margin:0;padding:0px 0 0px 18px;font-family:Arial, Helvetica, sans-serif;font-size:13px; color:#464646">You have selected to pick this item up from the store listed below. Your <b>Order Number: ${orderId}</b> You Must present this to the shop in order to pick up your purchase.</p></td>
                                    </tr>
                                    <tr>
                                        <td valign="top"  height="26" align="left">
                                            <table width="730"  cellspacing="0" cellpadding="5" >
                                                <tr>
                                                    <td valign="top"  height="10" align="left"></td>
                                                    <td valign="top"  height="10" align="left"></td>
                                                    <td valign="top"  height="10" align="left"></td>
                                                </tr>
                                                <tr>
                                                    <td valign="top"  align="left" width="240"><p style="margin:0;padding:0 0 0 15px;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-weight:bold; color:#555555">STORE ADDRESS</p></td> 
                                                    <td valign="top"  align="left" width="240"><p style="margin:0;padding:0 0 0 15px;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-weight:bold; color:#555555">PICKUP HOURS</p></td>
                                                </tr>
                                                <tr>
                                                    <td valign="top"  height="0" align="left"></td>
                                                    <td valign="top"  height="0" align="left"></td>
                                                    <td valign="top"  height="0" align="left"></td>
                                                </tr>
                                                <tr>
                                                    <td valign="top"  align="left" width="240"><p style="margin:0;padding:0 0 0 24px;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-weight:bold; color:#555555"></p></td> <#--Store Name -->
                                                    <td valign="top"  align="left" width="240"><p style="margin:0;padding:0 0 0 24px;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-weight:bold; color:#555555"></p></td> <#-- Monday - Friday: 9am - 6p -->
                                                </tr>
                                                <tr>
                                                    <td valign="top"  align="left" width="240"><p style="margin:0;padding:0 0 0 24px;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-weight:bold; color:#555555"></p></td> <#-- Street Address Line one -->
                                                    <td valign="top"  align="left" width="240"><p style="margin:0;padding:0 0 0 24px;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-weight:bold; color:#555555"></p></td> <#-- Saturday: 10am - 4pm -->
                                                </tr>
                                                <tr>
                                                    <td valign="top"  align="left" width="240"><p style="margin:0;padding:0 0 0 24px;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-weight:bold; color:#555555"></p></td> <#-- Street Address Line two -->
                                                    <td valign="top"  align="left" width="240"><p style="margin:0;padding:0 0 0 24px;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-weight:bold; color:#555555"></p></td> <#-- Sunday: Closed -->
                                                </tr>
                                                <tr>
                                                    <td valign="top"  align="left" width="240"><p style="margin:0;padding:0 0 0 24px;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-weight:bold; color:#555555"></p></td> <#-- State -->
                                                </tr>
                                                <tr>
                                                    <td valign="top"  align="left" width="240"><p style="margin:0;padding:0 0 0 24px;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-weight:bold; color:#555555"></p></td> <#-- Phone number xxx xxx xxx -->
                                                </tr>
                                                <tr>
                                                    <td valign="top"  height="18" align="left"></td>
                                                </tr>
                                            </table>
                                        </td>
                                        </#list>
                                    </tr>
                                </table>
                                <table width="732" border="0" cellspacing="0" cellpadding="0"  style="border:1px solid #dcdcdc;" >
                                    <tr>
                                        <td valign="top"  height="20" align="left"></td>
                                    </tr>
                                    <tr>
                                        <td valign="top"  align="left"><p style="margin:0;padding:0px 0 0px 18px;font-family:Arial, Helvetica, sans-serif;font-size:13px; color:#464646">You have received <b>$20 voucher</b> to spend in this shop for your next order.</p></td>
                                    </tr>
                                    <tr>
                                        <td valign="top"  height="38" align="left"></td>
                                    </tr>
                                    <tr>
                                        <td valign="top"  align="left"><p style="margin:0;padding:0px 0 0px 24px;font-family:Arial, Helvetica, sans-serif;font-size:24px; color:#464646">Just enter<font color="#84b234"> SHOP20OFF</font> at checkout</p></td>
                                    </tr>
                                    <tr>
                                        <td valign="top"  height="14" align="left"></td>
                                    </tr>
                                    <tr>
                                        <td valign="top"  align="left"><p style="margin:0;padding:0px 0 0px 18px;font-family:Arial, Helvetica, sans-serif;font-size:13px; color:#464646">Voucher code expires 01/09/2013</p></td>
                                    </tr>
                                    <tr>
                                        <td valign="top"  height="34" align="left"></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <table width="732"  align="center" cellspacing="0" cellpadding="2" style= "border:1px solid #e1e1e1;">
                        <tr>
                            <td valign="top"  height="18" align="left">
                                <table width="330"  cellspacing="0" cellpadding="4" align="right">
                                    <tr>
                                        <td valign="top"  height="10" align="left" width="64%"></td>
                                        <td valign="top"  height="10" align="left" width="30%"></td>
                                    </tr>
                                    <tr>
                                        <td valign="top"  align="right" ><p style="margin:0;padding:0 0 0 15px;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-weight:bold; color:#555555">SHOPPING CART SUB TOTAL</p></td> 
                                        <td valign="top"  align="right" ><p style="margin:0;padding:0 0 0 15px;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-weight:bold; color:#555555"><@ofbizCurrency amount=Static["org.ofbiz.order.order.OrderReadHelper"].getOrderItemSubTotal(orderItem, orderAdjustments)/></p></td>  
                                    </tr>
                                    <tr>
                                        <td valign="top"  align="right"  width="240"><p style="margin:0;padding:0 0 0 15px;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-weight:bold; color:#555555">SHIPPING</p></td> 
                                        <td valign="top"  align="right"  width="240"><p style="margin:0;padding:0 0 0 15px;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-weight:bold; color:#555555"><@ofbizCurrency amount=shippingAmount/></p></td>  
                                    </tr>
                                    <tr>
                                        <td valign="top" align="right"  width="240"><p style="margin:0;padding:0 0 0 15px;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-weight:bold; color:#555555">DISCOUNT</p></td>
                                        <td valign="top"  align="right"  width="240"><p style="margin:0;padding:0 0 0 15px;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-weight:bold; color:#555555"><@ofbizCurrency amount=Static["org.ofbiz.order.order.OrderReadHelper"].getOrderItemAdjustmentsTotal(orderItem, orderAdjustments, true, false, false)/></p></td>  
                                    </tr>
                                    <tr>
                                        <td valign="top"  align="right"  width="240"><p style="margin:0;padding:0 0 0 15px;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-weight:bold; color:#555555">SALES TAX</p></td> 
                                        <td valign="top"  align="right"  width="240"><p style="margin:0;padding:0 0 0 15px;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-weight:bold; color:#555555"><@ofbizCurrency amount=taxAmount /></p></td>
                                    </tr>
                                    <tr>
                                        <td valign="top"  height="5" align="left"></td>
                                        <td valign="top"  height="5" align="left"></td>
                                        <td valign="top"  height="5" align="left"></td>
                                    </tr>
                                    <tr>
                                        <td valign="top"  height="16" align="left"></td> 
                                        <td valign="top"  height="16" align="left"></td>
                                    </tr>
                                    <tr>
                                        <td valign="top"  height="0" width="330" align="left"  style="border-bottom:1px solid #e1e1e1;"></td> 
                                        <td valign="top"  height="0" width="330" align="left"  style="border-bottom:1px solid #e1e1e1;"></td> 
                                    </tr>
                                    <tr>
                                        <td valign="top"  height="16" align="left"></td> 
                                    </tr>
                                    <tr>
                                        <td valign="top"  align="right"><p style="margin:0;padding:0 0 0 15px;font-family:Arial, Helvetica, sans-serif;font-size:12px;font-weight:bold; color:#707070">TOTAL</p></td>
                                        <td valign="top"  align="right"><p style="margin:0;padding:0 0 0 15px;font-family:Arial, Helvetica, sans-serif;font-size:13px;font-weight:bold; color:#469beb"><@ofbizCurrency amount=grandTotal /></p></td>
                                    </tr>
                                    <tr>
                                        <td valign="top"  height="16" align="left"></td> 
                                        <td valign="top"  height="16" align="left"></td> 
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <table width="330"  cellspacing="0" cellpadding="4" align="right">
            <tr><td height="60">&nbsp;</td></tr>
        </table> 
    </body>
</html>
