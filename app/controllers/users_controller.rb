class UsersController < ApplicationController
  def myprofile
    @cart_items_purchased = current_user.cart_items.where(purchased: true)
  end
end
