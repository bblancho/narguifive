(function ($, window, undefined) {
    //On récupère le modal
    const modal = $('#cartModal');

    // Lorsque qu'on clique sur ajouter un produit
    $('.add_product').on('click', async function () {
        // On vide le contenu du modal
        modal.empty();
        // Récupération du body html du modal en fonction du produit
        const id = $(this).data('idProduct');
        const html = await ((await fetch('/api/product/' + id + '/modal')).json());

        // On incrémente le panier
        $('#panier_number')[0].innerText ++;

        // On ajoute le code html au modal et on l'affiche
        modal.append(html.modal);
        modal.css('display', 'block');

        // Gestion de la fermeture du modal
        $('.close_modal').on('click', function () {
            modal.css('display', 'none');
        })
        $(document).on('click', function (event) {
            if ($(event.target)[0] === modal[0]) {
                modal.css('display', 'none');
            }
        });
    });
})(jQuery, window);
