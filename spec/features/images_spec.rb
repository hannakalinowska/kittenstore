require 'integration_helper'

describe 'Images' do
  before do
    sign_in
  end

  it 'saves an uploaded image' do
    visit '/images/new'
    upload_image
    assert_image_created
  end

  it 'scrapes an image from a remote url' do
    stub_request(:get, /example\.com/).to_return(:status => 200, :body => '', :headers => {:content_type => 'image/gif'})
    visit '/images/new'
    fill_in_image_url
    assert_image_created
  end
end
