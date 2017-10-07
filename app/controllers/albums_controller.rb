class AlbumsController < ApplicationController
  require 'date'
  def index
    @albums = Facebook.get_albums(current_user)
    @albums.first(2).each do |album|
      # album.merge!(likes: Facebook.get_object(current_user.token, "#{album["id"]}/likes", fields:'total_count,summary(true)'))
      # p album[:likes]
      album.merge!(comments: Facebook.get_object(current_user.token, "#{album["id"]}/comments"))
      if album["cover_photo"]
        album.merge!(cover: Facebook.get_image(current_user, album["cover_photo"]["id"]))
      end
      p album[:cover]
    end
  end
  def new

  end
  def create
    @album = Facebook.create_albums(current_user, params[:title])
    params[:img].each do |img|
      @image = Facebook.create_image(current_user, @album["id"], img)
    end
  end
end
