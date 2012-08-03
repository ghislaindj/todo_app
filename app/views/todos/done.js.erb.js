
$('#todo_table').replaceWith('<%= escape_javascript(render :partial => @todos ) %>');
console.log('done.js');
