var storage = JSON.parse(localStorage.getItem("produit"));
if (!storage) {
    storage = [];
    document.getElementById('panier_number').innerHTML = 0;
} else {
    document.getElementById('panier_number').innerHTML = storage.length;
}

function panier_gestion(a) {
    ant = {
        id: a
    };
    ancien = JSON.parse(localStorage.getItem("produit"));
    if (ancien) {

        ancien.push(ant);
        localStorage.setItem("produit", JSON.stringify(ancien));
        console.log(ancien);
        document.getElementById('panier_number').innerHTML = ancien.length;
    } else {
        ancien = [];
        ancien.push(ant);
        localStorage.setItem("produit", JSON.stringify(ancien));
        console.log(ancien);
        document.getElementById('panier_number').innerHTML = ancien.length;

    }

}

function mara(object) {

    //alert(object.getAttribute('id'));
    var tab = object.getAttribute('id').split("_");
    if (tab[1] == "actif") {
        var m = "#layered_manufacturer_" + tab[2];
    } else {
        var m = "#layered_quantity_" + tab[2];
    }

    $(m).prop("checked", false);
    var Myquant = new Array();

    const myfilterform = document.querySelector("#layered_form");
    const formulaire = new FormData(myfilterform);
    const parametre = new URLSearchParams();
    formulaire.forEach((key, value) => {
        if (value.includes('layered_quantity')) {
            Myquant.push(key);

        }
        parametre.append(value, key);
    });

    const sorting = $('#productsSortForm option:selected').val()

    parametre.append('tri', sorting);

    const lien = new URL(window.location.href);
    fetch(lien.pathname + "?" + parametre.toString() + "&ajax=1", {
        headers: {
            "X-Requested-With": "XMLHttpRequest"
        }

    }).then(response =>
        response.json()
    ).then(data => {
        const contents = document.querySelector("#products_filter");
        const totals = document.querySelector("#total");
        const myfiltre_actif = document.querySelector("#filtre_actif");
        const Q0 = document.querySelector("#quantity_0");
        const Q1 = document.querySelector("#quantity_1");

        nombre = Object.keys(data.fabs).length;
        var text = "";
        for (var i = 0; i < nombre; i++) {
            var id = data.fabs[i].id;
            var nom = data.fabs[i].nom;
            text = text + "<li>" +
                "<a  role =\"button\" data-rel=\"layered_manufacturer_" + id + "\" title=\"Annuler\"><i class=\"icon-remove\" id=\"filtre_actif_" + id + "\" onclick=\"mara(this)\"></i></a>" +
                "Fabricant : " + nom +
                "</li>";
        }

        if (Myquant != null) {
            if (Myquant.includes("0")) {
                text = text + "<li>" +
                    "<a  role =\"button\" data-rel=\"layered_quantity_0 \" title=\"Annuler\"><i class=\"icon-remove\" id=\"disp_actif_0\" onclick=\"mara(this)\"></i></a>" +
                    "Disponibilité : En cours de réapprovisionnements</li>";
            }
            if (Myquant.includes("1")) {
                text = text + "<li>" +
                    "<a  role =\"button\" data-rel=\"layered_quantity_1 \" title=\"Annuler\"><i class=\"icon-remove\" id=\"disp_actif_1\" onclick=\"mara(this)\"></i></a>" +
                    "Disponibilité : En stock</li>";
            }

        }
        Q0.innerHTML = " (" + data.nbre_dispo[0] + ")";
        Q1.innerHTML = " (" + data.nbre_dispo[1] + ")";
        myfiltre_actif.innerHTML = text;
        totals.innerHTML = "Il y a " + data.total + " produits";
        contents.innerHTML = data.content;
        history.pushState({}, null, lien.pathname + "?" + parametre.toString());

    }).catch(e => console.log(e));
}

