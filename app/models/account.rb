class Account
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def used_space
    user.images.sum(:attachment_file_size)
  end
end
