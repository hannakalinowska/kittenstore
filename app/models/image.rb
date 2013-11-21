class Image < ActiveRecord::Base
  belongs_to :user

  has_attached_file :attachment
  validates_attachment :attachment, :content_type => { :content_type => ['image/gif', 'image/jpeg', 'image/png'] }

  attr_accessor :remote_url

  def self.create_from_tweet(tweet)
    user = User.find_by_uid(tweet.user.id)
    if user
      tweet.urls.each do |url_entity|
        user.images.create(:attachment => URI.parse(url_entity.expanded_url))
      end
    end
  end
end
