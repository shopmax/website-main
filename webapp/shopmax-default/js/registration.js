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
                	mon = 'MON-'+$('#mon_o_0_'+i).val()+'-'+$('#mon_o_1_'+i).val()+'-'+$('#mon_c_0_'+i).val()+'-'+$('#mon_c_1_'+i).val();}
                if($('#tue_check_'+i).is(":checked")){
                	tue = 'TUE-'+$('#tue_o_0_'+i).val()+'-'+$('#tue_o_1_'+i).val()+'-'+$('#tue_c_0_'+i).val()+'-'+$('#tue_c_1_'+i).val();}
                if($('#wed_check_'+i).is(":checked")){
                	wed = 'WED-'+$('#wed_o_0_'+i).val()+'-'+$('#wed_o_1_'+i).val()+'-'+$('#wed_c_0_'+i).val()+'-'+$('#wed_c_1_'+i).val();}
                if($('#thu_check_'+i).is(":checked")){
                	thu = 'THU-'+$('#thu_o_0_'+i).val()+'-'+$('#thu_o_1_'+i).val()+'-'+$('#thu_c_0_'+i).val()+'-'+$('#thu_c_1_'+i).val();}
                if($('#fri_check_'+i).is(":checked")){
                	fri = 'FRI-'+$('#fri_o_0_'+i).val()+'-'+$('#fri_o_1_'+i).val()+'-'+$('#fri_c_0_'+i).val()+'-'+$('#fri_c_1_'+i).val();}
                if($('#sat_check_'+i).is(":checked")){
                	sat = 'SAT-'+$('#sat_o_0_'+i).val()+'-'+$('#sat_o_1_'+i).val()+'-'+$('#sat_c_0_'+i).val()+'-'+$('#sat_c_1_'+i).val();}
                if($('#sun_check_'+i).is(":checked")){
                	sun = 'SUN-'+$('#sun_o_0_'+i).val()+'-'+$('#sun_o_1_'+i).val()+'-'+$('#sun_c_0_'+i).val()+'-'+$('#sun_c_1_'+i).val();}
                
                /*if(tempPhoneText){
                    phoneNumber = "STORE_PHONE_NUMBER-"+phonePrefix+tempPhoneText;
                }
                if(tempFaxText){
                    faxNumber = "STORE_FAX_NUMBER-"+faxPrefix+tempFaxText;
                }*/
                if(tempPhoneText){
                    phoneNumber = "STORE_PHONE_NUMBER-"+phonePrefix+tempPhoneText;
                    //phoneType = "STORE_PHONE_NUMBER";
                }
                if(tempFaxText){
                    faxNumber = "STORE_FAX_NUMBER-"+faxPrefix+tempFaxText;
                    //faxType = "STORE_FAX_NUMBER";
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
                    //faxType = ','+faxType;
                }
                if(!tempStorePhoneNumber){
                    tempStorePhoneNumber = phoneNumber+faxNumber;
                    //tempPhoneType = phoneType+faxType;
                }
                else{
                    tempStorePhoneNumber = tempStorePhoneNumber+'/'+phoneNumber+faxNumber;
                    //tempPhoneType = tempPhoneType+'/'+phoneType+faxType;
                }
                if(!tempDataTime){
                     tempDataTime = mon+','+tue+','+wed+','+thu+','+fri+','+sat+','+sun;
                }
                else{
                     tempDataTime = tempDataTime+'/'+mon+','+tue+','+wed+','+thu+','+fri+','+sat+','+sun;
                }
                phoneNumber = "";
                faxNumber = "";
                mon = "";tue = "";wed = "";thu = "";fri = "";sat = "";sun = "";
            }
            $('#physicalBranchName').val(tempBranchName);
            $('#physicalLocation').val(tempLocation);
            //$('#physicalPhoneType').val(tempPhoneType)
            $('#physicalPhone').val(tempStorePhoneNumber);
            $('#physicalTime').val(tempDataTime);
            $('#createcustomer').submit();
        }
        else{
            $('#createcustomer').submit();
        }
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
        }
    });
    $('.phoneNumberText').change(function(){
        var currentPhoneSelect = this.id.split("_");
        var prefix = $('#phoneNumber_select_'+currentPhoneSelect[2]+'_chzn').find('span').text();
        $('#phoneNumber_'+currentPhoneSelect[2]).val(prefix+$('#'+this.id).val());
    });
    $('#cardHolderName').change(function(){
        var cardHolderName = $('#cardHolderName').val().split(" ");
        $('#firstNameOnCard').val(cardHolderName[0]);
        $('#lastNameOnCard').val(cardHolderName[1]);
    });
    $('.accountNumber').change(function(){
        $('#accountNumber').val($('#accountNumber-0').val()+$('#accountNumber-1').val()+$('#accountNumber-2').val()+$('#accountNumber-3').val());
    });
    $('.cardNumber').change(function(){
        $('#cardNumber').val($('#cardNumber-0').val()+$('#cardNumber-1').val()+$('#cardNumber-2').val()+$('#cardNumber-3').val());
    });
    $('.optionsRadios').click(function(){
        if(this.id == 'optionsRadios'){
            $('#checkDomain').val('Y');
        }
        else if(this.id == 'optionsRadios1'){
            $('#checkDomain').val('N');
        }
        else if(this.id == 'optionsRadios2'){
            $('#checkCreditCard').val('Y');
        }
        else{
            $('#checkCreditCard').val('N');
        }
    });
    $('.chzn-container').click(function(){
        $('#expireDate').val($('#expMonth_chzn').find('span').text()+"/"+$('#expYear_chzn').find('span').text());
        if((this.id).indexOf("phoneNumber_select_") !== -1){
            var currentPhoneSelect = this.id.split("_");
            var prefix = $('#phoneNumber_select_'+currentPhoneSelect[2]+'_chzn').find('span').text();
            $('#phoneNumber_'+currentPhoneSelect[2]).val(prefix+$('#phoneNumber_text_'+currentPhoneSelect[2]).val());
        }
    });
    $(".new-branch-area").click(function() {
        var index = $('.index-tr-physical-stores').length;
        var newRow = $("<tr class='index-tr-physical-stores' id='tr-physical-"+index+"'><td class='col1 form-horizontal'>"+
        "<div class='control-group'>"+
            "<label class='control-label control-label-xsmall' for='inputPromotionDescription'>Branch Name</label>"+
            "<div class='pull-left'>"+
                "<input type='text' class='input-xxlarge branchName' id='branchName_"+index+"' name='branchName'>"+
            "</div>"+
        "</div>"+
        "<div class='control-group'><label class='control-label control-label-xsmall' for='inputPromotionDescription'>Location</label>"+
            "<div class='pull-left'>"+
                "<input type='text' class='input-xxlarge inputLocation' id='inputLocation_"+index+"' onclick='inputLocation("+index+")'>"+
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
                "<input type='text' class='input-xsmall input-time' id='mon_o_0_"+index+"'> : <input type='text' class='input-xsmall input-time' id='mon_o_1_"+index+"'> &nbsp;&nbsp;&nbsp;&nbsp; - &nbsp;&nbsp;&nbsp;&nbsp; <input type='text' class='input-xsmall input-time' id='mon_c_0_"+index+"'> : <input type='text' class='input-xsmall input-time' id='mon_c_1_"+index+"'>"+
            "</div>"+
            "<label class='control-label control-label-xxsmall pull-left' for='inputTuesday'><input type='checkbox' name='optionsRadios' id='tue_check_"+index+"' > Tue </label>"+
            "<div clas='pull-left'>"+
                "<input type='text' class='input-xsmall input-time' id='tue_o_0_"+index+"'> : <input type='text' class='input-xsmall input-time' id='tue_o_1_"+index+"'> &nbsp;&nbsp;&nbsp;&nbsp; - &nbsp;&nbsp;&nbsp;&nbsp; <input type='text' class='input-xsmall input-time' id='tue_c_0_"+index+"'> : <input type='text' class='input-xsmall input-time' id='tue_c_1_"+index+"'>"+
            "</div>"+
            "<label class='control-label control-label-xxsmall pull-left' for='inputWednesday'><input type='checkbox' name='optionsRadios' id='wed_check_"+index+"' > Wed </label>"+
            "<div clas='pull-left'>"+
                "<input type='text' class='input-xsmall input-time' id='wed_o_0_"+index+"'> : <input type='text' class='input-xsmall input-time' id='wed_o_1_"+index+"'> &nbsp;&nbsp;&nbsp;&nbsp; - &nbsp;&nbsp;&nbsp;&nbsp; <input type='text' class='input-xsmall input-time' id='wed_c_0_"+index+"'> : <input type='text' class='input-xsmall input-time' id='wed_c_1_"+index+"'>"+
            "</div>"+
            "<label class='control-label control-label-xxsmall pull-left' for='inputThursday'><input type='checkbox' name='optionsRadios' id='thu_check_"+index+"' > Thu </label>"+
            "<div clas='pull-left'>"+
                "<input type='text' class='input-xsmall input-time' id='thu_o_0_"+index+"'> : <input type='text' class='input-xsmall input-time' id='thu_o_1_"+index+"'> &nbsp;&nbsp;&nbsp;&nbsp; - &nbsp;&nbsp;&nbsp;&nbsp; <input type='text' class='input-xsmall input-time' id='thu_c_0_"+index+"'> : <input type='text' class='input-xsmall input-time' id='thu_c_1_"+index+"'>"+
            "</div>"+
            "<label class='control-label control-label-xxsmall pull-left' for='inputFriday'><input type='checkbox' name='optionsRadios' id='fri_check_"+index+"' > Fri </label>"+
            "<div clas='pull-left'>"+
            "<input type='text' class='input-xsmall input-time' id='fri_o_0_"+index+"'> : <input type='text' class='input-xsmall input-time' id='fri_o_1_"+index+"'> &nbsp;&nbsp;&nbsp;&nbsp; - &nbsp;&nbsp;&nbsp;&nbsp; <input type='text' class='input-xsmall input-time' id='fri_c_0_"+index+"'> : <input type='text' class='input-xsmall input-time' id='fri_c_1_"+index+"'>"+
            "</div>"+
            "<label class='control-label control-label-xxsmall pull-left' for='inputSaterday'><input type='checkbox' name='optionsRadios' id='sat_check_"+index+"' > Sat </label>"+
            "<div clas='pull-left'>"+
            "<input type='text' class='input-xsmall input-time' id='sat_o_0_"+index+"'> : <input type='text' class='input-xsmall input-time' id='sat_o_1_"+index+"'> &nbsp;&nbsp;&nbsp;&nbsp; - &nbsp;&nbsp;&nbsp;&nbsp; <input type='text' class='input-xsmall input-time' id='sat_c_0_"+index+"'> : <input type='text' class='input-xsmall input-time' id='sat_o_1_"+index+"'>"+
            "</div>"+
            "<label class='control-label control-label-xxsmall pull-left' for='inputSunday'><input type='checkbox' name='optionsRadios' id='sun_check_"+index+"' > Sun</label>"+
            "<div clas='pull-left'>"+
                "<input type='text' class='input-xsmall input-time' id='sun_o_0_"+index+"'> : <input type='text' class='input-xsmall input-time' id='sun_o_1_"+index+"'> &nbsp;&nbsp;&nbsp;&nbsp; - &nbsp;&nbsp;&nbsp;&nbsp; <input type='text' class='input-xsmall input-time' id='sun_c_0_"+index+"'> : <input type='text' class='input-xsmall input-time' id='sun_c_1_"+index+"'>"+
            "</div>"+
        "</div>"+
        "<a class='btn-grey-small btn_remove' onclick=removeBrach('"+index+"')>Remove Branch</a>"+
        "</td></tr>");
        $("#tr-physical-stores").append(newRow);
        $('.chosen').chosen();
    });
});
