require 'open-uri'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def ar
    # @user = current_user
    # @themes = @user.themes
    # @furnitures = @themes[0].furnitures.where(preset: true)
    poly_id = params[:poly_id] 
    if poly_id 
      url = "https://poly.googleapis.com/v1/assets/#{poly_id}/?key=#{ENV['POLY_API_KEY']}"
      file = JSON.parse(open(url).read)
      hash = file['formats'].find do |format|
        format['formatType'] == "GLTF2"
      end

      @gltf_url = hash["root"]["url"]
    end

    # need to change !!! later
    # @user = current_user 
    @user = User.find(5)
    @themes = @user.themes
    @furnitures = @themes[0].furnitures.where(preset: true)
  end
end
