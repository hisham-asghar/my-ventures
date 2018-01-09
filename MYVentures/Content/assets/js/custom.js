$(document).ready(function() {
    var $body = $("body");
    if ($body.hasClass("main_landing")) {
        MainLandingFunc();
    }

})
function MainLandingFunc()
{
    var kenburn = true;
    function initKenburn() {
        var hasKenburns = $('.kenburn-hero')[0];
        if (hasKenburns) {

            var wHeight = $(window).height();
            var w_width = $(window).width();
            var imagesListKB = JSON.parse($(".kenburn-hero.animated-hero").attr("image-data"));
            $('.kenburns').attr('width', w_width);
            $('.kenburns').attr('height', wHeight);
            $('.kenburns').kenburns({
                images: imagesListKB,
                frames_per_second: 50,
                display_time: 8400,
                fade_time: 1000,
                zoom: 1,
                background_color: '#000000'
            });
        }

    } // initKenburns
    initKenburn();

    $('.show-map').on('click', function (e) {
        //debugger;
        e.preventDefault();
        $('.contact-info-wrapper').toggleClass('map-open');
        $('.show-info-link').toggleClass('info-open');
    });

    $('.show-info-link').on('click', function (e) {
        e.preventDefault();
        $('.contact-info-wrapper').toggleClass('map-open');
        $(this).toggleClass('info-open');
    });
    var myLatlng = new google.maps.LatLng(31.4640581, 74.3859547);
    var mapOptions = {
        zoom: 15,
        center: myLatlng,
        scrollwheel: false, //we disable de scroll over the map, it is a really annoing when you scroll through page

        // Styling of the map in JSON object
        styles: [{ "featureType": "administrative", "elementType": "labels.text.fill", "stylers": [{ "color": "#444444" }] }, { "featureType": "landscape", "elementType": "all", "stylers": [{ "color": "#f2f2f2" }] }, { "featureType": "poi", "elementType": "all", "stylers": [{ "visibility": "off" }] }, { "featureType": "road", "elementType": "all", "stylers": [{ "saturation": -100 }, { "lightness": 45 }] }, { "featureType": "road.highway", "elementType": "all", "stylers": [{ "visibility": "simplified" }] }, { "featureType": "road.arterial", "elementType": "labels.icon", "stylers": [{ "visibility": "off" }] }, { "featureType": "transit", "elementType": "all", "stylers": [{ "visibility": "off" }] }, { "featureType": "water", "elementType": "all", "stylers": [{ "color": "#cdd2d4" }, { "visibility": "on" }] }]
    };

    var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);

    var marker = new google.maps.Marker({
        position: myLatlng,
        icon: '/Content/MY/My2.png',
        title: "MY Ventures Office"
    });

    marker.setMap(map);
}