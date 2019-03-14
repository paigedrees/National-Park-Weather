/*

Inspired by the work of the guys at Tubik Studio.
Dribble: https://dribbble.com/Tubik.
https://dribbble.com/shots/2710181-Tubik-Studio-Ice.

*/


var initialSlide = $('.slides-container [data-order="1"]');
var initalSelected = $('.slide-navigation__txt [data-order="1"]');
var mq_medium = window.matchMedia( '(min-width: 860px)' );
var mq_big = window.matchMedia( '(min-width: 1200px)' );


function activate_slide(order){
    
  var unactiveSlide = $('.slide.active');
  var activeSlide = $('.slides-container [data-order="'+order+'"]');
  
  if( !(activeSlide.hasClass('active')) ){
      slide_in(activeSlide);
      slide_out(unactiveSlide);
  }
}

function slide_in(slide) {
  
  var _this = slide;
  
  animation_in(slide);
  _this.addClass('active');
  TweenMax.to(_this, 1, {autoAlpha:1}, '-=1');
  
}

function slide_out(slide){
  
  var _this = slide;
  
  _this.css( 'z-index', '2' );
  _this.removeClass('active');
  TweenMax.to(_this, 1, {autoAlpha:0, onComplete: removeZ});
  
  function removeZ(){
    _this.css( 'z-index', '1' );
  }  
  
  animation_out(slide);
}

function animation_in(slide){
  var weather = $(slide).find('.slide-content');
  TweenMax.fromTo(weather, 0.5,{autoAlpha:0, x:-200}, {autoAlpha:1, x:0, ease: Power2.easeOut},'-0.2');
}

function animation_out(slide){
  var weather = $(slide).find('.slide-content');
  TweenMax.to(subtitle, 0.5, {autoAlpha:0, x:200});
}

$('.slide-navigation__txt span').on('click', function(){
  
  var _this = $(this);
  var order = _this.data('order');
  var spans = $('.slide-navigation__txt span');
  var current = $('.active').data('order');
  
  spans.removeClass('active');
  _this.addClass('active');
  activate_slide(order); 
});

$(document).ready(function() {
  
  initialSlide.addClass('active');
  initalSelected.addClass('active');
  TweenMax.to(initialSlide, 0.5, {autoAlpha:1});
  
});