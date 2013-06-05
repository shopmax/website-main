$(function(){
    $('.edit').click(function(){
        var currentView = this.id.split("-");
        var index = currentView[2];
        $('.media-edit').slideUp("slow");
        if ($('#view-edit-product-'+index).is(":hidden")) {
            if($('#promo-datePickerFrom'+index).val()){
                var getFromDate = $('#promo-datePickerFrom'+index).val().split(" ");
                var fromDateFormat = getFromDate[0].split("-");
                $('#datePickerFrom'+index).val(fromDateFormat[1]+'/'+fromDateFormat[2]+'/'+fromDateFormat[0]);
            }
            if($('#promo-datePickerThru'+index).val()){
                var getThruDate = $('#promo-datePickerThru'+index).val().split(" ");
                var thruDateFormat = getThruDate[0].split("-");
                $('#datePickerThru'+index).val(thruDateFormat[1]+'/'+thruDateFormat[2]+'/'+thruDateFormat[0]);
            }
            
            $("#datePickerFrom"+index).datepicker();
            $("#datePickerThru"+index).datepicker();
            $('#view-edit-product-'+index).slideDown("slow");
            $('.productCategoryId').val(getUrlVars()["productCategoryId"]);
            
            $('#promoPrice'+index).change(function(){
                if($('#promoPrice'+index).val()){
                    document.getElementById("checkBoxManage"+index).checked=true;
                }
                else{
                    document.getElementById("checkBoxManage"+index).checked=false;
                }
            });
            
            if($('#promoPrice'+index).val()){
                document.getElementById("checkBoxManage"+index).checked=true;
            }
        } else {
            $('#view-edit-product-'+index).slideUp("slow");
        }
    });
    $(".datepicker").click(function() {
        $("#datePicker"+this.id).datepicker("show");
    });
    $('.dateText').change(function(){
        if($('#'+this.id).val()!=''){
            var rData = document.getElementById("promo-"+this.id).value;
            var recentDataFull = rData.substring(0, rData.length - 13);
            var partRData = recentDataFull.split("-");
            var rDay = parseInt(partRData[2], 10);
            var rMonth = parseInt(partRData[1], 10);
            var rYear = parseInt(partRData[0], 10);
            var recentData;
            if(rDay<10){
                recentData = rMonth+"/"+"0"+rDay+"/"+rYear;
            }
            if(rMonth<10){
                recentData = "0"+rMonth+"/"+rDay+"/"+rYear;
            }
            if(rMonth<10 && rDay<10){
                recentData = "0"+rMonth+"/"+"0"+rDay+"/"+rYear;
            }
            else{
                recentData = rMonth+"/"+rDay+"/"+rYear;
            }
            var parts = $('#'+this.id).val().split("/");
            var day = parseInt(parts[1], 10);
            var month = parseInt(parts[0], 10);
            var year = parseInt(parts[2], 10);
            var monthLength = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];
            if(!/^\d{2}\/\d{2}\/\d{4}$/.test($('#'+this.id).val())){
                $('#'+this.id).val(recentData);
            }
            if(year % 400 == 0 || (year % 100 != 0 && year % 4 == 0)){
                monthLength[1] = 29;
            }
            if(year < 1000 || year > 3000 || month == 0 || month > 12 ||day < 0 || day > monthLength[month - 1]){
                $('#'+this.id).val(recentData);
            }
        }
        var dateFormat = $('#'+this.id).val().split('/');
        $('#promo-'+this.id).val(dateFormat[2]+"-"+dateFormat[0]+"-"+dateFormat[1]+" 00:00:00.000");
    });
    $('.shippingSize').click(function(){
        var shippingSize = (this.id).split('-');
        if($('#'+shippingSize[1]).val() == shippingSize[0]){
            $('#'+this.id).css({'color':'#FFFFFF'});
            $('#'+shippingSize[1]).val('');
        }
        else{
          $('.shippingSize').css({'color':'#FFFFFF'});
          $('#'+this.id).css({'color':'#358BDB'});
          $('#'+shippingSize[1]).val(shippingSize[0]);
        }
    });
    $('.file').preimage();
});
