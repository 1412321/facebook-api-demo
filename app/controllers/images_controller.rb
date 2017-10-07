class ImagesController < ApplicationController
  def new
  end
  def create
    album_id = params[:album_id]
    params[:img].each do |img|
      @image = Facebook.create_image(current_user, album_id, img)
    end
  end
end
