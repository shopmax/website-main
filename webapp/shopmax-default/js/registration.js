function addBranch(){
    /*jQuery.ajax({
        url: 'registrationajax',
        type: 'POST',
        data: {},
        success: function(data) {
            $("#tr-physical-stores").append(data);
        }
    });*/
}

$(function(){
    $('.container.content').addClass('promotion');
    
    $('#submit-createcustomer').click(function(){
        $('#createcustomer').submit();
    });
    $('.chk_regis').click(function(){
        if($('.chk_regis').is(':checked')){
            $('.business-registered').removeClass('hidden');
            $('#businessUser').val("Y");
        }
        else{
            $('.business-registered').addClass('hidden');
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
    $('.expireDate').change(function(e){
        $('#expireDate').val($('#expMonth').val()+"/"+$('#expYear').val());
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
});
