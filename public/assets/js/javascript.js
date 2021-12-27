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
});
