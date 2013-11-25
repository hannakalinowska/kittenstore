class Image < ActiveRecord::Base
  belongs_to :user

  has_attached_file :attachment
  validates_with ImageValidator

  attr_accessor :remote_url

  def self.create_from_tweet(tweet)
    user = User.find_by_uid(tweet.user.id)
    if user
      tweet.urls.each do |url_entity|
        Image.create_from_params(user, remote_url: url_entity.expanded_url)
      end
    end
  end

  def self.create_from_params(user, params)
    if params[:remote_url]
      user.images.create(:attachment => URI.parse(params[:remote_url]), :remote_url => params[:remote_url])
    else
      user.images.create(params)
    end
  end
end
