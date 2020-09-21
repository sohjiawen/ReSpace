class AddPolyIDtoFurniture < ActiveRecord::Migration[6.0]
  def change
    add_column :furnitures, :poly_id, :string
  end
end
