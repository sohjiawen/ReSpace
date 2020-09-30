class PaymentsController < ApplicationController
  def new
    @order = current_user.cart.orders.where(state: 'pending').find(params[:order_id])
    @cart_items = current_user.cart_items.where(purchased: false)

  end
end
