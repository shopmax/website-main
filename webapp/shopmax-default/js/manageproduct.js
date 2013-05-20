$(function(){
    $('.edit').click(function(){
        var currentView = this.id.split("-");
        var index = currentView[2];
        if ($('#view-edit-product-'+index).is(":hidden")) {
            var getFromDate = $('#promo-datePickerFrom'+index).val().split(" ");
            var fromDateFormat = getFromDate[0].split("-");
            $('#datePickerFrom'+index).val(fromDateFormat[1]+'/'+fromDateFormat[2]+'/'+fromDateFormat[0]);
            
            var getThruDate = $('#promo-datePickerThru'+index).val().split(" ");
            var thruDateFormat = getThruDate[0].split("-");
            $('#datePickerThru'+index).val(thruDateFormat[1]+'/'+thruDateFormat[2]+'/'+thruDateFormat[0]);
            
            $("#datePickerFrom"+index).datepicker();
            $("#datePickerThru"+index).datepicker();
            $('#view-edit-product-'+index).slideDown("slow");
        } else {
            $('#view-edit-product-'+index).slideUp("slow");
        }
    });
    $(".datepicker").click(function() {
        $("#datePicker"+this.id).datepicker("show");
    });
    $('.dateText').change(function(){
    	var dateFormat = $('#'+this.id).val().split('/');
        $('#promo-'+this.id).val(dateFormat[2]+"-"+dateFormat[0]+"-"+dateFormat[1]+" 00:00:00.000");
    });
    $('.shippingSize').click(function(){
        $('.shippingSize').css({'color':'#FFFFFF'});
        var shippingSize = (this.id).split('-');
        $('#'+this.id).css({'color':'#358BDB'});
        $('#'+shippingSize[1]).val(shippingSize[0]);
    });
});
