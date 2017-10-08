class ImagesController < ApplicationController
  def new
  end
  def create
    album_id = params[:album_id]
    params[:img].each do |img|
      type = file_type(img)
      if type.match(/image\/*/)
        @image = Facebook.create_image(current_user, album_id, img)
      elsif type.match(/video\/*/)
        @image = Facebook.create_video(current_user, type, "me", img)
      end
    end
    redirect_to albums_path
  end
end
