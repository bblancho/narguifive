(function ($, window, undefined) {
    const modal = $('#cartModal');

// When the user clicks on the button, open the modal
    $('.add_product').on('click', async function () {
        modal.empty();
        const id = $(this).data('idProduct');
        const html = await ((await fetch('/api/product/' + id + '/modal')).json());
        $('#panier_number')[0].innerText ++;
        modal.append(html.modal);
        $('.close_modal').on('click', function () {
            modal.css('display', 'none');
        })
        modal.css('display', 'block');
        $(document).on('click', function (event) {
            if ($(event.target)[0] === modal[0]) {
                modal.css('display', 'none');
            }
        });
    });
})(jQuery, window);
