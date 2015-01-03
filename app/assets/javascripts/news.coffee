
$ ->
    # init collapsables
    $('.collapsable').each ->
            container   = $ this
            collapsed   = $ '.collapsable-collapsed', container
            expanded    = $ '.collapsable-expanded', container
            expAction   = $ '.collapsable-action', collapsed
            colAction   = $ '.collapsable-action', expanded

            toggle = ->
                collapsed.slideToggle()
                expanded.slideToggle()
                $('html, body').animate({ scrollTop: container.position().top });

            expAction.click ->
                expAction.hide()
                colAction.show()
                toggle()
                ga 'send', 'event', 'expand', 'click'

            colAction.click ->
                expAction.show()
                colAction.hide()
                toggle()

    null

