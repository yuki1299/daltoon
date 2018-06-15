$(document).ready(function($){ 
  $('.set-height-correct').css('width', $('.wrong-circles-box').height() + 'px')
	$('.set-height-correct').css('height', $('.wrong-circles-box').height() + 'px')
  $('.set-height-wrong').css('width', $('.correct-circles-box').height() + 'px')
	$('.set-height-wrong').css('height', $('.correct-circles-box').height() + 'px')

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
  }, 1*1000)
});