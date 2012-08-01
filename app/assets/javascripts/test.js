$(document).ready(function() {
    $("#dueDate").datepicker({
    format: 'yyyy-mm-dd',
    autoclose: 'true',
	});


	$('.editable').editable('/ajax/editable', {
       submit : 'OK',
       cancel : 'cancel',
       style : "inherit",
       width: 100
     });

	$('.date_editable').editable('/ajax/editable', {
		submit : 'OK',
       cancel : 'cancel',
       type: 'datepicker',
       datepicker: {
   		 format: 'yyyy-mm-dd',
    	autoclose: 'true',
  		}
     });

	$('.done_editable').editable('/ajax/editable', {
       submit : 'OK',
       cancel : 'cancel',
      	data   : " {false:'Not done', true:'Done'}",
     	type   : 'select'
     });



	$("#category_form").autocomplete({
		source: '/mycategories.json',
		dataType: 'json',
		parse: function(data) {
			console.log("bla");
        var parsed = [];
        for (var i = 0; i < data.length; i++) {
            parsed[parsed.length] = {
                data: data[i],
                value: data[i].category,
                result: data[i].category
            };
        }
 
        return parsed;
	    },
	    formatItem: function(item) {
	    	console.log("formatitem");
	        return item.category;
	    }

    });


    $("#delete_multiple").click(function(){
	    var allVals = $('#todo_checkbox:checked').map(function() {
	       return $(this).val();
	     }).get();
		data = {'id' : allVals} ;
		console.log(data);
		$.ajax({
            type: "DELETE",
            url: "/todos/delete",
            data: data,
        })
    });



});


