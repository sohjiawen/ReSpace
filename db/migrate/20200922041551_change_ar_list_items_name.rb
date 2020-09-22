class ChangeArListItemsName < ActiveRecord::Migration[6.0]
  def change
    rename_table :ar_list_items, :furniture_lists
  end
end
