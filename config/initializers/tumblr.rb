
Tumblr.configure do |config|
    secrets = Rails.application.secrets.tumblr
    config.consumer_key         = secrets['consumer_key']
    config.consumer_secret      = secrets['consumer_secret']
    config.oauth_token          = secrets['oauth_token']
    config.oauth_token_secret   = secrets['oauth_token_secret']
end

