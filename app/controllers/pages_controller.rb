require 'open-uri'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def ar
    url = 'https://poly.googleapis.com/v1/assets/cLydFlVg-wI/?key=AIzaSyA6vXM5PuimkcY3LJ-GtJPX78aAeeWS6xM'
    file = JSON.parse(open(url).read)
    hash = file['formats'].find do |format|
      format['formatType'] == "GLTF2"
    end

    @gltf_url = hash["root"]["url"]

    # @user = current_user 
    # @themes = @user.themes
    # @furnitures = @themes.where(preset: true)
  end
end
