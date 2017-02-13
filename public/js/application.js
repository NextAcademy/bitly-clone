// $(document).ready(function(){
// $( ".paste" ).on( "paste", function() {
//     setTimeout(function() {
//         $('.btn').trigger('click')
//       });
//     });
// });


$(document).ready(function(){
	$("#input").submit(function(e){
		e.preventDefault();
		$.ajax({
			url: '/urls',
			method: 'POST',
			data: $(this).serialize(),
			dataType: 'json',
			success: function(data){
				$(".table-url-links").append("<tr>" +
					"<td>"+ data.id + "</td>" +
					"<td>"+ data.long_url + "</td>" +
					"<td>"+ "<a href= /" + data.short_url + " >" + data.short_url + "</a></td>" +
					"<td>"+ data.created_at + "</td>" +
					"<td>"+ data.click_count + "</td>" +
					"</tr>");
			}
		});
	});
});


// 1. What this.serialize(): creates a URL encoded text string by serializing form values. JSON encodes objects in a string. Serialization: convert an object into string in order to be stored.

// 2. data key in ajax = The data to send to the server when performing the Ajax request

// 3. dataType? The type of data expected back from the server. It screenthrough the data that you expect to return

// 4. What do you expect out of the response? to return string of data in the table prior page reloaded