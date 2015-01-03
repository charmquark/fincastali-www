# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

pageNews =
    init: ->
        $('.collapsable').each ->
            container   = $ this
            collapsed   = $ '.collapsable-collapsed', container
            expanded    = $ '.collapsable-expanded', container
            expAction   = $ '.collapsable-action', collapsed
            colAction   = $ '.collapsable-action', expanded

            handler = ->
                collapsed.slideToggle()
                expanded.slideToggle()
                $('html, body').animate({ scrollTop: container.position().top });

            expAction.click ->
                expAction.hide()
                colAction.show()
                handler()
                ga 'send', 'event', 'expand', 'click'

            colAction.click ->
                expAction.show()
                colAction.hide()
                handler()
        null

$ pageNews.init

