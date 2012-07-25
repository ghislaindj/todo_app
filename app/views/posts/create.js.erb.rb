
$('#post').prepend('<%= escape_javascript(render(@todo)) %>');
console.log("bla");
$('#post > li:first').effect('highlight', {}, 3000);
$('#post_form > form')[0].reset