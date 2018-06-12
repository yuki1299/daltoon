$(document).ready(function($){ 
	$('.set-height-correct').css('width', $('.correct-circle').height() + 'px')
	$('.set-height-wrong').css('width', $('.wrong-circle').height() + 'px')

  // Scroll Style
  $(function() {  
    $(".scroll-style").niceScroll({
      cursorcolor:"#6d9ce6",
      cursorborder:"0",
      cursorwidth:"6px",
      background:"#d0d0d0",
    });
  });

  $(".fancybox").fancybox({
    openEffect  : 'easyIn',
    closeEffect : 'none',
  });

  setTimeout(function(){
    $.fancybox.open($('#modal'));
  }, 3*1000)
});