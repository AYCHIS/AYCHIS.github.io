
/* ========================================================== */
/*   Navigation Background Color                              */
/* ========================================================== */


/*
	$(window).on('scroll', function() {
		if($(this).scrollTop() > 100) {
			$('.navbar-fixed-top').addClass('nav-fixed-bg');
		} else {
			$('.navbar-fixed-top').removeClass('nav-fixed-bg');
		}
	});

*/




	/* ========================================================== */
	/*   WoW Animations When Scroll                               */
	/* ========================================================== */

	wow = new WOW(
		{
		animateClass: 'animated',
		offset:       100,
		mobile:       false,       // trigger animations on mobile devices (default is true)

		}
	);
	wow.init();


/* ========================================================== */
/*   SmoothScroll                                             */
/* ========================================================== */



$('.nav li a').bind('click', function(event) {

	var $anchor = $(this);

	$('html, body').stop().animate({

		scrollTop: $($anchor.attr('href')).offset().top
	}, 1500, 'easeInOutExpo');

	event.preventDefault();


});


/* ========================================================== */
/*   OnePage Navigation                                       */
/* ========================================================== */



$(document).ready(function() {
 	$('#nav-main').onePageNav();
 });


/* ========================================================== */
/*   Show IPT credits onClick    
		(no need using Boostrap Modal instead)                    */
/* ========================================================== */

 /*       
$(document).ready(function () {
  "use strict";
  var creditsblock = jQuery(".credits");
  var creditsselect = jQuery(".credits-select");
  var save = jQuery(".close");

  creditsblock.hide();

  creditsselect.click(function () {
      creditsblock.show();
  });
   
  save.click(function () {
    creditsblock.fadeOut(220);
  });

});
*/

