Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :developer unless Rails.env.production?
  provider :twitter, Settings['consumer_key'], Settings['consumer_secret']
end
