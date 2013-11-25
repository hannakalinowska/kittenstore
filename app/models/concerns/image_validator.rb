class ImageValidator < ActiveModel::Validator

  ALLOWED_CONTENT_TYPES = ['image/gif', 'image/jpeg', 'image/png']

  def validate(image)
    validate_content_type(image)
    validate_available_disk_space(image)
  end

  def validate_content_type(image)
    unless ALLOWED_CONTENT_TYPES.include?(image.attachment.content_type)
      image.errors[:base] << "This doesn't look like an image."
    end
  end

  def validate_available_disk_space(image)
    unless image.user.can_upload?
      image.errors[:base] << 'You have used all your available space. Please delete old images to upload new ones.'
    end
  end
end
