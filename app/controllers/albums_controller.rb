class AlbumsController < ApplicationController
  def index
    @albums = Facebook.get_albums(current_user)
    @albums.first(5).each do |album|
      album.merge!(cover: Facebook.get_image(current_user, album["cover_photo"]["id"]))
    end
  end
end
