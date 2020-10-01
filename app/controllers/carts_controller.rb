class CartsController < ApplicationController
  def update
    @cart = current_user.cart
    @furniture = Furniture.find(params[:furniture_id])
    @new_item = CartItem.new(furniture: @furniture, cart: @cart)
  end

  def index
    @cart = current_user.cart
    @cart_items = CartItem.where(cart: @cart, purchased: false)

    @total = 0
    @cart_items.each do |item|
      @total += item.furniture.price
    end
  end
end
