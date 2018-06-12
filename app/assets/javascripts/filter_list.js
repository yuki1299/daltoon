$(document).ready(function(){
  $("#filter-list").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $(".class-list ul li").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
