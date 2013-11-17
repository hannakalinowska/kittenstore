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
