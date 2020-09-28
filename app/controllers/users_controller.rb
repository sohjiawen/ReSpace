class UsersController < ApplicationController
  def myprofile
    @favourites = Favourite.all
  end
end
