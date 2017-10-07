class ImagesController < ApplicationController
  def new
  end
  def create
    album_id = params[:album_id]
    @image = Facebook.create_image(current_user, album_id, params[:img])
  end
end
