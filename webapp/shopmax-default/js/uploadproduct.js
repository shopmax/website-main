function getUrlVars() {
    var vars = {};
    var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) {
        vars[key] = value;
    });
    return vars;
}

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
});