require 'open-uri'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def ar
    @user = current_user
    @furnitures = []
    @theme = @user.theme
    
    if @theme
      @theme.furnitures.where(preset: true).each do |furniture|
        @furnitures << furniture
      end
    end

    if @user.furnitures 
      @user.furnitures.each do |furniture| 
        @furnitures << furniture 
      end
    end

    poly_id = params[:poly_id] 
    if poly_id 
      url = "https://poly.googleapis.com/v1/assets/#{poly_id}/?key=#{ENV['POLY_API_KEY']}"
      file = JSON.parse(open(url).read)
      hash = file['formats'].find do |format|
        format['formatType'] == "GLTF2" || format['formatType'] == "GLTF"
      end
      @gltf_url = hash["root"]["url"]
    end
  end
end
