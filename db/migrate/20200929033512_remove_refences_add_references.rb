class RemoveRefencesAddReferences < ActiveRecord::Migration[6.0]
  def change
    remove_column :cart_items, :user_id
  end
end
