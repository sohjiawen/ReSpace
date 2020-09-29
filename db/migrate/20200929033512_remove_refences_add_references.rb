class RemoveRefencesAddReferences < ActiveRecord::Migration[6.0]
  def change
    remove_column :cart_items, :user_id
    add_reference :cart_items, :cart, foreign_key: true
  end
end
