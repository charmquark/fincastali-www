#= require jquery
#= require jquery_ujs

$ ->
    $SCROLLY = $ 'html, body'

    # card headings
    $('.heading[data-bg]').each ->
        elt = $ this
        elt.css { 'background-image': "url('#{ elt.data 'bg' }')" }

    # init social media icons behavior
    contact = $ '#site-contact'
    $('#site-contact-social-media a').each ->
        elt     = $ this
        clazz   = "hover-#{ elt.data 'hover' }"
        elt.hover ->
            contact.toggleClass clazz 

    # init "smooth" links
    handleSmoothClick = (event)->
        event.preventDefault()
        target = $ event.currentTarget
        $SCROLLY.animate { scrollTop: target.data('smooth').position().top }, ->
            window.location.hash = target.attr 'href'

    $('a[data-smooth]').each ->
        elt = $ this
        elt.data 'smooth', $(elt.attr 'href')
        elt.click handleSmoothClick
