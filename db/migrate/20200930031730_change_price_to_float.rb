class ChangePriceToFloat < ActiveRecord::Migration[6.0]
  def change
    change_column :furnitures, :price, :float
  end
end
