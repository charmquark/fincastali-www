// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
// require turbolinks
//= require_tree .

(function() {
    var $SCROLLY;


    $(function() {
        $SCROLLY = $('html, body');

        // card headings
        $('.heading[data-bg]').each(function() {
            var elt = $(this);
            elt.css('background-image', 'url("' + elt.data('bg') + '")');
        });

        // init site-contact behavior
        var contact = $('#site-contact');
        $('#site-contact-social-media a').each(function() {
            var elt     = $(this);
            var name    = elt.data('hover');
            var clazz   = "hover-" + name;
            elt.hover(function() { contact.toggleClass(clazz); });
        });

        // init "smooth" links
        $('a[data-smooth]').each(function() {
            var elt     = $(this);
            elt.data('smooth', $(elt.attr('href')));
            elt.click(smoothLinkHandler);
        });
    });


    function smoothLinkHandler(event) {
        event.preventDefault();
        $SCROLLY.animate({ scrollTop: $(event.target).data('smooth').position().top });
    }
})();
