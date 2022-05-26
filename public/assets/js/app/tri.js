function tri(selectObject) {
    var value = selectObject.value;

    var select = document.querySelector("#selectProductSort");
    const form_fabricant = document.querySelector("#layered_form");

    var form = new FormData(form_fabricant);
    const par = new URLSearchParams();
    form.forEach((key, value) => {
        par.append(value, key);
    });

    var tri = value;

    par.append('tri', tri);

    var Url = new URL(window.location.href);
    fetch(Url.pathname + "?" + par.toString() + "&ajax=1", {
        headers: {
            "X-Requested-With": "XMLHttpRequest"
        }

    }).then(response =>
        response.json()
    ).then(data => {
        const contenu = document.querySelector("#products_filter");
        const total_number = document.querySelector("#total");

        total_number.innerHTML = "Il y a " + data.total + " produits";
        contenu.innerHTML = data.content;
        history.pushState({}, null, Url.pathname + "?" + par.toString());

    }).catch(e => console.log(e));

}


function tri2(selectObject) {
    var value = selectObject.value;
    const para = new URLSearchParams();

    var tri = value;

    para.append('tri', tri);

    var Url = new URL(window.location.href);
    fetch(Url.pathname + "?" + para.toString() + "&ajax=1", {
        headers: {
            "X-Requested-With": "XMLHttpRequest"
        }

    }).then(response =>
        response.json()
    ).then(data => {
        const contenus = document.querySelector("#products_filter");
       
        contenus.innerHTML = data.content;
        history.pushState({}, null, Url.pathname + "?" + para.toString());

    }).catch(e => console.log(e));

}