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

<script type="text/javascript">
    $(document).ready(function() {
        $('#sameAsShipping').click(function(){
            if($(this).is(":checked")){
                $('#useShippingAddressForBilling').val('Y');
                $('#billFirstName').val($('#shipFirstName').val());
                $('#billLastName').val($('#shipLastName').val());
                $('#billPhone').val($('#shipPhone').val());
                $('#billEmail').val($('#shipEmail').val());
                $('#billStreetAddress').val($('#shipStreetAddress').val());
                $('#billPostal').val($('#shipPostal').val());
                $('#billToFaxNumber').val($('#shipToFaxNumber').val());
                $('#billAddressInfo').val($('#shipAddressInfo').val());
                if($('#billToFaxNumber').val().length || $('#billAddressInfo').val().length){
                    $('.billTB').find('input.check').each(function(){
                        $('#'+this.id).attr('readonly','readonly');
                        $('#'+this.id).removeClass('required');
                    });
                    $('#billToFaxNumber').attr('readonly','readonly');
                    $('#billAddressInfo').attr('readonly','readonly');
                }
                if($('#billToAreaCode_chzn').find('span').text() != $('#shipToAreaCode_chzn').find('span').text()){
                    $('#billToAreaCode_chzn').find('span').text($('#shipToAreaCode_chzn').find('span').text());
                    $('#billToAreaCode').val($('#billToAreaCode_chzn').find('span').text());
                }
                if($('#billToFaxNumberArea_chzn').find('span').text() != $('#shipToFaxNumberArea_chzn').find('span').text()){
                    $('#billToFaxNumberArea_chzn').find('span').text($('#shipToFaxNumberArea_chzn').find('span').text());
                    $('#billToFaxNumberArea').val($('#billToFaxNumberArea_chzn').find('span').text());
                }
                if($('#shipDropDown2_chzn').find('span').text() != $('#shipDropDown1_chzn').find('span').text()){
                    $('#shipDropDown2_chzn').find('span').text($('#shipDropDown1_chzn').find('span').text());
                }
                $('.billTB').find('input.check').each(function(){
                    $('#'+this.id).attr('readonly','readonly');
                    $('#'+this.id).removeClass('required');
                });
                $('#billToFaxNumber').attr('readonly','readonly');
                $('#billAddressInfo').attr('readonly','readonly');
                $('#shipFirstName').change(function(){
                    $('#billFirstName').val($('#shipFirstName').val());
                });
                $('#shipLastName').change(function(){
                    $('#billLastName').val($('#shipLastName').val());
                });
                $('#shipPhone').change(function(){
                    $('#billPhone').val($('#shipPhone').val());
                });
                $('#shipEmail').change(function(){
                    $('#billEmail').val($('#shipEmail').val());
                });
                $('#shipToFaxNumber').change(function(){
                    $('#billToFaxNumber').val($('#shipToFaxNumber').val());
                });
                $('#shipStreetAddress').change(function(){
                    $('#billStreetAddress').val($('#shipStreetAddress').val());
                });
                $('#shipPostal').change(function(){
                    $('#billPostal').val($('#shipPostal').val());
                });
                $('#shipAddressInfo').change(function(){
                    $('#billAddressInfo').val($('#shipAddressInfo').val());
                });
                $('#shipToAreaCode').change(function(){
                    $('#billToAreaCode_chzn').find('span').text($('#shipToAreaCode_chzn').find('span').text());
                    $('#billToAreaCode').val($('#billToAreaCode_chzn').find('span').text());
                });
                $('#shipToFaxNumberArea').change(function(){
                    $('#billToFaxNumberArea_chzn').find('span').text($('#shipToFaxNumberArea_chzn').find('span').text());
                     $('#billToFaxNumberArea').val($('#billToFaxNumberArea_chzn').find('span').text());
                });
                $('#shipDropDown1').change(function(){
                    $('#shipDropDown2_chzn').find('span').text($('#shipDropDown1_chzn').find('span').text());
                });
                $('#shipDropDown2_chzn').css({'background-color':'#EEEEEE'});
                $('#shipDropDown2_chzn').find('.chzn-single').each(function(){
                $(this).css({'background-color':'#EEEEEE'});
                });
                $('#billToAreaCode_chzn').css({'background-color':'#EEEEEE'});
                $('#billToAreaCode_chzn').find('.chzn-single').each(function(){
                $(this).css({'background-color':'#EEEEEE'});
                });
                $('#billToFaxNumberArea_chzn').css({'background-color':'#EEEEEE'});
                $('#billToFaxNumberArea_chzn').find('.chzn-single').each(function(){
                $(this).css({'background-color':'#EEEEEE'});
                });
                var position = $('#billToAreaCode_chzn').position().left;
                $('#canvas').attr('style','z-index: 20; left:'+position1+'px;');
                var position1 = $('#billToFaxNumberArea_chzn').position().left;
                $('#canvas1').attr('style','z-index: 20; left:'+position1+'px;');
                var position2 = $('#shipDropDown2_chzn').position().left;
                $('#canvas2').attr('style','z-index: 20; width: 210px; height: 40px; left:'+position2+'px;');
                if($('#returnShipName').val()){
                    var fullName = $('#returnShipName').val();
                    var splitName = fullName.split(" ");
                    $('#billFirstName').val(splitName[0]);
                    $('#billLastName').val(splitName[1]);
                }
                $('#billEmail').attr('value',$('#returnShipEmail').val());
                if($('#returnShipTel').val()){
                    var phoneNum = $('#returnShipTel').val();
                    var splitName = phoneNum.split(" ");
                    $('#billToAreaCode_chzn').find('span').text(splitName[0]);
                    $('#billPhone').val(splitName[1]);
                }
                $('#billStreetAddress').attr('value',$('#returnShipAddress1').val());
                $('#billAddressInfo').attr('value',$('#returnShipAddress2').val());
                $('#shipDropDown2_chzn').find('span').text($('#returnShipCity').val());
                $('#billPostal').attr('value',$('#returnShipPostal').val());
            }
            else{
                $('#useShippingAddressForBilling').val('N');
                $('#billToFaxNumber').attr('value','');
                $('#billAddressInfo').attr('value','');
                $('#billToAreaCode_chzn').find('span').text('03');
                $('#billToFaxNumberArea_chzn').find('span').text('03');
                $('#shipDropDown2_chzn').find('span').text('Zip Return City, State');
                $('#shipDropDown2_chzn').css({'background-color':'#FEF2EE'});
                $('#shipDropDown2_chzn').find('.chzn-single').each(function(){
                    $(this).css({'background-color':'#FEF2EE'});
                });
                $('#billToAreaCode_chzn').css({'background-color':'#FFFFFF'});
                $('#billToAreaCode_chzn').find('.chzn-single').each(function(){
                $(this).css({'background-color':'#FFFFFF'});
                });
                $('#billToFaxNumberArea_chzn').css({'background-color':'#FFFFFF'});
                $('#billToFaxNumberArea_chzn').find('.chzn-single').each(function(){
                $(this).css({'background-color':'#FFFFFF'});
                });
                $('#billToFaxNumber').removeAttr('readonly');
                $('#billAddressInfo').removeAttr('readonly');
                $('.billTB').find('input.check').each(function(){
                    if($(this).val().length){
                        $('#'+this.id).attr('value','');
                        $('#'+this.id).removeAttr('readonly');
                        $('#'+this.id).addClass('required');
                    }
                    else if(!$(this).val().length){
                        $('#'+this.id).addClass('required');
                        $('#'+this.id).removeAttr('readonly');
                    }
                });
                $('#canvas').attr('style','z-index: 20; display:none');
                $('#canvas1').attr('style','z-index: 20; display:none');
                $('#canvas2').attr('style','z-index: 20; display:none');
            }
        });
    });
    $(function(){
        $('input, textarea').placeholder();
        if($('#shipFirstName').val()){
            $('#shipFirstName').removeClass('required');
        }
        if($('#shipLastName').val()){
            $('#shipLastName').removeClass('required');
        }
        if($('#shipEmail').val()){
            $('#shipEmail').removeClass('required');
        }
        if($('#billFirstName').val()){
            $('#billFirstName').removeClass('required');
        }
        if($('#billLastName').val()){
            $('#billLastName').removeClass('required');
        }
        if($('#billEmail').val()){
            $('#billEmail').removeClass('required');
        }
        $('#exp').focus(function(){
            $('#exp').removeClass('required');
        });
        $('.cardNumber').change(function(){
            $('#cardNumber').val($('#cardNumber-0').val()+$('#cardNumber-1').val()+$('#cardNumber-2').val()+$('#cardNumber-3').val());
        });
        $('.main-content').find('input.check,.chzn-container-single').each(function(){
            $('input.check').focus(function(){
                $('#'+this.id).removeClass('required');
                $('#errorCreditCard').attr('style','display:none');
                $('#errorSecure').attr('style','display:none');
                $('#errorCreditExpire').attr('style','display:none');
            });
            $('.chzn-container-single').click(function(){
                $('#'+this.id).css({'background-color':'#FFFFFF'});
                $(this).removeClass('required');
                $('#'+this.id).find('.chzn-single').each(function(){
                    $(this).css({'background-color':'#FFFFFF'});
                    $('#errorCreditCard').attr('style','display:none');
                    $('#errorSecure').attr('style','display:none');
                    $('#errorCreditExpire').attr('style','display:none');
                });
            });
        });
        $('#expMonth_chzn').click(function(){
            $('#creditMonth').val($('#expMonth_chzn').find('span').text());
        });
        $('#expYear_chzn').click(function(){
            $('#creditYear').val($('#expYear_chzn').find('span').text());
        });
        $('#shipAddressDrop').click(function(){
            $('#shipAddressDrop').css({'background-color':'#FFFFFF'});
        });
        $('#billAddressDrop').click(function(){
            $('#billAddressDrop').css({'background-color':'#FFFFFF'});
        });

        $('.summaryButton3').click(function(){
            $('.main-content').find('input.check').each(function(){
                var valid = false;
                if(!$(this).val().length){
                $(this).addClass('required');
                valid = false;
                    if($('select#shipAddressDrop option:selected').val() == 'error'){
                    $('#shipAddressDrop').css({'background-color':'#FEF2EE'});
                        valid = false;
                    }
                    if($('select#billAddressDrop option:selected').val() == 'error2'){
                        $('#billAddressDrop').css({'background-color':'#FEF2EE'});
                        valid = false;
                    }
                }
                else{
                    $(this).removeClass('required');
                    if($('.required').length == 0){
                        valid = true;
                    }
                    if($('select#shipAddressDrop option:selected').val() == 'error'){
                    $('#shipAddressDrop').css({'background-color':'#FEF2EE'});
                        valid = false;
                    }
                    if($('select#billAddressDrop option:selected').val() == 'error2'){
                        $('#billAddressDrop').css({'background-color':'#FEF2EE'});
                        valid = false;
                    }
                }
                if(valid){
                        $('#orderSummarySubmitForm').submit();
                }
            });
        });

        $('.summaryButton2').click(function(){
            $('.main-content').find('input.check').each(function(){
                var valid = false;
                var x=document.forms["orderSummarySubmitForm"]["CUSTOMER_EMAIL"].value;
                var atpos=x.indexOf("@");
                var dotpos=x.lastIndexOf(".");
                
                if(!$(this).val().length){
                $(this).addClass('required');
                $('html, body').animate({ scrollTop: 0 }, 0);
                valid = false;
                    if($('select#shipAddressDrop option:selected').val() == 'error'){
                    $('#shipAddressDrop').css({'background-color':'#FEF2EE'});
                        valid = false;
                    }
                    if($('select#billAddressDrop option:selected').val() == 'error2'){
                        $('#billAddressDrop').css({'background-color':'#FEF2EE'});
                        valid = false;
                    }
                    if($('#shipDropDown1_chzn').find('span').text() == 'Zip Return City, State'){
                        $('#shipDropDown1_chzn').css({'background-color':'#FEF2EE'});
                        $('#shipDropDown1_chzn').find('.chzn-single').each(function(){
                        $(this).css({'background-color':'#FEF2EE'});
                        });
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                }
                else{
                    $(this).removeClass('required');
                    if($('.required').length == 0){
                        valid = true;
                    }
                    if($('select#shipAddressDrop option:selected').val() == 'error'){
                    $('#shipAddressDrop').css({'background-color':'#FEF2EE'});
                        valid = false;
                    }
                    if($('select#billAddressDrop option:selected').val() == 'error2'){
                        $('#billAddressDrop').css({'background-color':'#FEF2EE'});
                        valid = false;
                    }
                    if(atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length){
                        $('#shipEmail').addClass('required');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if(!$('#shipFirstName').val().length){
                        $('#shipFirstName').addClass('required');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if(!$('#shipLastName').val().length){
                        $('#shipLastName').addClass('required');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if(!$('#shipPhone').val().length){
                        $('#shipPhone').addClass('required');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if(!$('#shipEmail').val().length){
                        $('#shipEmail').addClass('required');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if(!$('#shipStreetAddress').val().length){
                        $('#shipStreetAddress').addClass('required');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if(!$('#shipPostal').val().length){
                        $('#shipPostal').addClass('required');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if($('#shipDropDown1_chzn').find('span').text() == 'Zip Return City, State'){
                        $('#shipDropDown1_chzn').css({'background-color':'#FEF2EE'});
                        $('#shipDropDown1_chzn').find('.chzn-single').each(function(){
                        $(this).css({'background-color':'#FEF2EE'});
                        });
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                }
                if(valid){
                        $('#orderSummarySubmitForm').submit();
                }
            });
        });

        $('.summaryButton1').click(function(){
            $('.main-content').find('input.check').each(function(){
                var valid = false;
                var y=document.forms["orderSummarySubmitForm"]["billEmail"].value;
                var atpos1=y.indexOf("@");
                var dotpos1=y.lastIndexOf(".");
                
                if(!$(this).val().length){
                $(this).addClass('required');
                valid = false;
                    if($('select#shipAddressDrop option:selected').val() == 'error'){
                    $('#shipAddressDrop').css({'background-color':'#FEF2EE'});
                        valid = false;
                    }
                    if($('select#billAddressDrop option:selected').val() == 'error2'){
                        $('#billAddressDrop').css({'background-color':'#FEF2EE'});
                        valid = false;
                    }
                    if($('#shipDropDown2_chzn').find('span').text() == 'Zip Return City, State'){
                        $('#shipDropDown2_chzn').css({'background-color':'#FEF2EE'});
                        $('#shipDropDown2_chzn').find('.chzn-single').each(function(){
                        $(this).css({'background-color':'#FEF2EE'});
                        });
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                }
                else{
                    $(this).removeClass('required');
                    if($('.required').length == 0){
                        valid = true;
                    }
                    if($('select#shipAddressDrop option:selected').val() == 'error'){
                    $('#shipAddressDrop').css({'background-color':'#FEF2EE'});
                        valid = false;
                    }
                    if($('select#billAddressDrop option:selected').val() == 'error2'){
                        $('#billAddressDrop').css({'background-color':'#FEF2EE'});
                        valid = false;
                    }
                    if(atpos1<1 || dotpos1<atpos1+2 || dotpos1+2>=y.length){
                        $('#billEmail').addClass('required');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if(!$('#billFirstName').val().length){
                        $('#billFirstName').addClass('required');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if(!$('#billLastName').val().length){
                        $('#billLastName').addClass('required');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if(!$('#billPhone').val().length){
                        $('#billPhone').addClass('required');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if(!$('#billEmail').val().length){
                        $('#billEmail').addClass('required');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if(!$('#billStreetAddress').val().length){
                        $('#billStreetAddress').addClass('required');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if(!$('#billPostal').val().length){
                        $('#billPostal').addClass('required');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if($('#shipDropDown2_chzn').find('span').text() == 'Zip Return City, State'){
                        $('#shipDropDown2_chzn').css({'background-color':'#FEF2EE'});
                        $('#shipDropDown2_chzn').find('.chzn-single').each(function(){
                        $(this).css({'background-color':'#FEF2EE'});
                        });
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                }
                if(valid){
                        $('#orderSummarySubmitForm').submit();
                }
            });
        });

        $('.processOrderSummaryButton').click(function(){
            $('.main-content').find('input.check').each(function(){
                var valid = false;
                var x=document.forms["orderSummarySubmitForm"]["CUSTOMER_EMAIL"].value;
                var atpos=x.indexOf("@");
                var dotpos=x.lastIndexOf(".");
                var y=document.forms["orderSummarySubmitForm"]["billEmail"].value;
                var atpos1=y.indexOf("@");
                var dotpos1=y.lastIndexOf(".");
                var value = $('#cardNumber').val();
                var nCheck = 0,
                nDigit = 0,
                bEven = false;
                var currentTime = new Date()
                
                if(!$(this).val().length){
                    $(this).addClass('required');
                    $('html, body').animate({ scrollTop: 0 }, 0);
                    valid = false;
                    if($('#shipDropDown1_chzn').find('span').text() == 'Zip Return City, State'){
                        $('#shipDropDown1_chzn').css({'background-color':'#FEF2EE'});
                        $('#shipDropDown1_chzn').find('.chzn-single').each(function(){
                        $(this).css({'background-color':'#FEF2EE'});
                        });
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if(!$('#sameAsShipping').is(":checked")){
                        if($('#shipDropDown2_chzn').find('span').text() == 'Zip Return City, State'){
                            $('#shipDropDown2_chzn').css({'background-color':'#FEF2EE'});
                            $('#shipDropDown2_chzn').find('.chzn-single').each(function(){
                            $(this).css({'background-color':'#FEF2EE'});
                            });
                            $('html, body').animate({ scrollTop: 0 }, 0);
                            valid = false;
                        }
                    }
                    if($('#sameAsShipping').is(":checked")){
                        if($('#shipDropDown2_chzn').find('span').text() == 'Zip Return City, State'){
                            $('#shipDropDown2_chzn').css({'background-color':'#EEEEEE'});
                            $('#shipDropDown2_chzn').find('.chzn-single').each(function(){
                            $(this).css({'background-color':'#EEEEEE'});
                            });
                        }
                    }
                    if($('#paymentDropDown_chzn').find('span').text() == 'Select Card Type'){
                        $('#paymentDropDown_chzn').css({'background-color':'#FEF2EE'});
                        $('#paymentDropDown_chzn').find('.chzn-single').each(function(){
                        $(this).css({'background-color':'#FEF2EE'});
                        });
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if($('#expMonth_chzn').find('span').text() == 'Month'){
                        $('#expMonth_chzn').css({'background-color':'#FEF2EE'});
                        $('#expMonth_chzn').find('.chzn-single').each(function(){
                        $(this).css({'background-color':'#FEF2EE'});
                        });
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if($('#expYear_chzn').find('span').text() == 'Year'){
                        $('#expYear_chzn').css({'background-color':'#FEF2EE'});
                        $('#expYear_chzn').find('.chzn-single').each(function(){
                        $(this).css({'background-color':'#FEF2EE'});
                        });
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                }
                else{
                    $(this).removeClass('required');
                    if($('.required').length == 0){
                        valid = true;
                    }
                    if(atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length){
                        $('#shipEmail').addClass('required');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if(!$('#shipFirstName').val().length){
                        $('#shipFirstName').addClass('required');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if(!$('#shipLastName').val().length){
                        $('#shipLastName').addClass('required');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if(!$('#shipPhone').val().length){
                        $('#shipPhone').addClass('required');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if(!$('#shipEmail').val().length){
                        $('#shipEmail').addClass('required');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if(!$('#shipStreetAddress').val().length){
                        $('#shipStreetAddress').addClass('required');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if(!$('#shipPostal').val().length){
                        $('#shipPostal').addClass('required');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if(!$('#sameAsShipping').is(":checked")){
                        if(atpos1<1 || dotpos1<atpos1+2 || dotpos1+2>=y.length){
                            $('#billEmail').addClass('required');
                            $('html, body').animate({ scrollTop: 0 }, 0);
                            valid = false;
                        }
                        if(!$('#billFirstName').val().length){
                            $('#billFirstName').addClass('required');
                            $('html, body').animate({ scrollTop: 0 }, 0);
                            valid = false;
                        }
                        if(!$('#billLastName').val().length){
                            $('#billLastName').addClass('required');
                            $('html, body').animate({ scrollTop: 0 }, 0);
                            valid = false;
                        }
                        if(!$('#billPhone').val().length){
                            $('#billPhone').addClass('required');
                            $('html, body').animate({ scrollTop: 0 }, 0);
                            valid = false;
                        }
                        if(!$('#billEmail').val().length){
                            $('#billEmail').addClass('required');
                            $('html, body').animate({ scrollTop: 0 }, 0);
                            valid = false;
                        }
                        if(!$('#billStreetAddress').val().length){
                            $('#billStreetAddress').addClass('required');
                            $('html, body').animate({ scrollTop: 0 }, 0);
                            valid = false;
                        }
                        if(!$('#billPostal').val().length){
                            $('#billPostal').addClass('required');
                            $('html, body').animate({ scrollTop: 0 }, 0);
                            valid = false;
                        }
                        if($('#shipDropDown2_chzn').find('span').text() == 'Zip Return City, State'){
                            $('#shipDropDown2_chzn').css({'background-color':'#FEF2EE'});
                            $('#shipDropDown2_chzn').find('.chzn-single').each(function(){
                            $(this).css({'background-color':'#FEF2EE'});
                            });
                            $('html, body').animate({ scrollTop: 0 }, 0);
                            valid = false;
                        }
                    }
                    if($('#sameAsShipping').is(":checked")){
                        if(atpos1<1 || dotpos1<atpos1+2 || dotpos1+2>=y.length){
                            $('#billEmail').removeClass('required');
                        }
                        if(!$('#billFirstName').val().length){
                            $('#billFirstName').removeClass('required');
                        }
                        if(!$('#billLastName').val().length){
                            $('#billLastName').removeClass('required');
                        }
                        if(!$('#billPhone').val().length){
                            $('#billPhone').removeClass('required');
                        }
                        if(!$('#billEmail').val().length){
                            $('#billEmail').removeClass('required');
                        }
                        if(!$('#billStreetAddress').val().length){
                            $('#billStreetAddress').removeClass('required');
                        }
                        if(!$('#billPostal').val().length){
                            $('#billPostal').removeClass('required');
                        }
                        if($('#shipDropDown2_chzn').find('span').text() == 'Zip Return City, State'){
                            $('#shipDropDown2_chzn').css({'background-color':'#EEEEEE'});
                            $('#shipDropDown2_chzn').find('.chzn-single').each(function(){
                            $(this).css({'background-color':'#EEEEEE'});
                            });
                        }
                    }
                    if(!$('#firstNameOnCard').val().length){
                        $('#firstNameOnCard').addClass('required');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if(!$('#lastNameOnCard').val().length){
                        $('#lastNameOnCard').addClass('required');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if(!$('#cardNumber-0').val().length){
                        $('#cardNumber-0').addClass('required');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if(!$('#cardNumber-1').val().length){
                        $('#cardNumber-1').addClass('required');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if(!$('#cardNumber-2').val().length){
                        $('#cardNumber-2').addClass('required');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if(!$('#cardNumber-3').val().length){
                        $('#cardNumber-3').addClass('required');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if(!$('#secureCode').val().length){
                        $('#secureCode').addClass('required');
                        $('#errorSecure').attr('style','');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if($('#shipDropDown1_chzn').find('span').text() == 'Zip Return City, State'){
                        $('#shipDropDown1_chzn').css({'background-color':'#FEF2EE'});
                        $('#shipDropDown1_chzn').find('.chzn-single').each(function(){
                        $(this).css({'background-color':'#FEF2EE'});
                        });
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if($('#paymentDropDown_chzn').find('span').text() == 'Select Card Type'){
                        $('#paymentDropDown_chzn').css({'background-color':'#FEF2EE'});
                        $('#paymentDropDown_chzn').find('.chzn-single').each(function(){
                        $(this).css({'background-color':'#FEF2EE'});
                        });
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if($('#expMonth_chzn').find('span').text() == 'Month'){
                        $('#expMonth_chzn').css({'background-color':'#FEF2EE'});
                        $('#expMonth_chzn').find('.chzn-single').each(function(){
                        $(this).css({'background-color':'#FEF2EE'});
                        });
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if($('#expYear_chzn').find('span').text() == 'Year'){
                        $('#expYear_chzn').css({'background-color':'#FEF2EE'});
                        $('#expYear_chzn').find('.chzn-single').each(function(){
                        $(this).css({'background-color':'#FEF2EE'});
                        });
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if($('#expYear_chzn').find('span').text() < currentTime.getFullYear()){
                        valid = false;
                    }
                    if($('#expYear_chzn').find('span').text() == currentTime.getFullYear()){
                        if($('#expMonth_chzn').find('span').text() < currentTime.getMonth() + 1){
                        $('#errorCreditExpire').attr('style','');
                        valid = false;
                        }
                    }
                    
                    for (var n = value.length - 1; n >= 0; n--) {
                        var cDigit = value.charAt(n);
                        nDigit = parseInt(cDigit, 10);
                        if (bEven) {
                            if ((nDigit *= 2) > 9) {
                                nDigit -= 9;
                            }
                        }
                        nCheck += nDigit;
                        bEven = !bEven;
                    }
                    if(nCheck % 10 == 0){
                        $('#errorCreditCard').attr('style','display:none');
                    }
                    else if(nCheck % 10 != 0){
                        $('#errorCreditCard').attr('style','');
                        $('.cardNumber').addClass('required');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid=false;
                    }
                }
                if(valid){
                    $('#orderSummarySubmitForm').submit();
                }
            });
        });
    });
    function isNumberKey(evt) {
        var charCode = (evt.which) ? evt.which : evt.keyCode
        if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;
        return true;
     }
</script>
<style>
    canvas{
        width: 65px;
        height: 40px;
        /*border: 1px solid black;*/
        display: block;
        position: absolute;
    }
</style>

<#macro maskSensitiveNumber cardNumber>
  <#assign cardNumberDisplay = "">
  <#if cardNumber?has_content>
    <#assign size = cardNumber?length - 4>
    <#if (size > 0)>
      <#list 0 .. size-1 as foo>
        <#assign cardNumberDisplay = cardNumberDisplay + "*">
      </#list>
      <#assign cardNumberDisplay = cardNumberDisplay + cardNumber[size .. size + 3]>
    <#else>
      <#-- but if the card number has less than four digits (ie, it was entered incorrectly), display it in full -->
      <#assign cardNumberDisplay = cardNumber>
    </#if>
  </#if>
  ${cardNumberDisplay?if_exists}
</#macro>

<div class="container content shopping-cart">
    <!-- include breadcrumb -->
    ${screens.render("component://shopmax/widget/ShopMaxScreens.xml#Breadcrumbs")}
    <div class="row">
        <#include "component://shopmax/webapp/shopmax/order/ordersummary.ftl" />
        <form id="orderSummarySubmitForm" action="<@ofbizUrl>onePageProcess</@ofbizUrl>" method="post">
            <#if shoppingCartItems?has_content>
                <#if shoppingCartItems?is_sequence>
                    <#list shoppingCartItems as shoppingCartItem>
                        <input type="hidden" name="shoppingCartItems" value="${shoppingCartItem}"/>
                    </#list>
                <#else>
                    <input type="hidden" name="shoppingCartItems" value="${shoppingCartItem}"/>
                </#if>
            </#if>
            <#if branchStoreList?has_content>
                <#if branchStoreList?is_sequence>
                    <#list branchStoreList as branchStore>
                        <input type="hidden" name="scBranchStoreList" value="${branchStore}"/>
                    </#list>
                <#else>
                    <input type="hidden" name="scBranchStores" value="${branchStoreList}"/>
                </#if>
            </#if>
            <#if userLogin?has_content>
                <#assign partyName = delegator.findOne("PartyNameView", {"partyId" : userLogin.partyId}, true) />
            </#if> 
            <#-- Shipping Options -->
            <#assign supplierIndex = -1/>
            <#list supplierCarrierMap.keySet() as partyId>
                <#assign supplierIndex = supplierIndex + 1/>
                <#assign carrierPartyId = supplierCarrierMap.get(partyId)/>
                <input type="hidden" name="shipmentCarrierPartyId:${partyId}_o_${supplierIndex}" value="${carrierPartyId}"/>
            </#list>
            <#assign supplierIndex = -1/>
            <#list supplierShipmentMethodTypeMap.keySet() as partyId>
                <#assign supplierIndex = supplierIndex + 1/>
                <#assign shipmentMethodTypeId = supplierShipmentMethodTypeMap.get(partyId)/>
                <input" type="hidden" name="shipmentMethodTypeId:${partyId}_o_${supplierIndex}" value="${shipmentMethodTypeId}/>
            </#list>
            <div class="span9 main-content">
                <ul class="sc-step">
                    <li><span class="badge badge-inactive">1</span><a href="/control/shoppingcart" id="shoppingCartLink" style="text-decoration : none;">&nbsp;&nbsp;Shopping Cart</a></li>
                    <li class="step-active"><span class="badge badge-active">2</span>&nbsp;&nbsp;Billing & Delivery</li>
                    <li><span class="badge badge-inactive">3</span>&nbsp;&nbsp;Complete</li>
                </ul>
                <br />
                <div class="billing_de">
                    <#if contactMechList?has_content>
                        <input type="hidden" value="${shipToTelecomNumber.contactMechId}" name="shipToPhoneContactMechId">
                        <input type="hidden" value="${shipToName?if_exists}" name="returnShipName" id="returnShipName">
                        <input type="hidden" value="${emailAddress?if_exists}" name="returnShipEmail" id="returnShipEmail">
                        <input type="hidden" value="${shipToAddress1?if_exists}" name="returnShipAddress1" id="returnShipAddress1">
                        <input type="hidden" value="${shipToAddress2?if_exists}" name="returnShipAddress2" id="returnShipAddress2">
                        <input type="hidden" value="${shipToPostalCode?if_exists}" name="returnShipPostal" id="returnShipPostal">
                        <input type="hidden" value="${shipToCity?if_exists}" name="returnShipCity" id="returnShipCity">
                        <input type="hidden" value="${shipToTelecomNumber.areaCode?if_exists} ${shipToTelecomNumber.contactNumber?if_exists}" name="returnShipTel" id="returnShipTel">
                        <div class="shipp_info">
                            <div class="tital_1">Shipping Information</div>
                            <div class="row">
                                <div class="span5">
                                    <div class="column_1">
                                        <select name="shipToContactMechId" id="shipAddressDrop" class="span4">
                                            <#if contactMechList?has_content>
                                                <#list contactMechList as contactMech>
                                                    <#assign postalAddress = contactMech.getRelatedOne("PostalAddress", false)?if_exists/>
                                                    <#assign stateProvinceGeo = postalAddress.getRelatedOne("StateProvinceGeo", false)?if_exists>
                                                    <option value="${postalAddress.contactMechId}">${postalAddress.toName?default("No Contact Name")} - ${postalAddress.address1?if_exists}</option>
                                                </#list>
                                            </#if>
                                        </select>
                                        <h5>ship to</h5>
                                        <ul>
                                            <li>${shipToName?if_exists}</li>
                                            <li>${emailAddress?if_exists}</li>
                                            <li>${shipToAddress1?if_exists}</li>
                                            <li>${shipToAddress2?if_exists}</li>
                                            <li>${shipToCity?if_exists} ${shipToPostalCode?if_exists}</li>
                                            <#if shipToTelecomNumber?has_content><li>Phone number ${shipToTelecomNumber.areaCode}-${shipToTelecomNumber.contactNumber}</li></#if>
                                        </ul>
                                    </div>
                                </div>
                                <div class="span4">
                                    <div class="column_2"><a href="#" class="pull-right">Edit Shipping Address</a></div>
                                </div>
                            </div>
                        </div>
                    <#else>
                        <input type="hidden" name="keepAddressBook" value="Y">
                        <input type="hidden" name="setDefaultShipping" value="Y">
                        <input type="hidden" name="shipToCountryCode" value="64">
                        <table class="table table-condensed sc-table sc-table-shipping">
                          <thead>
                            <tr class="sc-table-product-header">
                              <th class="col1">Shipping Information</th>
                            </tr>
                          </thead>
                          <tbody>
                            <tr>
                                <td class="col1">
                                    <label id="errorCreditCard" name="errorCreditCard" class="errorCreditCard" style="display:none">Please enter a valid credit card number.</label>
                                    <label id="errorSecure" name="errorCreditCard" class="errorCreditCard" style="display:none">Please enter a security code.</label>
                                    <label id="errorCreditExpire" name="errorCreditCard" class="errorCreditCard" style="display:none">Expired credit card.</label>
                                    <h5 class="heading">Shipping Contact</h5>
                                    <div class="form-inline">
                                        <input type="text" id="shipFirstName" class="input-xxlarge check required" name="USER_FIRST_NAME" placeholder="First Name" value="${partyName.firstName?if_exists}" />
                                        <input type="text" id="shipLastName" class="input-xxlarge check required" name="USER_LAST_NAME" placeholder="Last Name" value="${partyName.lastName?if_exists}" />
                                    </div>
                                    <div class="form-inline">
                                        <select id="shipToAreaCode" name="shipToAreaCode" class="chosen contactNumber" style="width: 60px;">
                                            <option selected="selected">03</option>
                                            <option>04</option>
                                            <option>06</option>
                                            <option>07</option>
                                            <option>09</option>
                                            <option>020</option>
                                            <option>021</option>
                                            <option>022</option>
                                            <option>027</option>
                                            <option>028</option>
                                            <option>029</option>
                                            <option>0508</option>
                                            <option>0800</option>
                                        </select>
                                        <input name="shipToContactNumber" type="text" id="shipPhone" class="input-xxlarge check required" placeholder="Phone Number" onkeypress="return isNumberKey(event)" style="width: 135px;"/>
                                        <input name="CUSTOMER_EMAIL" type="text" id="shipEmail" class="input-xxlarge check required" placeholder="Email Address" value="${userLogin.userLoginId?if_exists}" />
                                        <select id="shipToFaxNumberArea" name="shipToFaxNumberArea" class="chosen contactNumber" style="width: 60px;">
                                            <option selected="selected">03</option>
                                            <option>04</option>
                                            <option>06</option>
                                            <option>07</option>
                                            <option>09</option>
                                            <option>0508</option>
                                            <option>0800</option>
                                        </select>
                                        <input type="text" class="input-xxlarge" placeholder="Fax Number" id="shipToFaxNumber" name="shipToFaxNumber" onkeypress="return isNumberKey(event)" style="width: 135px;"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="col1">
                                    <h5 class="heading">Shipping Address</h5>
                                    <div class="form-inline">
                                        <input type="text" id="shipStreetAddress" class="input-xxxlarge check required" name="shipToAddress1" placeholder="Street Address" />
                                        <input type="text" id="shipPostal" class="input-xxlarge check required" name="shipToPostalCode" onkeypress="return isNumberKey(event)" placeholder="Zip/ Postal Code" />
                                    </div>
                                    <div class="form-inline">
                                        <input type="text" class="input-xxxlarge" name="shipToAddress2" id="shipAddressInfo" placeholder="Additional Address Info (optional)" />
                                        <select id="shipDropDown1" name="shipToCity" class="drop-select chosen combo" data-search-bar="true">
                                            <option value="" selected="selected">Zip Return City, State</option>
                                            <option value="Auckland">Auckland</option>
                                            <option value="Christ Church">Christ Church</option>
                                            <option value="Wellington">Wellington</option>
                                        </select>
                                    </div>
                                </td>
                            </tr>
                          </tbody>
                        </table>
                    </#if>
                    
                    <#if billPaymentMethod?has_content && billToName?has_content>
                        <#-- Billing Informatioin -->
                        <input type="hidden" name="billToContactMechId" value="${billToContactMechId?if_exists}"/>
                        <input type="hidden" name="billToName" value="${billToName?if_exists}"/>
                        <input type="hidden" name="billToAttnName" value="${billToAttnName?if_exists}"/>
                        <input type="hidden" name="billToAddress1" value="${billToAddress1?if_exists}"/>
                        <input type="hidden" name="billToAddress2" value="${billToAddress2?if_exists}"/>
                        <input type="hidden" name="billToCity" value="${billToCity?if_exists}"/>
                        <input type="hidden" name="billToPostalCode" value="${billToPostalCode?if_exists}"/>
                        <input type="hidden" name="billToStateProvinceGeoId" value="${billToStateProvinceGeoId?if_exists}"/>
                        <input type="hidden" name="billToPhoneContactMechId" value="${billToTelecomNumber.contactMechId}">
                        <input type="hidden" name="billToCountryCode" value="${billToTelecomNumber.countryCode?if_exists}"/>
                        <input type="hidden" name="billToAreaCode" value="${billToTelecomNumber.areaCode?if_exists}"/>
                        <input type="hidden" name="billToContactNumber" value="${billToTelecomNumber.contactNumber?if_exists}"/>
                        <div class="shipp_info">
                            <div class="tital_1">Billing Information</div>
                            <div class="row">
                                <div class="span5">
                                    <div class="column_1">
                                        <select name="paymentMethodId" id="billAddressDrop" class="span3">
                                            <#if billPaymentMethod?has_content>
                                                <#list billPaymentMethod as paymentMethod>
                                                    <#assign creditCard = paymentMethod.getRelatedOne("CreditCard", false)?if_exists/>
                                                    <option value="${creditCard.paymentMethodId}"><@maskSensitiveNumber cardNumber=cardNumber?if_exists/> Exp: ${(creditCard.expireDate).substring(0, 2)}/${(creditCard.expireDate).substring(3)}</option><#--Visa ••••••••••••1234 Exp: 03/03/2013-->
                                                </#list>
                                            </#if>
                                        </select>
                                        <h5>bill to</h5>
                                        <ul>
                                            <li>${billToName?if_exists}</li>
                                            <li>${emailAddress?if_exists}</li>
                                            <li>${billToAddress1?if_exists}</li>
                                            <li>${billToAddress2?if_exists}</li>
                                            <li>${billToCity?if_exists} ${billToPostalCode?if_exists}</li>
                                            <#if billToTelecomNumber?has_content><li>Phone number ${billToTelecomNumber.areaCode}-${billToTelecomNumber.contactNumber}</li></#if>
                                        </ul>
                                    </div>
                                </div>
                                <div class="span4">
                                    <div class="column_2">
                                        <a href="#" class="pull-right clearfix">Edit Billing information</a>
                                        <div class="clearfix"></div>
                                        <h5>Payment Information</h5>
                                        <ul>
                                            <li></li>
                                            <li><@maskSensitiveNumber cardNumber=cardNumber?if_exists/></li><#--••••••••••••1234 -->
                                            <li>Exp:</li>
                                            <li class="lastbox">
                                                <input type="text" id="exp" class="span1 textb check required" maxlength="4">
                                                <div class="card"><img src="<@ofbizContentUrl>/shopmax-default/img/icon-card.gif</@ofbizContentUrl>" alt=""></div>
                                                <a href="#" class="what">What is this ?</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <#else>
                        <#-- Billing Information -->
                        <input type="hidden" id="paymentMethodId" name="paymentMethodId" value="${paymentMethodId?if_exists}" />
                        <input type="hidden" id="paymentMethodTypeId" name="paymentMethodTypeId" value="${paymentMethodTypeId?default("CREDIT_CARD")}" />
                        <input type="hidden" name="keepAddressBook" value="Y">
                        <input type="hidden" name="setDefaultBilling" value="Y">
                        <input type="hidden" name="billToCountryCode" value="64">
                        <input type="hidden" id="useShippingAddressForBilling" name="useShippingAddressForBilling" value="N">
                        
                        <table class="table table-condensed sc-table sc-table-shipping">
                          <thead>
                            <tr class="sc-table-product-header">
                              <th class="col1"><div class="pull-left">Billing Information</div>
                                  <label class="same-as">
                                    <input type="checkbox" id="sameAsShipping">Same as shipping information
                                  </label>
                              </th>
                            </tr>
                          </thead>
                          <tbody>
                            <tr id="tr-shipping-contact">
                                <td class="col1 billTB">
                                    <h5 class="heading">Billing Contact</h5>
                                    
                                    <div class="form-inline">
                                        <input type="text" name="billFirstName" id="billFirstName" class="input-xxlarge check required" placeholder="First Name" value="${partyName.firstName?if_exists}" />
                                        <input type="text" name="billLastName" id="billLastName" class="input-xxlarge check required" placeholder="Last Name" value="${partyName.lastName?if_exists}" />
                                    </div>
                                    <div class="form-inline">
                                        <canvas id="canvas" style="z-index: 20; display:none" oncontextmenu="return false;"></canvas>
                                        <canvas id="canvas1" style="z-index: 20; display:none" oncontextmenu="return false;"></canvas>
                                        <select id="billToAreaCode" name="billToAreaCode" class="chosen contactNumber" style="width: 60px;">
                                            <option selected="selected">03</option>
                                            <option>04</option>
                                            <option>06</option>
                                            <option>07</option>
                                            <option>09</option>
                                            <option>020</option>
                                            <option>021</option>
                                            <option>022</option>
                                            <option>027</option>
                                            <option>028</option>
                                            <option>029</option>
                                            <option>0508</option>
                                            <option>0800</option>
                                        </select>
                                        <input name="billToContactNumber" type="text" id="billPhone" class="input-xxlarge check required" placeholder="Phone Number" onkeypress="return isNumberKey(event)" style="width: 135px;"/>
                                        <input type="text" id="billEmail" class="input-xxlarge check required" name="billEmail" placeholder="Email Address" value="${userLogin.userLoginId?if_exists}" />
                                        <select name="billToFaxNumberArea" id="billToFaxNumberArea" class="chosen contactNumber" style="width: 60px;">
                                            <option selected="selected">03</option>
                                            <option>04</option>
                                            <option>06</option>
                                            <option>07</option>
                                            <option>09</option>
                                            <option>0508</option>
                                            <option>0800</option>
                                        </select>
                                        <input type="text" name="billToFaxNumber" class="input-xxlarge" placeholder="Fax Number" id="billToFaxNumber" onkeypress="return isNumberKey(event)" style="width: 135px;"/>
                                    </div>
                                </td>
                            </tr>
                            <tr id="tr-shipping-address">
                                <td class="col1 billTB">
                                    <h5 class="heading">Billing Address</h5>
                                    
                                    <div class="form-inline">
                                        <input type="text" id="billStreetAddress" class="input-xxxlarge check required" name="billToAddress1" placeholder="Street Address" />
                                        <input type="text" id="billPostal" class="input-xxlarge check required" name="billToPostalCode" onkeypress="return isNumberKey(event)" placeholder="Zip/ Postal Code" />
                                    </div>
                                    <div class="form-inline">
                                        <canvas id="canvas2" style="z-index: 20; width: 210px; height: 40px; display:none" oncontextmenu="return false;"></canvas>
                                        <input type="text" class="input-xxxlarge" id="billAddressInfo" name="billToAddress2" placeholder="Additional Address Info (optional)" />
                                        <select id="shipDropDown2" name="billToCity" class="drop-select chosen combo" data-search-bar="true">
                                            <option value="" selected="selected">Zip Return City, State</option>
                                            <option value="Auckland">Auckland</option>
                                            <option value="Christ Church">Christ Church</option>
                                            <option value="Wellington">Wellington</option>
                                        </select>
                                    </div>
                                </td>
                            </tr>
                            
                            <#-- Payment Information -->
                            
                            <tr>
                                <td class="col1">
                                    <h5 class="heading">Payment Information</h5>
                                    <div class="form-inline">
                                        <input type="text" id="firstNameOnCard" class="input-xxlarge check required" name="firstNameOnCard" placeholder="First Name" />
                                        <input type="text" id="lastNameOnCard" class="input-xxlarge check required" name="lastNameOnCard" placeholder="Last Name" />
                                    </div>
                                    <div class="form-inline">
                                        <select id="paymentDropDown" name="cardType" class="drop-select chosen combo" data-search-bar="true">
                                            <option value="" selected="selected">Select Card Type</option>
                                            <option value="Visa">Visa</option>
                                            <option value="MasterCard">Master Card</option>
                                        </select>
                                        <#-- Example card number: 4111111111111111 -->
                                        <#-- <input name="cardNumber" type="text" class="input-xxlarge required" placeholder="Card Number" />-->
                                        <input type="text" maxlength="4" class="input-small cardNumber check required" id="cardNumber-0" onkeypress='return isNumberKey(event)' autocomplete="off"> - <input type="text" maxlength="4" class="input-small cardNumber check required" id="cardNumber-1" onkeypress='return isNumberKey(event)' autocomplete="off"> - <input type="text" maxlength="4" class="input-small cardNumber check required" id="cardNumber-2" onkeypress='return isNumberKey(event)' autocomplete="off"> - <input type="text" maxlength="4" class="input-small cardNumber check required" id="cardNumber-3" onkeypress='return isNumberKey(event)' autocomplete="off">
                                        <input type="hidden" id="cardNumber" name="cardNumber">
                                    </div>
                                    <div class="form-inline">
                                        <strong class="grey">Expires</strong>&nbsp;
                                        <#assign expMonth = "">
                                            <#assign expYear = "">
                                            <#if creditCard?exists && creditCard.expireDate?exists>
                                                <#assign expDate = creditCard.expireDate>
                                                <#if (expDate?exists && expDate.indexOf("/") > 0)>
                                                    <#assign expMonth = expDate.substring(0,expDate.indexOf("/"))>
                                                    <#assign expYear = expDate.substring(expDate.indexOf("/")+1)>
                                                </#if>
                                            </#if>
                                            <select name="expMonth" id="expMonth" class="chosen expireDate">
                                                <option value="">Month</option>
                                                ${screens.render("component://common/widget/CommonScreens.xml#ccmonths")}
                                            </select>
                                            <select name="expYear" id="expYear" class="chosen expireDate">
                                                <option value="">Year</option>
                                                ${screens.render("component://common/widget/CommonScreens.xml#ccyears")}
                                            </select>
                                            <input type="hidden" id="creditMonth" name="creditMonth"/>
                                            <input type="hidden" id="creditYear" name="creditYear"/>
                                            <input name="billToCardSecurityCode" type="text" id="secureCode" class="input-medium check required" placeholder="Security Code" onkeypress="return isNumberKey(event)" maxlength="4" autocomplete="off"/>
                                        <img src="<@ofbizContentUrl>/shopmax-default/img/icon-card.gif</@ofbizContentUrl>" />
                                        <a href="#">What is this?</a>
                                    </div>
                                </td>
                            </tr>
                          </tbody>
                        </table>
                    </#if>
                    <div class="shipp_info">
                        <#include "component://shopmax/webapp/shopmax/order/ordersummarydetail.ftl" />
                    </div>
                </div>
                
                <input type="button" style="display: none;" id="processingOrderSummaryButton" name="processingOrderSummaryButton" value="${uiLabelMap.OrderSubmittingOrder}" />
                <#if !contactMechList?has_content && billPaymentMethod?has_content>
                    <input type="button" id="summaryButton2" name="summaryButton2" class="btn-general pull-right summaryButton2" value="Place Order" />
                </#if>
                <#if !billPaymentMethod?has_content && contactMechList?has_content>
                    <input type="button" id="summaryButton1" name="summaryButton1" class="btn-general pull-right summaryButton1" value="Place Order" />
                </#if>
                <#if contactMechList?has_content && billPaymentMethod?has_content>
                    <input type="button" id="summaryButton3" name="summaryButton3" class="btn-general pull-right summaryButton3" value="Place Order" />
                </#if>
                <#if !contactMechList?has_content && !billPaymentMethod?has_content>
                    <input type="button" style="" id="processOrderSummaryButton" name="processOrderSummaryButton" class="btn-general pull-right processOrderSummaryButton" value="Place Order" />
                </#if>
            </div><!-- /.span9 -->
        </form>
    </div><!-- /.row -->
</div> <!-- /container -->
