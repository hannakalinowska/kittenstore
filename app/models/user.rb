class User < ActiveRecord::Base
  has_many :images

  validates :name, presence: true
  validates :uid, presence: true
  validates :provider, presence: true


  def self.from_omniauth(auth)
    find_and_update_from_omniauth(auth) || create_from_omniauth(auth)
  end

  def self.find_and_update_from_omniauth(auth)
    user = where(auth.slice('provider', 'uid')).first
    user.update_from_omniauth(auth) if user
    user
  end

  def update_from_omniauth(auth)
    update_attributes(name: auth['info']['nickname'], profile_image: auth['info']['image'])
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.name = auth['info']['nickname']
      user.profile_image = auth['info']['image']
    end
  end
end
