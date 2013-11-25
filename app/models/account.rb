class Account
  attr_reader :user

  SPACE_LIMIT = 100.megabytes

  def initialize(user)
    @user = user
  end

  def used_space
    user.images.sum(:attachment_file_size)
  end

  def has_free_space?
    used_space < SPACE_LIMIT
  end
end
