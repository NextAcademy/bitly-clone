$(document).ready(function(){
  $('#submitting').submit(function(x){
    x.preventDefault();
    $.ajax({
      url: '/',
      method: 'POST',
      data: $(this).serialize(),
      dataType: 'json',
      success: function(data){

       console.log(data);
        $('#black2').append('\
          <tr>\
          <td class="center">' + data.id + '</td>\
          <td class="padleft">' + data.ori_url + '</td>\
          <td class="center underline"><a class="green" href="/' + data.short_url + '"target="_blank"> http://bitchly.' + data.short_url + '</td>\
          <td class="center">' + data.click_count + '</td>\
          </tr>\
          ')
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