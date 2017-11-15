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
          <td>' + data.id + '</td>\
          <td>' + data.ori_url + '</td>\
          <td>' + data.short_url + '</td>\
          <td class="click_count">' + data.click_count + '</td>\
          </tr>\
          ')
      }
    });
  });
});