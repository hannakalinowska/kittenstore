require 'spec_helper'

describe Image do
  describe '.create_from_tweet' do
    let(:user) { double('user', :id => '1234', :images => images) }
    let(:images) { Image }
    let(:urls) { [double('url', :expanded_url => 'http://example.com')] }
    let(:tweet) { double('tweet', :user => user, :urls => urls) }

    before do
      stub_request(:get, /example\.com/).to_return(:status => 200, :body => '', :headers => {:content_type => 'image/gif'})
    end

    it 'creates an image for a known user' do
      User.stub(:find_by_uid => user)
      expect {
        Image.create_from_tweet(tweet)
      }.to change {Image.count}.by(1)
    end

    it 'ignores unknown users' do
      expect {
        Image.create_from_tweet(tweet)
      }.to_not change {Image.count}
    end
  end
end
