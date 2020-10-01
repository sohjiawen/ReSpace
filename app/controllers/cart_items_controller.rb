class CartItemsController < ApplicationController
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to carts_path
  end

  def destroy_all
    @cart_items = current_user.cart.cart_items
    @cart_items.destroy_all
    redirect_to carts_path
  end
end
