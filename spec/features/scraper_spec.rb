require 'spec_helper'
require 'dsl_helper'

describe 'Scraper' do
  before do
    pending
    @client = TweetStream::Client.new

    @stream = double("EM::Twitter::Client",
                     :connect => true,
                     :unbind => true,
                     :each => true,
                     :on_error => true,
                     :on_max_reconnects => true,
                     :on_reconnect => true,
                     :connection_completed => true,
                     :on_no_data_received => true,
                     :on_unauthorized => true,
                     :on_enhance_your_calm => true
                    )
    allow(EM).to receive(:run).and_yield
    allow(EM::Twitter::Client).to receive(:connect).and_return(@stream)

    stub_request(:get, /soup\.io/).to_return(:status => 200, :body => '')
  end

  it 'scrapes images that have been tweeted to me' do
    sign_up
    run_scraper
    tweet_link
    assert_image_created
  end

  it 'ignores tweets from unknown accounts' do
    tweet_link
    run_scraper
    assert_no_images_created
  end
end
