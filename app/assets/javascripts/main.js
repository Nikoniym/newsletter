/**
 * Created by n on 03.11.16.
 */
$(document).ready(function() {
    $(".owl-carousel").owlCarousel({
        items : 3, //10 items above 1000px browser width
        itemsDesktop : [900,3], //5 items between 1000px and 901px
        itemsTablet: [600,2], //2 items between 600 and 0
        itemsMobile : [350,1]
    });
});