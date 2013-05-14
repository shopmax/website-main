$(function(){
    $('.category_1').click(function(e){
        window.history.pushState("", "", 'uploadproduct?categoryFirstId='+this.id);
        jQuery.ajax({
            url: 'uploadproductajax',
            type: 'POST',
            data: { categoryFirstId: this.id},
            success: function(data) {
                if ($(data).find('#errorExits').length > 0) {
                  window.location.href = "/";
                }
                $('#ajax-container').html(data);
            }
        });
        e.preventDefault();
    });
    $('.category_2').click(function(e){
        var categoryFirstId = getUrlVars()["categoryFirstId"];
        window.history.pushState("", "", 'uploadproduct?categoryFirstId='+categoryFirstId+'&categorySecondId='+this.id);
        jQuery.ajax({
            url: 'uploadproductajax',
            type: 'POST',
            data: { categoryFirstId: categoryFirstId, categorySecondId: this.id},
            success: function(data) {
                if ($(data).find('#errorExits').length > 0) {
                  window.location.href = "/";
                }
                $('#ajax-container').html(data);
            }
        });
        e.preventDefault();
    });
    $('.category_3').click(function(e){
        var categoryFirstId = getUrlVars()["categoryFirstId"];
        var categorySecondId = getUrlVars()["categorySecondId"];
        window.history.pushState("", "", 'uploadproduct?categoryFirstId='+categoryFirstId+'&categorySecondId='+categorySecondId+'&categoryThirdId='+this.id);
        jQuery.ajax({
            url: 'uploadproductajax',
            type: 'POST',
            data: { categoryFirstId: categoryFirstId, categorySecondId: categorySecondId, categoryThirdId: this.id},
            success: function(data) {
                if ($(data).find('#errorExits').length > 0) {
                  window.location.href = "/";
                }
                $('#ajax-container').html(data);
            }
        });
        e.preventDefault();
    });
    $('.category_4').click(function(e){
        var categoryFirstId = getUrlVars()["categoryFirstId"];
        var categorySecondId = getUrlVars()["categorySecondId"];
        var categoryThirdId = getUrlVars()["categoryThirdId"];
        window.history.pushState("", "", 'uploadproduct?categoryFirstId='+categoryFirstId+'&categorySecondId='+categorySecondId+'&categoryThirdId='+categoryThirdId+'&categoryFourthId='+this.id);
        jQuery.ajax({
            url: 'uploadproductajax',
            type: 'POST',
            data: { categoryFirstId: categoryFirstId, categorySecondId: categorySecondId, categoryThirdId: categoryThirdId, categoryFourthId: this.id},
            success: function(data) {
                if ($(data).find('#errorExits').length > 0) {
                  window.location.href = "/";
                }
                $('#ajax-container').html(data);
            }
        });
        e.preventDefault();
    });
    $('#assign-category').click(function(e){
        if(typeof getUrlVars()["categoryFirstId"] != "undefined"){
            var categoryFirstId = getUrlVars()["categoryFirstId"];
        }
        if(typeof getUrlVars()["categorySecondId"] != "undefined"){
            var categorySecondId = getUrlVars()["categorySecondId"];
        }
        if(typeof getUrlVars()["categoryThirdId"] != "undefined"){
            var categoryThirdId = getUrlVars()["categoryThirdId"];
        }
        if(typeof getUrlVars()["categoryFourthId"] != "undefined"){
            var categoryFourthId = getUrlVars()["categoryFourthId"];
        }
        var newRow;
        if(categoryFirstId && categorySecondId && categoryThirdId && categoryFourthId){
            newRow = $("<tr><td>"+categoryFirstId+" &gt; "+categorySecondId+" &gt; "+categoryThirdId+" &gt; "+categoryFourthId+"</td><td><a>Remove</a></td></tr>");
            var tempCategory = $('#listCategory').val();
            tempCategory = categoryFourthId+','+tempCategory;
            $('#listCategory').val(tempCategory)
        }
        if(categoryFirstId && categorySecondId && categoryThirdId && !categoryFourthId){
            newRow = $("<tr><td>"+categoryFirstId+" &gt; "+categorySecondId+" &gt; "+categoryThirdId+"</td><td><a>Remove</a></td></tr>");
            var tempCategory = $('#listCategory').val();
            tempCategory = categoryThirdId+','+tempCategory;
            $('#listCategory').val(tempCategory)
        }
        if(categoryFirstId && categorySecondId && !categoryThirdId && !categoryFourthId){
            newRow = $("<tr><td>"+categoryFirstId+" &gt; "+categorySecondId+"</td><td><a>Remove</a></td></tr>");
            var tempCategory = $('#listCategory').val();
            tempCategory = categorySecondId+','+tempCategory;
            $('#listCategory').val(tempCategory)
        }
        if(categoryFirstId && !categorySecondId && !categoryThirdId && !categoryFourthId){
            newRow = $("<tr><td>"+categoryFirstId+"</td><td><a>Remove</a></td></tr>");
            var tempCategory = $('#listCategory').val();
            tempCategory = categoryFirstId+','+tempCategory;
            $('#listCategory').val(tempCategory)
        }
        $(".selected-products").append(newRow);
        e.preventDefault();
    });
    $('#yourBtn').focusin(function(){
        alert($('#yourBtn').val());
    });
    
    $("#datepicker1").datepicker();
    $("#datepickerimage1").click(function() { 
        $("#datepicker1").datepicker( "show" );
    });
    $("#datepicker2").datepicker();
    $("#datepickerimage2").click(function() { 
        $("#datepicker2").datepicker( "show" );
    });
    
    $('.shippingSize').click(function(){
    	$('.shippingSize').css({'color':'#FFFFFF'});
        $('#'+this.id).css({'color':'#358BDB'});
    	$('#shippingSize').val(this.id);
    });
    
    $('#submit_uploadProductSeller').click(function(){
        $('#uploadProductSeller').submit();
    });
    
    $('#datepicker1').change(function(){
    	var dateFormat = $('#datepicker1').val().split('/');
    	$('#promoPriceFromDate').val(dateFormat[0]+"-"+dateFormat[1]+"-"+dateFormat[2]+" 00:00:00.000");
    });
    $('#datepicker2').change(function(){
    	var dateFormat = $('#datepicker2').val().split('/');
    	$('#promoPriceThruDate').val(dateFormat[0]+"-"+dateFormat[1]+"-"+dateFormat[2]+" 00:00:00.000");
    });
});

function getUrlVars() {
    var vars = {};
    var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) {
        vars[key] = value;
    });
    return vars;
}
function getFile(inputIndex){
    document.getElementById("upfile"+inputIndex).click();
}
function sub(obj,inputIndex){
    var file = obj.value;
    if(!inputIndex){
        inputIndex = 0;
    }
    $('#yourBtn'+inputIndex).val(file);
    $('#li-'+inputIndex).addClass('uploaded');
}
