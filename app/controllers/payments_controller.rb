class PaymentsController < ApplicationController
  def new
    @order = current_user.cart.orders.where(state: 'pending').find(params[:order_id])

  end
end
