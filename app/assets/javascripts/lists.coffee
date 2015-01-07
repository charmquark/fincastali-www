
$ ->
    $ANIMATE_IN     = { opacity: 1, right: 0 }
    $ANIMATE_OUT    = { opacity: 0, right: '-50%' }
    $MAIN           = $ '#site-main > .inner'
    $MENU           = $ '#sidebar-menu a'
    $SCROLL_ARGS    = { scrollTop: $('#site-main').position().top }
    $SCROLLY        = $ 'html, body'
    $SIDEBAR        = $ '#sidebar-menu'
    $STORAGE        = $ '#lists-storage'

    # init section swapping
    currentLink = $MENU.first()
    currentSection = $ '#lists-section-intro'

    $MENU.click (event)->
        event.preventDefault()

        oldLink = currentLink
        newLink = $ this
        unless newLink == oldLink
            oldSection = currentSection
            newSection = $ newLink.attr 'href'

            oldLink.removeClass 'active'
            oldSection.animate $ANIMATE_OUT, ->
                oldSection.detach()
                    .appendTo $STORAGE
                newSection.detach().insertAfter $SIDEBAR
                scrollToTop()
                newSection.animate $ANIMATE_IN, ->
                        currentLink = newLink
                        currentSection = newSection
                        newLink.addClass 'active'


    scrollToTop = -> $SCROLLY.animate $SCROLL_ARGS

