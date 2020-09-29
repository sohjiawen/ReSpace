class CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
  end

  def create
    @furniture = Furniture.find(params[:id])
    @cart_item = CartItem.new(user_id: current_user.id, furniture_id: @furniture.id)
    @cart_item.save!

    redirect_to furniture_path(@furniture)
  end

end
