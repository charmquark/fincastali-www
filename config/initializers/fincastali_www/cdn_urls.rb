module FincastaliWww
  #
  module CdnUrls
    CLOUDFLARE_BASE = 'https://cdnjs.cloudflare.com/ajax/libs/'.freeze
    FONTS_BASE      = 'https://fonts.googleapis.com/css?'.freeze

    FONTS_CSS = FONTS_BASE +
                'family=Caveat:400,700|Roboto:400,400i,700&amp;subset=latin-ext'
    NORMALIZE = CLOUDFLARE_BASE + 'normalize/4.2.0/normalize.min.css'
    MODERNIZR = CLOUDFLARE_BASE + 'modernizr/2.8.3/modernizr.min.js'
  end
end
