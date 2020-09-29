class AddUserIdToCartItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :cart_items, :user, foreign_key: true
  end
end
