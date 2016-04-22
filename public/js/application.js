$(document).ready(function(){
	$('h1').hide().fadeIn(3000);
    $('.index_table').hide();

    $('input').focus(function(){
    	$(this).css('outline-color', 'white');
    });
    
    $('button').focus(function(){
    	$(this).css('outline-color', 'white');
    });

    $('button').click(function(){
    	$('.index_table').show("fold", 1000);
    });


    $('button').dblclick(function(){
    	window.location.href = "http://localhost:9393/list";
    });
});

