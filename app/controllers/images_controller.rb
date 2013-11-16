class ImagesController < ApplicationController
  def index
    @images = current_user.images
  end

  def new
    @image = current_user.images.build
  end

  def create
    if image_params[:remote_url]
      @image = current_user.images.create(:attachment => URI.parse(image_params[:remote_url]))
    else
      @image = current_user.images.create(image_params)
    end
    redirect_to images_path
  end

  def destroy
    current_user.images.find(params[:id]).destroy
    redirect_to images_path
  end

  private

  def image_params
    params.require(:image).permit(:attachment, :remote_url)
  end
end
