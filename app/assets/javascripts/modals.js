$(document).on('shown.bs.modal', '.modal', function() {
    $('form[data-client-side-validations]').enableClientSideValidations();
});


$(function() {


    var modal_holder_selector = '';
    const modal_selector = '.modal';



    $(document).on('click', 'a[data-modal]', function() {


        for(var i = 0;; i++)
        {
            modal_holder_selector = '#modal-holder-' + i;

            if(!$("div").is(modal_holder_selector))  { break; }
            if($(modal_holder_selector + ' ' + 'div.modal').css('display') == 'none')
            {
                $(modal_holder_selector).remove();
            }
        }


        for (var i = 0;; i++)
        {
            modal_holder_selector = '#modal-holder-' + i;

            if(!$("div").is(modal_holder_selector))  { break; }
        }

        $('body').append('<div id="' + modal_holder_selector.substring(1) + '"></div>');


        const location = $(this).attr('href');
        // Load modal dialog from server
        $.get(
            location,
            data => { $(modal_holder_selector).html(data).find(modal_selector).modal() }
        );
        return false;
    });

    $(document).on('ajax:success', 'form[data-modal]', function(event){
        const [data, _status, xhr] = event.detail;
        const url = xhr.getResponseHeader('Location');
        if (url) {
            // Redirect to url
            window.location = url;
        } else {
            // Remove old modal backdrop
            $('.modal-backdrop').remove();
            // Update modal content
            const modal = $(data).find('body').html();
            $(modal_holder_selector).html(modal).find(modal_selector).modal();
        }

        return false;
    });
});