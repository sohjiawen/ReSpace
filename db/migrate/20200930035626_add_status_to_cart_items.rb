class AddStatusToCartItems < ActiveRecord::Migration[6.0]
  def change
    add_column :cart_items, :purchased, :boolean, default: false
  end
end
