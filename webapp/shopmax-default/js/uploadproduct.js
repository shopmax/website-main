$(function(){
    $("#category_1").change(function(event){
        $("option:selected", $(this)).each(function(){
            var obj = this.id;
            $('#categoryFirstId').val(this.id);
            $('#categorySecondId').val("");
            $('#categoryThirdId').val("");
            $('#categoryFourthId').val("");
            $.ajax({
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
        });
    });
    
    $("#category_2").change(function(event){
        $("option:selected", $(this)).each(function(){
            var obj = this.id;
            $('#categorySecondId').val(this.id);
            $('#categoryThirdId').val("");
            $('#categoryFourthId').val("");
            $.ajax({
                url: 'uploadproductajax',
                type: 'POST',
                data: { categoryFirstId: $('#categoryFirstId').val(), categorySecondId: this.id},
                success: function(data) {
                    if ($(data).find('#errorExits').length > 0) {
                      window.location.href = "/";
                    }
                    $('#ajax-container').html(data);
                }
            });
        });
    });
    
    $("#category_3").change(function(event){
        $("option:selected", $(this)).each(function(){
            var obj = this.id;
            $('#categoryThirdId').val(this.id);
            $('#categoryFourthId').val("");
            $.ajax({
                url: 'uploadproductajax',
                type: 'POST',
                data: { categoryFirstId: $('#categoryFirstId').val(), categorySecondId: $('#categorySecondId').val(), categoryThirdId: this.id},
                success: function(data) {
                    if ($(data).find('#errorExits').length > 0) {
                      window.location.href = "/";
                    }
                    $('#ajax-container').html(data);
                }
            });
        });
    });
    
    $("#category_4").change(function(event){
        $("option:selected", $(this)).each(function(){
            var obj = this.id;
            $('#categoryFourthId').val(this.id);
            $.ajax({
                url: 'uploadproductajax',
                type: 'POST',
                data: { categoryFirstId: $('#categoryFirstId').val(), categorySecondId: $('#categorySecondId').val(), categoryThirdId: $('#categoryThirdId').val(), categoryFourthId: this.id},
                success: function(data) {
                    if ($(data).find('#errorExits').length > 0) {
                      window.location.href = "/";
                    }
                    $('#ajax-container').html(data);
                }
            });
        });
    });
    
    $('#assign-category').click(function(){
        $('.input-error2').addClass('hidden');
        var formUpload = document.getElementById('uploadAndUpdateProduct');
        formUpload.getElementsByTagName('input').checked=true;
        if($('#categoryFirstId').val() != ""){
            var categoryFirstId = $('#categoryFirstId').val();
            var categoryName = ($('#'+categoryFirstId).val()).split("-");
            var categoryFirstName = categoryName[1];
        }
        if($('#categorySecondId').val() != ""){
            var categorySecondId = $('#categorySecondId').val();
            var categoryName = ($('#'+categorySecondId).val()).split("-");
            var categorySecondName = categoryName[1];
        }
        if($('#categoryThirdId').val()){
            var categoryThirdId = $('#categoryThirdId').val();
            var categoryName = ($('#'+categoryThirdId).val()).split("-");
            var categoryThirdName = categoryName[1];
        }
        if($('#categoryFourthId').val()){
            var categoryFourthId = $('#categoryFourthId').val();
            var categoryName = ($('#'+categoryFourthId).val()).split("-");
            var categoryFourthName = categoryName[1];
        }
        var newRow;
        if(categoryFirstId && categorySecondId && categoryThirdId && categoryFourthId){
            if(checkHasValue(categoryFourthId)){
                newRow = $("<tr id='tr-"+categoryFourthId+"'><td>"+categoryFirstName+" &gt; "+categorySecondName+" &gt; "+categoryThirdName+" &gt; "+categoryFourthName+"</td><td><a id='remove-"+categoryFourthId+"' onclick='removeCategory(&quot;"+categoryFourthId+"&quot;)'>Remove</a></td></tr>");
            }else{alert(" This category already assign");}
        }
        if(categoryFirstId && categorySecondId && categoryThirdId && !categoryFourthId){
            if($('#category_4').find('option').length == 0){
                if(checkHasValue(categoryThirdId)){
                    newRow = $("<tr id='tr-"+categoryThirdId+"'><td>"+categoryFirstName+" &gt; "+categorySecondName+" &gt; "+categoryThirdName+"</td><td><a id='remove-"+categoryThirdId+"' onclick='removeCategory(&quot;"+categoryThirdId+"&quot;)'>Remove</a></td></tr>");
                }else{alert(" This category already assign");}
            }else{
                alert('Please assign a product to leaf node category');
            }
        }
        if(categoryFirstId && categorySecondId && !categoryThirdId && !categoryFourthId){
            if($('#category_3').find('option').length == 0){
                if(checkHasValue(categorySecondId)){
                    newRow = $("<tr id='tr-"+categorySecondId+"'><td>"+categoryFirstName+" &gt; "+categorySecondName+"</td><td><a id='remove-"+categorySecondId+"' onclick='removeCategory(&quot;"+categorySecondId+"&quot;)'>Remove</a></td></tr>");
                }else{alert(" This category already assign");}
            }else{
                alert('Please assign a product to leaf node category');
            }
        }
        if(categoryFirstId && !categorySecondId && !categoryThirdId && !categoryFourthId){
            if($('#category_2').find('option').length == 0){
                if(checkHasValue(categoryFirstId)){
                    newRow = $("<tr id='tr-"+categoryFirstId+"'><td>"+categoryFirstName+"</td><td><a id='remove-"+categoryFirstId+"' onclick='removeCategory(&quot;"+categoryFirstId+"&quot;)'>Remove</a></td></tr>");
                }else{alert(" This category already assign");}
            }else{
                alert('Please assign a product to leaf node category');
            }
        }
        $(".selected-products").append(newRow);
    });
    
    $("#datepicker1").datepicker();
    $("#datepickerimage1").click(function() {
        $("#datepicker1").datepicker( "show" );
    });
    $("#datepicker2").datepicker();
    $("#datepickerimage2").click(function() { 
        $("#datepicker2").datepicker( "show" );
    });
    
    $('#datepicker1').change(function(){
        var dateFormat = $('#datepicker1').val().split('/');
        $('#promoPriceFromDate').val(dateFormat[2]+"-"+dateFormat[0]+"-"+dateFormat[1]+" 00:00:00.000");
    });
    $('#datepicker2').change(function(){
        var dateFormat = $('#datepicker2').val().split('/');
        $('#promoPriceThruDate').val(dateFormat[2]+"-"+dateFormat[0]+"-"+dateFormat[1]+" 00:00:00.000");
    });
    $('#promoPrice').change(function(){
        if($('#promoPrice').val()){
            document.getElementById("checkboxUpload").checked=true;
        }
        else{
            document.getElementById("checkboxUpload").checked=false;
        }
    });
    $('.input-price').keydown(function(e){
        if($('#'+this.id).val().indexOf(".")==-1 && e.keyCode === 110 && $('#'+this.id).val()==''){
            return false;
        }
        if($('#'+this.id).val().split('.').length ===2 && e.keyCode === 110){
            return false;
        }
    });
    $('.input-date').change(function(e){
        var parts = $('#'+this.id).val().split("/");
        var day = parseInt(parts[1], 10);
        var month = parseInt(parts[0], 10);
        var year = parseInt(parts[2], 10);
        var monthLength = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];
        if(!/^\d{2}\/\d{2}\/\d{4}$/.test($('#'+this.id).val())){
            $('#'+this.id).val('');
        }
        if(year % 400 == 0 || (year % 100 != 0 && year % 4 == 0)){
            monthLength[1] = 29;
        }
        if(year < 1000 || year > 3000 || month == 0 || month > 12 ||day < 0 || day > monthLength[month - 1]){
            $('#'+this.id).val('');
        }
    });
    $('#stock').change(function(){
        var defaultStock = document.getElementById(this.id).defaultValue;
        if ($('#'+this.id).val()<defaultStock){
            $('#'+this.id).val(defaultStock);
        }
    });
});
function checkHasValue(categoryId){
    var tempCategory = $('#listCategory').val();
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
            else if(i==listCategory.length-1 && listCategory[i]!=categoryId){
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
    document.getElementById("upfile_"+inputIndex).click();
}
function removeCategory(categoryId){
    $('#tr-'+categoryId).remove();
    var listCategory = $('#listCategory').val().split(',');
    var listCategoryRemove = $('#listCategoryRemove').val();
    var tempCategory = '';
    for(var i=0;i<listCategory.length;i++){
        if(listCategory[i]==categoryId){
            var index = listCategory.indexOf(categoryId);
            if(!listCategoryRemove){
                listCategoryRemove = categoryId;
            }
            else{
                listCategoryRemove = listCategoryRemove + ',' +categoryId;
            }
            listCategory.splice(index, 1);
            $('#listCategoryRemove').val(listCategoryRemove)
        }
        if(typeof listCategory[i] != "undefined"){
            if(tempCategory){
                tempCategory = tempCategory +','+ listCategory[i];
            }
            else{
                tempCategory = listCategory[i];
            }
        }
    }
    $('#listCategory').val(tempCategory);
}
function isNumberKey(evt) {
    var charCode = (evt.which) ? evt.which : evt.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46){
        return false;
    }
    return true;
 }
function isNumberKeyNoneDecimal(evt) {
    var charCode = (evt.which) ? evt.which : evt.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57)){
        return false;
    }
    return true;
 }