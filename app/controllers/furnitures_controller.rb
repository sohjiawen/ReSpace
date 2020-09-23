class FurnituresController < ApplicationController
  def index
    @furnitures = Furniture.all
  end

  def show
    # furnitures/4
    raise
    @furnitures = Furniture.find(params[:id])
  end
end
