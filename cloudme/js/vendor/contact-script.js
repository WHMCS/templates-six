$(function() {
    var paraTag = $('input#submit').parent('p');
    $(paraTag).children('input').remove();
    $(paraTag).append('<input type="button" name="submit" id="submit" class="button radius medium" value="Submit" />');

    $('#contactform input#submit').click(function() {
    $('#contactform').append('<img src="images/ajax-loader.gif" class="loaderIcon" alt="Sending..." />');

        var name = $('input#name').val();
        var email = $('input#email').val();
        var comments = $('textarea#comments').val();

        $.ajax({
            type: 'post',
            url: 'sendmail.php',
            data: 'name=' + name + '&email=' + email + '&comments=' + comments,

            success: function(results) {
                $('#contactform img.loaderIcon').fadeOut(1000);
                $('#sendstatus').html(results);
				//clear fields
                $('input[type="text"],textarea').val('');
            }
			
        }); // end ajax
    });
});
		