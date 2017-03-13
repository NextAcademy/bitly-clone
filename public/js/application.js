$(document).ready(function() {
	$('#url-form').submit(function(e) {
		e.preventDefault();
		$.ajax({
			url: $(this).attr('action'),
			method: 'POST', 
			data: $(this).serialize(),
			dataType: 'json',
			success: function(data) {
				if(data.serial_code) {
					var shortUrl = request.base_url + '/' + data.serial_code;
					var link = data.link;
					$('#error-new-entry').append('<div class=\'new-url\'>URL added! Lnkshortnr URL: <a href=' + shortUrl + '>' + shortUrl + '</a></div>');
				} else {
					var errorMsg = data.error;
					$('#error-new-entry').append('<div class=\'error-msg\'>' + errorMsg + '</div>');
				}
			},
			error: function(data){
				console.log(data)
			}
		})
	})
})