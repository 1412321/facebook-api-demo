class AlbumsController < ApplicationController
  def index
    @albums = Facebook.get_albums(current_user)
    @albums.each do |album|
      album.merge!(cover: Facebook.get_image(current_user, album["cover_photo"]["id"]))
    end
  end
  def new

  end
  def create
    @album = Facebook.create_albums(current_user, params[:title])
    @image = Facebook.create_image(current_user,@album["id"], params[:img])
  end
end
