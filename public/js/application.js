$(document).ready(function() {
    // $('#main-heading').animate(){


    // }
    $('#url-form').submit(function(event) {
        event.preventDefault();

        $.ajax({
            type: 'POST',
            url: '/urls',
            data: $(this).serialize(),
            dataType: 'json',
            success: function(data) {

                var newDiv = document.getElementById('added');
                var choix = document.createElement('div');
                var anchor = "https://linkmuncher.herokuapp.com/" + data.short_url;
                var link = "<a href='" + anchor + "' >" + anchor + "</a>";
                var oldurl = data.long_url;
                var cc = data.click_count;
                var row = $("<tr><td>" + oldurl + "</td><td>" + link + "</td><td>" + cc + "</td></tr>");

                if (data.response == "Error") {
                    choix.innerHTML = "Gross! Feed me proper urls!"
                    newDiv.appendChild(choix);
                } else {
                    choix.innerHTML = "Yummy! " + data.long_url + " is now " + link;
                    newDiv.appendChild(choix);
                    $("#url").val('http://');
                    $('#urltable tr:first').after(row);
                }
            }
        })

    });
});
