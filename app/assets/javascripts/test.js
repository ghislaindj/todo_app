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
		source: availableCategories
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

    $("tr.todo").each(function() {
  		$this = $(this)
  		var date = $this.find("td.date_editable").html();
  		var done = $this.find("td.done_editable").html();
  		if(done == true){
  			$this.css("color:red");
  		}
  		else {
  			$this.css("color:red");

  		}

});



});


