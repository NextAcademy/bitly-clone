$('document').ready(function() {

	$('#history-table').children().hide()

  $('#request_form').submit(function(event) {

    var random = $('#request_form').serialize()

    $.ajax({
      url: '/shorten_url',
      method: 'POST',
      data: random,
      success: function(data) {
        if (data === 'Not a valid URL') {
          alert(data)
          update = document.getElementById('show-me-the-money')
          update.innerHTML = data
        } else {
        	alert('Your new link has been added')
        	var update = document.getElementById('show-me-the-money')
        	update.innerHTML = 'Your new link is http://localhost:9393/' + JSON.parse(data).short_url
        	 }
      }
    })
    event.preventDefault()
  })

  historyTable()

})

function historyTable () {
  $('history_table_button').on('click', function(event){
    $.ajax({
      url: '/list_url',
      method: 'GET',
      success: function(data){
        console.log(data)
      }
    })
    event.preventDefault()
  })
}
