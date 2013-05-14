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
            if(checkHasValue(categoryFourthId)){
                newRow = $("<tr id='tr-"+categoryFourthId+"'><td>"+categoryFirstId+" &gt; "+categorySecondId+" &gt; "+categoryThirdId+" &gt; "+categoryFourthId+"</td><td><a id='remove-"+categoryFourthId+"' onclick='removeCategory(&quot;"+categoryFourthId+"&quot;)'>Remove</a></td></tr>");
            }
        }
        if(categoryFirstId && categorySecondId && categoryThirdId && !categoryFourthId){
            if(checkHasValue(categoryThirdId)){
                newRow = $("<tr id='tr-"+categoryThirdId+"'><td>"+categoryFirstId+" &gt; "+categorySecondId+" &gt; "+categoryThirdId+"</td><td><a id='remove-"+categoryThirdId+"' onclick='removeCategory(&quot;"+categoryThirdId+"&quot;)'>Remove</a></td></tr>");
            }
        }
        if(categoryFirstId && categorySecondId && !categoryThirdId && !categoryFourthId){
            if(checkHasValue(categorySecondId)){
                newRow = $("<tr id='tr-"+categorySecondId+"'><td>"+categoryFirstId+" &gt; "+categorySecondId+"</td><td><a id='remove-"+categorySecondId+"' onclick='removeCategory(&quot;"+categorySecondId+"&quot;)'>Remove</a></td></tr>");
            }
        }
        if(categoryFirstId && !categorySecondId && !categoryThirdId && !categoryFourthId){
            if(checkHasValue(categoryFirstId)){
                newRow = $("<tr id='tr-"+categoryFirstId+"'><td>"+categoryFirstId+"</td><td><a id='remove-"+categoryFirstId+"' onclick='removeCategory(&quot;"+categoryFirstId+"&quot;)'>Remove</a></td></tr>");
            }
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
function checkHasValue(categoryId){
    var tempCategory = $('#listCategory').val();
    alert(tempCategory)
    if(tempCategory == ","){
        tempCategory = "";
    }
    if(!tempCategory && categoryId){
        tempCategory = categoryId;
        $('#listCategory').val(tempCategory);
        return true;
    }
    else{
        var listCategory = tempCategory.split(',');
        for(var i=0;i<listCategory.length;i++){
            if(listCategory[i]==categoryId){
                break;
                return false;
            }
            else{
                tempCategory = categoryId+','+tempCategory;
                $('#listCategory').val(tempCategory);
                return true;
            }
        }
    }
}
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
function removeCategory(categoryId){
    $('#tr-'+categoryId).remove();
    var listCategory = $('#listCategory').val().split(',');
    var tempCategory = '';
    alert(listCategory.length);
    for(var i=0;i<listCategory.length-1;i++){
        if(listCategory[i]==categoryId){
            var index = listCategory.indexOf(categoryId);
            listCategory.splice(index, 1);
        }
        tempCategory = listCategory[i]+','+tempCategory;
    }
    $('#listCategory').val(tempCategory);
}
