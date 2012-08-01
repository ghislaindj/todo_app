$('#todos').prepend('<%= escape_javascript(render(@todos)) %>');
console.log('done.js');
