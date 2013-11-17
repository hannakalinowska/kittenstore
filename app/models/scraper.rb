require 'em-twitter'

class Scraper
  def self.run
    new.run
  end

  def run
    client = TweetStream::Client.new

    client.on_anything do |event|
      Rails.logger.info "[#{Time.now}] Event: #{event.inspect}"
    end

    client.on_error do |message|
      Rails.logger.info "[#{Time.now}] Error: #{message}"
    end

    client.userstream do |tweet|
      Image.create_from_tweet(tweet)
    end
  end
end
