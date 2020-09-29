class CartsController < ApplicationController
  def update
    @cart = current_user.cart
    @furniture = Furniture.find(params[:furniture_id])
    @new_item = CartItem.new(furniture: @furniture, cart: @cart)
    if @new_item.save!
      redirect_to furniture_path(@furniture)
    end
  end

  def index

  end
end
