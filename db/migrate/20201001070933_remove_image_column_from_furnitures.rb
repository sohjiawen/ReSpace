class RemoveImageColumnFromFurnitures < ActiveRecord::Migration[6.0]
  def change
    remove_column :furnitures, :image
  end
end
