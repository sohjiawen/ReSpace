class FurnituresController < ApplicationController
  def index
    @furnitures = Furniture.all
  end

  def show
    @furniture = Furniture.find(params[:id])
    # @cart_item = CartItem.new
  end


  private

  def allow_params
    require(:furniture).permit(:name, :manufacturer)
  end
end
