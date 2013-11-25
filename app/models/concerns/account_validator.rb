class AccountValidator < ActiveModel::Validator
  def validate(image)
    unless image.user.can_upload?
      record[:base] << 'You cannot upload images.'
    end
  end
end
