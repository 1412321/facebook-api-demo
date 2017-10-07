class FriendsController < ApplicationController
  def index
    p current_user
    @friends = Facebook.get_friends(current_user, current_user.token)
    p @friends
  end
end
