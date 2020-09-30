class OrdersController < ApplicationController
  def create
    @cart = current_user.cart
    @order = Order.create!(amount: params[:total], state: 'pending', cart: @cart)

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: @cart.id,
        images: @cart.furnitures.map(&:thumbnail_url),
        amount: @order.amount_cents,
        currency: 'sgd',
        quantity: 1
      }],
      success_url: order_url(@order),
      cancel_url: cart_url(@cart)
      # prefix of path
    )

    @order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(@order)
  end

  def show
   @cart_items = current_user.cart_items
   @cart_items.each do |item|
    item.purchased = true
    item.save!
  end
  end
end
