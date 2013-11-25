class ImagesController < ApplicationController
  before_filter :ensure_logged_in

  def index
    @images = current_user.images
  end

  def new
    @image = current_user.images.build
  end

  def create
    @image = Image.create_from_params(current_user, image_params)
    if @image.save
      redirect_to images_path, notice: 'Your image has been saved.'
    else
      render :new
    end
  end

  def destroy
    current_user.images.find(params[:id]).destroy
    redirect_to images_path, notice: 'Your image has been deleted.'
  end

  private

  def image_params
    params.require(:image).permit(:attachment, :remote_url)
  end
end
