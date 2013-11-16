class Image < ActiveRecord::Base
  belongs_to :user

  has_attached_file :attachment

  attr_accessor :remote_url
end
