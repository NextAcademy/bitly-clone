$(document).ready(function(){
  $('#submitting').submit(function(x){
    x.preventDefault();
    $.ajax({
      url: '/urls',
      method: 'POST',
      data: $(this).serialize(),
      dataType: 'json',
      success: function(data){

        if (data.success){
         console.log(data);
          $('#errors').empty();
          $('#black2').append('\
            <tr>\
            <td class="center">' + data.message.id + '</td>\
            <td class="padleft">' + data.message.ori_url + '</td>\
            <td class="center underline"><a class="green" href="/' + data.message.short_url + '"target="_blank"> http://bitchly.' + data.message.short_url + '</td>\
            <td class="center">' + data.message.click_count + '</td>\
            </tr>\
            ')
        } else {
          debugger
          $("#errors").html('<p id="red">' + data.message.ori_url + '</p>')
        }
      }
    });
  });

  // $('#red').submit(function(x){
  //   x.preventDefault();
  //   $.ajax({
  //     url: '/',
  //     method: 'GET',
  //     data: $(this).serialize(),
  //     dataType: 'json',
  //     success: function(data){

  //      console.log(data);
  //       $('#black2').append('\
  //         <tr>\
  //         <td>' + data.id + '</td>\
  //         <td>' + data.ori_url + '</td>\
  //         <td>' + data.short_url + '</td>\
  //         <td class="click_count">' + data.click_count + '</td>\
  //         </tr>\
  //         ')
  //     }
  //   });
  // });
});