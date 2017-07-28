$(document).ready(function(){
  $("#create_url").on("submit", function(event){
    event.preventDefault()
    form_inputs = $(this).serialize()
    $.ajax({
      url: "/test",
      method: "post",
      data: form_inputs,
      dataType: "json",
      success: function(data){
        debugger
        $("tbody").append(
          "<tr><td><a href=" + data.long_urls + ">" +
          data.long_urls + "</a>" +
          "</td><td>" +
          data.short_urls +
          "</td><td>0</td><td></td></tr>"
        )
      }
    })
  })
})
