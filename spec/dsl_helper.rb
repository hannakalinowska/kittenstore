def sign_up
  User.create!(:provider => 'twitter', :uid => 1712975815)
end

def tweet_link
  expect(@stream).to receive(:each).and_yield(valid_tweet)
end

def run_scraper
  EM.run do
    Scraper.run
    EM::Timer.new(3) { EM.stop }
  end
end

def assert_image_created
  Image.count.should == 1
end

def valid_tweet
  File.read(File.join('spec', 'fixtures', 'valid_tweet.json'))
end

def upload_image(image = 'image.jpeg')
  attach_file 'image_attachment', File.join('spec', 'fixtures', image)
  click_button 'Upload'
end

def fill_in_image_url
  fill_in :image_remote_url, :with => 'http://example.com/image.jpg'
  click_button 'Save'
end

def assert_signed_in
  page.should have_text 'foo'
end

def assert_signed_out
  page.should have_text 'Signed out'
  page.should_not have_text 'foo'
end

def sign_in
  visit '/'
  click_link 'Sign in with Twitter'
end
