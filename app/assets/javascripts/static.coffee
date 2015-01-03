
# home page stuff
$ ->
    return unless $('#site-page-home')?

    $SLIDER_HIDE    = { left:   -1000 }
    $SLIDER_PREP    = { left:    1000 }
    $SLIDER_SHOW    = { left:       0 }
    $SLIDER_TIMEOUT = 4000


    # init slider
    slider          = $ '#home-slider'
    sliderFrames    = $ 'img', slider
    sliderIndex     = 0

    sliderCurrent   = $ sliderFrames[0]

    advanceSlider = ->
        $(sliderFrames[sliderIndex]).animate $SLIDER_HIDE
        if ++sliderIndex >= sliderFrames.size()
            sliderIndex = 0
        $ sliderFrames[sliderIndex]
            .css        $SLIDER_PREP
            .animate    $SLIDER_SHOW
        setTimeout advanceSlider, $SLIDER_TIMEOUT
        null

    sliderCurrent.css $SLIDER_SHOW
    setTimeout advanceSlider, $SLIDER_TIMEOUT

    null

