require 'integration_helper'

describe 'Login' do
  it 'signs in an existing user' do
    create_default_user
    visit '/'
    click_link 'Sign in with Twitter'
    assert_signed_in
  end

  it 'signs up a new user' do
    visit '/'
    click_link 'Sign in with Twitter'
    assert_signed_in
  end

  it 'signs out' do
    sign_in
    click_link 'Sign out'
    assert_signed_out
  end
end
