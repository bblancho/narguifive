document.addEventListener("DOMContentLoaded", function(){
  window.addEventListener('scroll', function() {
    if (window.scrollY > 235) {
      var sticky = document.getElementById('navbar_toptop').offsetTop;
      document.getElementById('navbar_toptop').classList.add('sticky');
    } else {
      document.getElementById('navbar_toptop').classList.remove('sticky');
    } 
  });
}); 