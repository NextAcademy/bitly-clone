$(document).ready(function(){
	var form = $("#form")
	form.submit(function(event){
		event.preventDefault();
		$("#message").append('<p id="mot">Your url is being processed...</p>');

		$.ajax({
			url: '/urls',
			method: 'POST',
			data: form.serialize(),
			dataType: 'json',
			success: function(data){
				console.log(data);
				$('#mot').hide();
				$('tbody').append('\
					<tr>\
	            		<td class="big_box">' + data.longUrl +'</td>\
	            		<td class="small_box"><a href="http://localhost:9393/data.shortUrl">'+data.shortUrl+'</a></td>\
	            		<td class="count_click small_box">' + data.countClick +'</td>\
        			</tr>')},
			error: function(data){

				$('#mot').hide();
				$("#message").append('<p id="mot2">Sorry, you give a wrong url, try again...</p>');

			},
			complete: function(data){
				$('#mot2').hide();
				$("#search_bar").val('')
				
			}
		});
	});
});