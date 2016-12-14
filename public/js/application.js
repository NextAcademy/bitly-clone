function createTable(long, short, count) {
	return "<tr><td>" + long + "</td><td>" + short + "</td><td>" + count + "</td></tr>"
}

$(document).ready(function(){
	// $('#main').submit(function(){
	// 		$('#message').fadeIn('slow',0.5);
	// 		alert("truncating....");
	// 		event.preventDefault();
	// });

	$('#main').submit(function(event){
		event.preventDefault();
		$.ajax({
			url: '/url',
			method: 'POST',
			dataType: 'json',
			data: $('#main').serialize(),
			success: function(output){
				$('#table > tbody > tr:first').prependTo(createTable(output.long_url, output.short_url, output.click_count))
				// $("#table-content").html(output)
			},
			error: function(output){
				$("#message").html(output.responseText)
				// do some effect
			}
		})
	})

});

