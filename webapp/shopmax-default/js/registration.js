function getFile(inputIndex){
    document.getElementById("upfile"+inputIndex).click();
}
function sub(obj,inputIndex){
     var file = obj.value;
     $('#yourBtn'+inputIndex).val(file);
}
$(function($, window, document, undefined){
     var defaults = {
         bounds: true,
         country: null,
         map: false,
         details: false,
         detailsAttribute: "name",
         location: false,
     }
});
function inputLocation(index){
     var options = {
        componentRestrictions: {country: 'nz'}//NewZealand only
    };
    var input = document.getElementById("inputLocation_"+index);
    //var autocomplete = new google.maps.places.Autocomplete($("#address")[0], {country:'tr'});
    var autocomplete = new google.maps.places.Autocomplete(input,options);
    google.maps.event.addListener(autocomplete, 'place_changed', function() {
        var place = autocomplete.getPlace();
        console.log(place.address_components);
    });
}
function removeBrach(id){
    $('#tr-physical-'+id).remove();
}

$(function(){
    $('.container.content').addClass('promotion');
    
    $('#submit-createcustomer').click(function(){
        if($('.business-registered').is(":visible")){
            var physicalNumber = $('.index-tr-physical-stores').length;
            var tempBranchName = "";var tempLocation = "";var tempPhoneType = "";var tempPhoneNumber = "";var tempStorePhoneNumber = "";
            var tempPhoneText = $('#phy_phone_text_'+i).val();
            var tempFaxText = $('#phy_fax_text_'+i).val();
            var phoneNumber = "";var faxNumber = "";var phonePrefix = "";var faxPrefix = "";var tempPhoneText = "";var tempFaxText = "";var tempDataTime = "";
            var mon = ""; var tue = ""; var wed = ""; var thu = ""; var fri = ""; var sat = ""; var sun = "";
            $('#physicalNum').val(physicalNumber);
            for(var i=0;i<physicalNumber;i++){
                phonePrefix = $('#phy_phone_select_'+i+'_chzn').find('span').text();
                faxPrefix = $('#phy_fax_select_'+i+'_chzn').find('span').text();
                tempPhoneText = $('#phy_phone_text_'+i).val();
                tempFaxText = $('#phy_fax_text_'+i).val();
                if($('#mon_check_'+i).is(":checked")){
                    mon = 'MON-'+$('#mon_o_0_'+i).val()+'-'+$('#mon_o_1_'+i).val()+'-'+$('#mon_c_0_'+i).val()+'-'+$('#mon_c_1_'+i).val()+',';}
                if($('#tue_check_'+i).is(":checked")){
                    tue = 'TUE-'+$('#tue_o_0_'+i).val()+'-'+$('#tue_o_1_'+i).val()+'-'+$('#tue_c_0_'+i).val()+'-'+$('#tue_c_1_'+i).val()+',';}
                if($('#wed_check_'+i).is(":checked")){
                    wed = 'WED-'+$('#wed_o_0_'+i).val()+'-'+$('#wed_o_1_'+i).val()+'-'+$('#wed_c_0_'+i).val()+'-'+$('#wed_c_1_'+i).val()+',';}
                if($('#thu_check_'+i).is(":checked")){
                    thu = 'THU-'+$('#thu_o_0_'+i).val()+'-'+$('#thu_o_1_'+i).val()+'-'+$('#thu_c_0_'+i).val()+'-'+$('#thu_c_1_'+i).val()+',';}
                if($('#fri_check_'+i).is(":checked")){
                    fri = 'FRI-'+$('#fri_o_0_'+i).val()+'-'+$('#fri_o_1_'+i).val()+'-'+$('#fri_c_0_'+i).val()+'-'+$('#fri_c_1_'+i).val()+',';}
                if($('#sat_check_'+i).is(":checked")){
                    sat = 'SAT-'+$('#sat_o_0_'+i).val()+'-'+$('#sat_o_1_'+i).val()+'-'+$('#sat_c_0_'+i).val()+'-'+$('#sat_c_1_'+i).val()+',';}
                if($('#sun_check_'+i).is(":checked")){
                    sun = 'SUN-'+$('#sun_o_0_'+i).val()+'-'+$('#sun_o_1_'+i).val()+'-'+$('#sun_c_0_'+i).val()+'-'+$('#sun_c_1_'+i).val();}
                
                if(tempPhoneText){
                    phoneNumber = "STORE_PHONE_NUMBER:"+phonePrefix+"-"+tempPhoneText;
                }
                if(tempFaxText){
                    faxNumber = "STORE_FAX_NUMBER:"+faxPrefix+"-"+tempFaxText;
                }
                
                if(!tempBranchName){
                    tempBranchName = $('#branchName_'+i).val();
                }
                else{
                    tempBranchName = tempBranchName+'/'+$('#branchName_'+i).val();
                }
                
                if(!tempLocation){
                    tempLocation = $('#inputLocation_'+i).val();
                }
                else{
                    tempLocation = tempLocation+'/'+$('#inputLocation_'+i).val();
                }
                
                if(phoneNumber && faxNumber){
                    faxNumber = ','+faxNumber;
                }
                if(!tempStorePhoneNumber){
                    tempStorePhoneNumber = phoneNumber+faxNumber;
                }
                else{
                    tempStorePhoneNumber = tempStorePhoneNumber+'/'+phoneNumber+faxNumber;
                }
                if(!tempDataTime){
                     tempDataTime = mon+tue+wed+thu+fri+sat+sun;
                }
                else{
                     tempDataTime = tempDataTime+'/'+mon+tue+wed+thu+fri+sat+sun;
                }
                phoneNumber = "";
                faxNumber = "";
                mon = "";tue = "";wed = "";thu = "";fri = "";sat = "";sun = "";
            }
            $('#physicalBranchName').val(tempBranchName);
            $('#physicalLocation').val(tempLocation);
            $('#physicalPhone').val(tempStorePhoneNumber);
            $('#physicalTime').val(tempDataTime);
            $('input.check').each(function(){
                var valid = false;
                var x=document.forms["createcustomer"]["CUSTOMER_EMAIL"].value;
                var atpos=x.indexOf("@");
                var dotpos=x.lastIndexOf(".");
                
                if(!$(this).val().length){
                    $(this).addClass('required');
                    $('.input-error').removeClass('hidden');
                    $('html, body').animate({ scrollTop: 0 }, 0);
                    valid = false;
                }
                else{
                    $(this).removeClass('required');
                    if($('.required').length == 0){
                        valid = true;
                    }
                    if(atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length){
                        $('#emailAddress').addClass('required');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if($('#currentPassword').val() != $('#currentPasswordVerify').val()){
                        $('#currentPassword').addClass('required');
                        $('#currentPasswordVerify').addClass('required');
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if ($('#currentPassword').hasClass('required')){
                        $('html, body').animate({ scrollTop: 0 }, 0);
                        valid = false;
                    }
                    if(!$('#firstName').val().length){
                        $('#firstName').addClass('required');
                        valid = false;
                    }
                    if(!$('#lastName').val().length){
                        $('#lastName').addClass('required');
                        valid = false;
                    }
                    if(!$('#businessName').val().length){
                        $('#businessName').addClass('required');
                        valid = false;
                    }
                    if(!$('#tradingName').val().length){
                        $('#tradingName').addClass('required');
                        valid = false;
                    }
                    if(!$('#phoneNumber_text_0').val().length){
                        $('#phoneNumber_text_0').addClass('required');
                        valid = false;
                    }
                    if($('#optionsRadiosYes').is(':checked')){
                        if(!$('#domianName').val().length){
                            $('#domianName').addClass('required');
                            valid = false;
                        }
                    }
                    else if($('#optionsRadiosNo').is(':checked')){
                        if(!$('#subDomain').val().length){
                            $('#subDomain').addClass('required');
                            valid = false;
                        }
                    }
                    /*if(!$('#yourBtn').val().length){
                        $('#yourBtn').addClass('required');
                        $('#yourBtn').css({'background-color':'#FEF2EE'});
                        valid = false;
                    }*/
                    for(var i=0;i<physicalNumber;i++){
	                    if(!$('#branchName_'+i).val().length){
	                        $('#branchName_'+i).addClass('required');
	                        valid = false;
	                    }
	                    if(!$('#inputLocation_'+i).val().length){
	                        $('#inputLocation_'+i).addClass('required');
	                        valid = false;
	                    }
                    }
                    if($('#optionsRadios2').is(':checked')){
                        if(!$('#firstNameOnCard').val().length){
                            $('#firstNameOnCard').addClass('required');
                            valid = false;
                        }
                        if(!$('#lastNameOnCard').val().length){
                            $('#lastNameOnCard').addClass('required');
                            valid = false;
                        }
                        if(!$('#cardNumber-0').val().length){
                            $('#cardNumber-0').addClass('required');
                            valid = false;
                        }
                        if(!$('#cardNumber-1').val().length){
                            $('#cardNumber-1').addClass('required');
                            valid = false;
                        }
                        if(!$('#cardNumber-2').val().length){
                            $('#cardNumber-2').addClass('required');
                            valid = false;
                        }
                        if(!$('#cardNumber-3').val().length){
                            $('#cardNumber-3').addClass('required');
                            valid = false;
                        }
                        if($('#expMonth_chzn').find('span').text() == 'Month' && $('#paymentMethodOption').val() == 'Y'){
                            $('#expMonth_chzn').addClass('required');
                            $('#expMonth_chzn').css({'background-color':'#FEF2EE'});
                            $('#expMonth_chzn .chzn-single').css({'background-color':'#FEF2EE'});
                            $('html, body').animate({ scrollTop: 0 }, 0);
                            valid = false;
                        }
                        if($('#expYear_chzn').find('span').text() == 'Year' && $('#paymentMethodOption').val() == 'Y'){
                            $('#expYear_chzn').addClass('required');
                            $('#expYear_chzn').css({'background-color':'#FEF2EE'});
                            $('#expYear_chzn .chzn-single').css({'background-color':'#FEF2EE'});
                            $('html, body').animate({ scrollTop: 0 }, 0);
                            valid = false;
                        }
                        if(!$('#cvcNumber').val().length){
                            $('#cvcNumber').addClass('required');
                            valid = false;
                        }
                    }
                    /*else if($('#optionsRadios3').is(':checked')){
                        if(!$('#yourBtn2').val().length){
                            $('#yourBtn2').addClass('required');
                            valid = false;
                        }
                    }*/
                }
                if($('#expMonth_chzn').find('span').text() == 'Month' && $('#paymentMethodOption').val() == 'Y'){
                    $('#expMonth_chzn').addClass('required');
                    $('#expMonth_chzn').css({'background-color':'#FEF2EE'});
                    $('#expMonth_chzn .chzn-single').css({'background-color':'#FEF2EE'});
                    $('html, body').animate({ scrollTop: 0 }, 0);
                    valid = false;
                }
                if($('#expYear_chzn').find('span').text() == 'Year' && $('#paymentMethodOption').val() == 'Y'){
                    $('#expYear_chzn').addClass('required');
                    $('#expYear_chzn').css({'background-color':'#FEF2EE'});
                    $('#expYear_chzn .chzn-single').css({'background-color':'#FEF2EE'});
                    $('html, body').animate({ scrollTop: 0 }, 0);
                    valid = false;
                }
                if(valid){
                    $('#createcustomer').submit();
                }
            });
            $('input.reWhite').each(function(){
                if($('#optionsRadios2').is(':checked')){
                    if(!$('#firstNameOnCard').val().length){
                        $('#firstNameOnCard').addClass('required');
                        $('#firstNameOnCard').css({'background-color':'#FEF2EE'});
                    }
                    if(!$('#lastNameOnCard').val().length){
                        $('#lastNameOnCard').addClass('required');
                        $('#lastNameOnCard').css({'background-color':'#FEF2EE'});
                    }
                    if(!$('#cardNumber-0').val().length){
                        $('#cardNumber-0').addClass('required');
                        $('#cardNumber-0').css({'background-color':'#FEF2EE'});
                    }
                    if(!$('#cardNumber-1').val().length){
                        $('#cardNumber-1').addClass('required');
                        $('#cardNumber-1').css({'background-color':'#FEF2EE'});
                    }
                    if(!$('#cardNumber-2').val().length){
                        $('#cardNumber-2').addClass('required');
                        $('#cardNumber-2').css({'background-color':'#FEF2EE'});
                    }
                    if(!$('#cardNumber-3').val().length){
                        $('#cardNumber-3').addClass('required');
                        $('#cardNumber-3').css({'background-color':'#FEF2EE'});
                    }
                    if(!$('#cvcNumber').val().length){
                        $('#cvcNumber').addClass('required');
                        $('#cvcNumber').css({'background-color':'#FEF2EE'});
                    }
                }
            });
        }
        else{
            $('#userinformation').find('input.check').each(function(){
                var valid = false;
                var x=document.forms["createcustomer"]["CUSTOMER_EMAIL"].value;
                var atpos=x.indexOf("@");
                var dotpos=x.lastIndexOf(".");
                
                if(!$(this).val().length){
                    $(this).addClass('required');
                    $('.input-error').removeClass('hidden');
                    valid = false;
                }
                else{
                    $(this).removeClass('required');
                    if($('.required').length == 0){
                        valid = true;
                    }
                    if(atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length){
                        $('#emailAddress').addClass('required');
                        valid = false;
                    }
                    if($('#currentPassword').val() != $('#currentPasswordVerify').val()){
                        $('#currentPassword').addClass('required');
                        $('#currentPasswordVerify').addClass('required');
                        valid = false;
                    }
                    if($('#currentPassword').hasClass('required')){
                        valid = false;
                    }
                    if(!$('#firstName').val().length){
                        $('#firstName').addClass('required');
                        valid = false;
                    }
                    if(!$('#lastName').val().length){
                        $('#lastName').addClass('required');
                        valid = false;
                    }
                }
                if(valid){
                    $('#createcustomer').submit();
                }
            });
            
        }
    });
    $('input.check').focus(function(){
        $('#'+this.id).removeClass('required');
        $('.input-error').addClass('hidden');
    });
    $('#subDomain').focus(function(){
        $('#subDomain').removeClass('required');
        $('.input-error').addClass('hidden');
    });
    $('#yourBtn2').focus(function(){
        $('.input-error').addClass('hidden');
    });
    $('#currentPassword').focus(function(){
        $('#currentPassword').removeClass('required');
        $('#currentPasswordVerify').removeClass('required');
    });
    $('#currentPasswordVerify').focus(function(){
        $('#currentPassword').removeClass('required');
        $('#currentPasswordVerify').removeClass('required');
    });
    $('#expMonth_chzn').click(function(){
        document.getElementById('optionsRadios3').checked = false;
        document.getElementById('optionsRadios2').checked = true;
        $('#expMonth_chzn').removeClass('required');
        $('#expMonth_chzn').css({'background-color':'#FFFFFF'});
        $('.chzn-single').css({'background-color':'#FFFFFF'});
        $('#expYear_chzn').css({'background-color':'#FFFFFF'});
        $('#yourBtn2').val('');
        $('#yourBtn2').removeClass('check required');
    });
    $('#expYear_chzn').click(function(){
        document.getElementById('optionsRadios3').checked = false;
        document.getElementById('optionsRadios2').checked = true;
        $('#expYear_chzn').removeClass('required');
        $('#expYear_chzn').css({'background-color':'#FFFFFF'});
        $('.chzn-single').css({'background-color':'#FFFFFF'});
        $('#expMonth_chzn').css({'background-color':'#FFFFFF'});
        $('#yourBtn2').val('');
        $('#yourBtn2').removeClass('check required');
    });
    $('.chk_regis').click(function(){
        if($('.chk_regis').is(':checked')){
            $('.business-guide').removeClass('hidden');
            $('.business-registered').removeClass('hidden');
            $('#businessUser').val("Y");
        }
        else{
            $('.business-registered').addClass('hidden');
            $('.business-guide').addClass('hidden');
            $('#businessUser').val("N");
        }
    });
    $('.phoneNumberText').change(function(){
        var currentPhoneSelect = this.id.split("_");
        var prefix = $('#phoneNumber_select_'+currentPhoneSelect[2]+'_chzn').find('span').text();
        $('#phoneNumber_'+currentPhoneSelect[2]).val($('#'+this.id).val());
        $('#phoneNumberArea_'+currentPhoneSelect[2]).val(prefix);
    });
    $('.accountNumber').change(function(){
        $('#accountNumber').val($('#accountNumber-0').val()+$('#accountNumber-1').val()+$('#accountNumber-2').val()+$('#accountNumber-3').val());
    });
    $('.cardNumber').change(function(){
        $('#cardNumber').val($('#cardNumber-0').val()+$('#cardNumber-1').val()+$('#cardNumber-2').val()+$('#cardNumber-3').val());
    });
    $('.optionsRadios').click(function(){
        if(this.id == 'optionsRadiosYes'){
            $('#checkDomain').val('Y');
            $('#subDomain').removeClass('check required');
            $('#domianName').addClass('check required');
            $('#subDomain').val('');
            $('.input-error').addClass('hidden');
            $('.form-inline').find('input.check').each(function(){
                if($(this).val().length){
                    $(this).removeClass('check required');
                }
            });
        }
        else if(this.id == 'optionsRadiosNo'){
            $('#checkDomain').val('N');
            $('#domianName').removeClass('check required');
            $('#subDomain').addClass('check required');
            $('#domianName').val('');
            $('.input-error').addClass('hidden');
            $('.form-inline').find('input.check').each(function(){
                if($(this).val().length){
                    $(this).removeClass('check required');
                }
            });
        }
    });
    $('#domianName').click(function(){
        document.getElementById('optionsRadiosNo').checked = false;
        document.getElementById('optionsRadiosYes').checked = true;
        $('#subDomain').removeClass('check required');
        $('#domianName').addClass('check');
        $('#checkDomain').val('Y');
        $('#subDomain').val('');
    });
    $('#subDomain').click(function(){
        document.getElementById('optionsRadiosYes').checked = false;
        document.getElementById('optionsRadiosNo').checked = true;
        $('#domianName').removeClass('check required');
        $('#subDomain').addClass('check');
        $('#checkDomain').val('N');
        $('#domianName').val('');
    });
    $('.chzn-container').click(function(){
        $('#expireDate').val($('#expMonth_chzn').find('span').text()+"/"+$('#expYear_chzn').find('span').text());
        if((this.id).indexOf("phoneNumber_select_") !== -1){
            var currentPhoneSelect = this.id.split("_");
            var prefix = $('#phoneNumber_select_'+currentPhoneSelect[2]+'_chzn').find('span').text();
            $('#phoneNumber_'+currentPhoneSelect[2]).val(prefix+$('#phoneNumber_text_'+currentPhoneSelect[2]).val());
        }
    });
    $('#optionsRadios2').click(function(){
        $('.input-error').addClass('hidden');
        $('#firstNameOnCard').addClass('check required');
        $('#lastNameOnCard').addClass('check required');
        $('.cardNumber').addClass('check required');
        $('#firstNameOnCard').css({'background-color':'#FEF2EE'});
        $('#lastNameOnCard').css({'background-color':'#FEF2EE'});
        $('.cardNumber').css({'background-color':'#FEF2EE'});
        $('#expMonth_chzn').addClass('check required');
        $('#expYear_chzn').addClass('check required');
        $('#cvcNumber').addClass('check required');
        $('#yourBtn2').removeClass('check required');
        $('#yourBtn2').val('');
        $('#expMonth_chzn').css({'background-color':'#FEF2EE'});
        $('#expYear_chzn').css({'background-color':'#FEF2EE'});
        $('#expMonth_chzn .chzn-single').css({'background-color':'#FEF2EE'});
        $('#expYear_chzn .chzn-single').css({'background-color':'#FEF2EE'});
        $('#cvcNumber').css({'background-color':'#FEF2EE'});
        $('#paymentMethodOption').val('Y');
        $('.control-group').find('input.check').each(function(){
            if($(this).val().length){
                $(this).removeClass('check required');
            }
            if($('#expMonth_chzn').find('span').text() != 'Month' && $('#expYear_chzn').find('span').text() != 'Year'){
                $('#expMonth_chzn').css({'background-color':'#FFFFFF'});
                $('.chzn-single').css({'background-color':'#FFFFFF'});
                $('#expYear_chzn').css({'background-color':'#FFFFFF'});
            }
        });
    });
    $('#optionsRadios3').click(function(){
        $('.input-error').addClass('hidden');
        $('#firstNameOnCard').removeClass('check required');
        $('#lastNameOnCard').removeClass('check required');
        $('.cardNumber').removeClass('check required');
        $('#firstNameOnCard').css({'background-color':'#FFFFFF'});
        $('#lastNameOnCard').css({'background-color':'#FFFFFF'});
        $('.cardNumber').css({'background-color':'#FFFFFF'});
        $('#expMonth_chzn').removeClass('check required');
        $('#expMonth_chzn').css({'background-color':'#FFFFFF'});
        $('#expYear_chzn').removeClass('check required');
        $('#expYear_chzn').css({'background-color':'#FFFFFF'});
        $('.chzn-single').css({'background-color':'#FFFFFF'});
        $('#cvcNumber').removeClass('check required');
        $('#cvcNumber').css({'background-color':'#FFFFFF'});
        $('#yourBtn2').addClass('check required');
        $('#firstNameOnCard').val('');
        $('#lastNameOnCard').val('');
        $('.cardNumber').val('');
        $('#cvcNumber').val('');
        $('#expMonth_chzn').find('span').text('Month');
        $('#expYear_chzn').find('span').text('Year');
        $('#paymentMethodOption').val('N');
        $('.pull-left').find('input.check').each(function(){
            if($(this).val().length){
                $(this).removeClass('check required');
            }
        });
    });
    $('#firstNameOnCard').click(function(){
        document.getElementById('optionsRadios3').checked = false;
        document.getElementById('optionsRadios2').checked = true;
        $('#firstNameOnCard').addClass('check');
        $('#lastNameOnCard').addClass('check');
        $('.cardNumber').addClass('check');
        $('#expMonth_chzn').addClass('check');
        $('#expYear_chzn').addClass('check');
        $('#cvcNumber').addClass('check');
        $('#yourBtn2').removeClass('check required');
        $('#paymentMethodOption').val('Y');
        $('#yourBtn2').val('');
        $('#'+this.id).css({'background-color':'#FFFFFF'});
    });
    $('#lastNameOnCard').click(function(){
        document.getElementById('optionsRadios3').checked = false;
        document.getElementById('optionsRadios2').checked = true;
        $('#firstNameOnCard').addClass('check');
        $('#lastNameOnCard').addClass('check');
        $('.cardNumber').addClass('check');
        $('#expMonth_chzn').addClass('check');
        $('#expYear_chzn').addClass('check');
        $('#cvcNumber').addClass('check');
        $('#yourBtn2').removeClass('check required');
        $('#paymentMethodOption').val('Y');
        $('#yourBtn2').val('');
        $('#'+this.id).css({'background-color':'#FFFFFF'});
    });
    $('.cardNumber').click(function(){
        document.getElementById('optionsRadios3').checked = false;
        document.getElementById('optionsRadios2').checked = true;
        $('#firstNameOnCard').addClass('check');
        $('#lastNameOnCard').addClass('check');
        $('.cardNumber').addClass('check');
        $('#expMonth_chzn').addClass('check');
        $('#expYear_chzn').addClass('check');
        $('#cvcNumber').addClass('check');
        $('#yourBtn2').removeClass('check required');
        $('#paymentMethodOption').val('Y');
        $('#yourBtn2').val('');
        $('#'+this.id).css({'background-color':'#FFFFFF'});
    });
    $('#cvcNumber').click(function(){
        document.getElementById('optionsRadios3').checked = false;
        document.getElementById('optionsRadios2').checked = true;
        $('#firstNameOnCard').addClass('check');
        $('#lastNameOnCard').addClass('check');
        $('.cardNumber').addClass('check');
        $('#expMonth_chzn').addClass('check');
        $('#expYear_chzn').addClass('check');
        $('#cvcNumber').addClass('check');
        $('#yourBtn2').removeClass('check required');
        $('#paymentMethodOption').val('Y');
        $('#yourBtn2').val('');
        $('#'+this.id).css({'background-color':'#FFFFFF'});
    });
    $('#yourBtn2').click(function(){
        document.getElementById('optionsRadios2').checked = false;
        document.getElementById('optionsRadios3').checked = true;
        $('#firstNameOnCard').removeClass('check required');
        $('#lastNameOnCard').removeClass('check required');
        $('.cardNumber').removeClass('check required');
        $('#expMonth_chzn').removeClass('check required');
        $('#expMonth_chzn').css({'background-color':'#FFFFFF'});
        $('#expYear_chzn').removeClass('check required');
        $('#expYear_chzn').css({'background-color':'#FFFFFF'});
        $('.chzn-single').css({'background-color':'#FFFFFF'});
        $('#cvcNumber').removeClass('check required');
        $('#yourBtn2').addClass('check');
        $('#yourBtn2').removeClass('required');
        $('#paymentMethodOption').val('N');
        $('#expMonth_chzn').find('span').text('Month');
        $('#expYear_chzn').find('span').text('Year');
        $('#firstNameOnCard').val('');
        $('#lastNameOnCard').val('');
        $('.cardNumber').val('');
        $('#cvcNumber').val('');
    });
    $(".new-branch-area").click(function() {
        var index = $('.index-tr-physical-stores').length;
        var newRow = $("<tr class='index-tr-physical-stores' id='tr-physical-"+index+"'><td class='col1 form-horizontal'>"+
            "<div class='control-group'>"+
                    "<label class='control-label control-label-xsmall' for='inputPromotionDescription'>Branch Name</label>"+
                "<div class='pull-left'>"+
                    "<input type='text' class='input-xxlarge branchName check' id='branchName_"+index+"' name='branchName'>*"+
                "</div>"+
            "</div>"+
            "<div class='control-group'><label class='control-label control-label-xsmall' for='inputPromotionDescription'>Location</label>"+
                "<div class='pull-left'>"+
                    "<input type='text' class='input-xxlarge inputLocation check' id='inputLocation_"+index+"' onclick='inputLocation("+index+")'>*"+
                "</div>"+
            "</div>"+
            "<div class='control-group'>"+
                "<label class='control-label control-label-small' for='inputPromotionDescription'>Store phone number</label>"+
                "<div class='pull-left'>"+
                    "<select id='phy_phone_select_"+index+"' class='chosen'>"+
                        "<option selected='elected'>03</option>"+
                        "<option>04</option>"+
                        "<option>06</option>"+
                        "<option>07</option>"+
                        "<option>09</option>"+
                        "<option>020</option>"+
                        "<option>021</option>"+
                        "<option>022</option>"+
                        "<option>027</option>"+
                        "<option>028</option>"+
                        "<option>029</option>"+
                        "<option>0508</option>"+
                        "<option>0800</option>"+
                    "</select>"+
                    "<input type='text' class='input-phone-number' id='phy_phone_text_"+index+"'>"+
                "</div>"+
                "<label class='control-label control-label-small' for='inputPromotionDescription'>Store Fax Number</label>"+
                "<div class='pull-left'>"+
                    "<select id='phy_fax_select_"+index+"' class='chosen'>"+
                        "<option selected='selected'>03</option>"+
                        "<option>04</option>"+
                        "<option>06</option>"+
                        "<option>07</option>"+
                        "<option>09</option>"+
                        "<option>0508</option>"+
                        "<option>0800</option>"+
                    "</select>"+
                    "<input type='text' class='input-phone-number' id='phy_fax_text_"+index+"'>"+
                "</div>"+
            "</div>"+
            "<div class='control-group'>"+
            "<label class='control-label control-label-xlarge' for='inputOpeningHours'>Opening Hours (24 hour format)</label>"+
            "<div class='clearfix'></div>"+
            "<label class='control-label control-label-xxsmall pull-left' for='inputMonday'><input type='checkbox' name='optionsRadios' id='mon_check_"+index+"' > Mon </label>"+
            "<div clas='pull-left'>"+
                "<input type='text' class='input-xsmall input-hours' id='mon_o_0_"+index+"' maxlength='2' onkeypress='return isNumberKey(event)'> : <input type='text' class='input-xsmall input-min' id='mon_o_1_"+index+"' maxlength='2' onkeypress='return isNumberKey(event)'> &nbsp;&nbsp;&nbsp;&nbsp; - &nbsp;&nbsp;&nbsp;&nbsp; <input type='text' class='input-xsmall input-hours' id='mon_c_0_"+index+"' maxlength='2' onkeypress='return isNumberKey(event)'> : <input type='text' class='input-xsmall input-min' id='mon_c_1_"+index+"' maxlength='2' onkeypress='return isNumberKey(event)'>"+
            "</div>"+
            "<label class='control-label control-label-xxsmall pull-left' for='inputTuesday'><input type='checkbox' name='optionsRadios' id='tue_check_"+index+"' > Tue </label>"+
            "<div clas='pull-left'>"+
                "<input type='text' class='input-xsmall input-hours' id='tue_o_0_"+index+"' maxlength='2' onkeypress='return isNumberKey(event)'> : <input type='text' class='input-xsmall input-min' id='tue_o_1_"+index+"' maxlength='2' onkeypress='return isNumberKey(event)'> &nbsp;&nbsp;&nbsp;&nbsp; - &nbsp;&nbsp;&nbsp;&nbsp; <input type='text' class='input-xsmall input-hours' id='tue_c_0_"+index+"' maxlength='2' onkeypress='return isNumberKey(event)'> : <input type='text' class='input-xsmall input-min' id='tue_c_1_"+index+"' maxlength='2' onkeypress='return isNumberKey(event)'>"+
            "</div>"+
            "<label class='control-label control-label-xxsmall pull-left' for='inputWednesday'><input type='checkbox' name='optionsRadios' id='wed_check_"+index+"' > Wed </label>"+
            "<div clas='pull-left'>"+
                "<input type='text' class='input-xsmall input-hours' id='wed_o_0_"+index+"' maxlength='2' onkeypress='return isNumberKey(event)'> : <input type='text' class='input-xsmall input-min' id='wed_o_1_"+index+"' maxlength='2' onkeypress='return isNumberKey(event)'> &nbsp;&nbsp;&nbsp;&nbsp; - &nbsp;&nbsp;&nbsp;&nbsp; <input type='text' class='input-xsmall input-hours' id='wed_c_0_"+index+"' maxlength='2' onkeypress='return isNumberKey(event)'> : <input type='text' class='input-xsmall input-min' id='wed_c_1_"+index+"' maxlength='2' onkeypress='return isNumberKey(event)'>"+
            "</div>"+
            "<label class='control-label control-label-xxsmall pull-left' for='inputThursday'><input type='checkbox' name='optionsRadios' id='thu_check_"+index+"' > Thu </label>"+
            "<div clas='pull-left'>"+
                "<input type='text' class='input-xsmall input-hours' id='thu_o_0_"+index+"' maxlength='2' onkeypress='return isNumberKey(event)'> : <input type='text' class='input-xsmall input-min' id='thu_o_1_"+index+"' maxlength='2' onkeypress='return isNumberKey(event)'> &nbsp;&nbsp;&nbsp;&nbsp; - &nbsp;&nbsp;&nbsp;&nbsp; <input type='text' class='input-xsmall input-hours' id='thu_c_0_"+index+"' maxlength='2' onkeypress='return isNumberKey(event)'> : <input type='text' class='input-xsmall input-min' id='thu_c_1_"+index+"' maxlength='2' onkeypress='return isNumberKey(event)'>"+
            "</div>"+
            "<label class='control-label control-label-xxsmall pull-left' for='inputFriday'><input type='checkbox' name='optionsRadios' id='fri_check_"+index+"' > Fri </label>"+
            "<div clas='pull-left'>"+
            "<input type='text' class='input-xsmall input-hours' id='fri_o_0_"+index+"' maxlength='2' onkeypress='return isNumberKey(event)'> : <input type='text' class='input-xsmall input-min' id='fri_o_1_"+index+"' maxlength='2' onkeypress='return isNumberKey(event)'> &nbsp;&nbsp;&nbsp;&nbsp; - &nbsp;&nbsp;&nbsp;&nbsp; <input type='text' class='input-xsmall input-hours' id='fri_c_0_"+index+"' maxlength='2' onkeypress='return isNumberKey(event)'> : <input type='text' class='input-xsmall input-min' id='fri_c_1_"+index+"' maxlength='2' onkeypress='return isNumberKey(event)'>"+
            "</div>"+
            "<label class='control-label control-label-xxsmall pull-left' for='inputSaterday'><input type='checkbox' name='optionsRadios' id='sat_check_"+index+"' > Sat </label>"+
            "<div clas='pull-left'>"+
            "<input type='text' class='input-xsmall input-hours' id='sat_o_0_"+index+"' maxlength='2' onkeypress='return isNumberKey(event)'> : <input type='text' class='input-xsmall input-min' id='sat_o_1_"+index+"' maxlength='2' onkeypress='return isNumberKey(event)'> &nbsp;&nbsp;&nbsp;&nbsp; - &nbsp;&nbsp;&nbsp;&nbsp; <input type='text' class='input-xsmall input-hours' id='sat_c_0_"+index+"' maxlength='2' onkeypress='return isNumberKey(event)'> : <input type='text' class='input-xsmall input-min' id='sat_c_1_"+index+"' maxlength='2' onkeypress='return isNumberKey(event)'>"+
            "</div>"+
            "<label class='control-label control-label-xxsmall pull-left' for='inputSunday'><input type='checkbox' name='optionsRadios' id='sun_check_"+index+"' > Sun</label>"+
            "<div clas='pull-left'>"+
                "<input type='text' class='input-xsmall input-hours' id='sun_o_0_"+index+"' maxlength='2' onkeypress='return isNumberKey(event)'> : <input type='text' class='input-xsmall input-min' id='sun_o_1_"+index+"' maxlength='2' onkeypress='return isNumberKey(event)'> &nbsp;&nbsp;&nbsp;&nbsp; - &nbsp;&nbsp;&nbsp;&nbsp; <input type='text' class='input-xsmall input-hours' id='sun_c_0_"+index+"' maxlength='2' onkeypress='return isNumberKey(event)'> : <input type='text' class='input-xsmall input-min' id='sun_c_1_"+index+"' maxlength='2' onkeypress='return isNumberKey(event)'>"+
            "</div>"+
        "</div>"+
        "<a class='btn-grey-small btn_remove' onclick=removeBrach('"+index+"')>Remove Branch</a>"+
        "</td></tr>");
        $("#tr-physical-stores").append(newRow);
        $('.chosen').chosen();
        $('.input-hours').change(function(){
            if($('#'+this.id).val().toString().search(/^-?[0-9]+$/) == 0){
                if($('#'+this.id).val() >= 24 || $('#'+this.id).val() < 0){
                    $('#'+this.id).val("");
                }
            }
            else{
                $('#'+this.id).val("");
            }
        });
        $('.input-min').change(function(){
            if($('#'+this.id).val().toString().search(/^-?[0-9]+$/) == 0){
                if($('#'+this.id).val() >= 60 || $('#'+this.id).val() < 0){
                    $('#'+this.id).val("");
                }
            }
            else{
                $('#'+this.id).val("");
            }
        });
        $('#branchName_'+index).focus(function(){
            $('#branchName_'+index).removeClass('required');
            $('.input-error').addClass('hidden');
        });
        $('#inputLocation_'+index).focus(function(){
            $('#inputLocation_'+index).removeClass('required');
            $('.input-error').addClass('hidden');
        });
        
    });
    $('.input-hours').change(function(){
        if($('#'+this.id).val().toString().search(/^-?[0-9]+$/) == 0){
            if($('#'+this.id).val() >= 24 || $('#'+this.id).val() < 0){
                $('#'+this.id).val("");
            }
        }
        else{
            $('#'+this.id).val("");
        }
    });
    $('.input-min').change(function(){
        if($('#'+this.id).val().toString().search(/^-?[0-9]+$/) == 0){
            if($('#'+this.id).val() >= 60 || $('#'+this.id).val() < 0){
                $('#'+this.id).val("");
            }
        }
        else{
            $('#'+this.id).val("");
        }
    });
    $('#browse2').click(function(){
        document.getElementById('optionsRadios2').checked = false;
        document.getElementById('optionsRadios3').checked = true;
        $('#firstNameOnCard').removeClass('check required');
        $('#lastNameOnCard').removeClass('check required');
        $('.cardNumber').removeClass('check required');
        $('#expMonth_chzn').removeClass('check required');
        $('#expMonth_chzn').css({'background-color':'#FFFFFF'});
        $('#expYear_chzn').removeClass('check required');
        $('#expYear_chzn').css({'background-color':'#FFFFFF'});
        $('.chzn-single').css({'background-color':'#FFFFFF'});
        $('#cvcNumber').removeClass('check required');
        $('#yourBtn2').addClass('check');
        $('#yourBtn2').removeClass('required');
        $('#paymentMethodOption').val('N');
        $('#expMonth_chzn').find('span').text('Month');
        $('#expYear_chzn').find('span').text('Year');
        $('#firstNameOnCard').val('');
        $('#lastNameOnCard').val('');
        $('.cardNumber').val('');
        $('#cvcNumber').val('');
    });
    /*$('#yourBtn').click(function(){
    	$('#yourBtn').removeClass('check required');
        $('#yourBtn').css({'background-color':'#FFFFFF'});
    });*/
    $('#browse0').click(function(){
    	$('#browse0').removeClass('check required');
        $('#yourBtn').css({'background-color':'#FFFFFF'});
    });
});
function isNumberKey(evt) {
    var charCode = (evt.which) ? evt.which : evt.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}
