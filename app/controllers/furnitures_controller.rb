class FurnituresController < ApplicationController
  def index
    @furnitures = Furniture.all
  end

  def show
    # furnitures/4
    @furniture = Furniture.find(params[:id])
  end


  private

  def allow_params
    require(:furniture).permit(:name, :manufacturer)
  end
end
