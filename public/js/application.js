$(document).ready(function(){
	$('h1').hide().fadeIn(3000);
    $('table').hide();

    $('input').focus(function(){
    	$(this).css('outline-color', 'white');
    });
    
    $('button').focus(function(){
    	$(this).css('outline-color', 'white');
    });

    $('button').click(function(){
    	$('table').fadeIn(1000).slideDown(1000);
    });

    $('button').dblclick(function(){
    	window.location.href = "http://localhost:9393/list";
    });
});

