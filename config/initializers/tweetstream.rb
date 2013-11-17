TweetStream.configure do |config|
  config.consumer_key       = Settings['consumer_key']
  config.consumer_secret    = Settings['consumer_secret']
  config.oauth_token        = Settings['access_token']
  config.oauth_token_secret = Settings['access_token_secret']
  config.auth_method        = :oauth
end
