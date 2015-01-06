
require 'digest'


module Admin
    PASSWORD_MD5 = Digest::MD5.hexdigest Rails.application.secrets.admin_password


    def self.check_password(passwd)
        Digest::MD5.hexdigest(passwd) == PASSWORD_MD5
    end
end


module GoogleAnalytics
    ID = 'UA-58154442-1'
end


module SocialMedia
    FACEBOOK_URL    = 'https://www.facebook.com/pages/Fincastali-Hearth/144021969003053'
    TUMBLR_URL      = 'http://fincastali-hearth.tumblr.com/'
    TWITTER_URL     = 'https://twitter.com/fincastali'
    YOUTUBE_URL     = 'https://www.youtube.com/fincastali'
end

