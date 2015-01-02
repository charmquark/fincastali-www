# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

pageHome =
    SLIDER_STATES:
        HIDE: { left:   -1000 }
        PREP: { left:    1000 }
        SHOW: { left:       0 }

    SLIDER_TIMEOUT: 4000


    sliderIndex: 0


    init: ->
        if $('#site-page-home')?
            pageHome.initSlider()
        null


    advanceSlider: ->
        idx     = pageHome.sliderIndex
        frames  = pageHome.sliderFrames

        $ frames[idx]
            .animate pageHome.SLIDER_STATES.HIDE
        if (++idx >= frames.size())
            idx = 0
        $ frames[idx]
            .css pageHome.SLIDER_STATES.PREP
            .animate pageHome.SLIDER_STATES.SHOW
        pageHome.sliderIndex = idx
        setTimeout pageHome.advanceSlider, pageHome.SLIDER_TIMEOUT
        null


    initSlider: ->
        slider  = $ '#home-slider'
        frames  = @sliderFrames = $ 'img', slider
        current                 = $ frames[0]

        current.css @SLIDER_STATES.SHOW
        setTimeout this.advanceSlider, @SLIDER_TIMEOUT
        null


$ pageHome.init

