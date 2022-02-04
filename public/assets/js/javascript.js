jQuery(document).ready(function () {
  // Afficher cacher
  $("#tab2show").hide();
  $("#tab3show").hide();
  $("#tab4show").hide();

  // Au click sur le lien
  $(".lien_category").click(function () {
    //Hide all divs inside div 'tabShows'
    $(".produits").hide(5000, "linear", function () {
      alert("Titre bien caché");
    });

    console.log("#" + $(this).attr("id") + "show");

    //Show only div that was clicked, e.g. tab1show
    $("#" + $(this).attr("id") + "show").show(2000);
  });

  $("#all").click(function () {
    $(".produits").show(3000, "linear");
  });

  /**************** Onglet *******************/ 

  // Au click sur le lien

//   function pop_toogle (section){
//     document.querySelectorAll("[data-route]").forEach( e => {

//         e.classList.remove("is-active");
//     });
//     // querySelectorAll return an array of dom elements, u can access them directly.

//     // I suppose in your case that ' section ' variable is the clicked element so :

//     document.querySelectorAll("[data-route]").forEach( e => {

//         e.classList.add("is-active");
//     });

//    // if not you have to store the dom element from the event, and add the class here.
// }

  $(".onglet_categorie button").click(function () {
    let categorie;

    categorie = $(this).attr("id");

    $(".tab-pane").removeClass("fade");
    $(".tab-pane").removeClass("show");

   console.log(categorie) ;
  });


});
