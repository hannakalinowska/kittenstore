require 'spec_helper'
require 'dsl_helper'

def create_default_user
  User.create!(default_user_params)
end

def default_user_params
  { uid: '123456', name: 'foo', provider: 'twitter' }
end

OmniAuth.config.test_mode = true
OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
  :provider => default_user_params[:provider],
  :uid => default_user_params[:uid],
  :info => {
    'nickname' => default_user_params[:name],
    'image' => 'http://example.com/image'
  }
})
