class RemoveUserReferenceInCartItems < ActiveRecord::Migration[6.0]
  def change
    remove_reference :cart_items, :user
  end
end
