class CreateArListItems < ActiveRecord::Migration[6.0]
  def change
    create_table :ar_list_items do |t|
      t.references :furniture, null: false, foreign_key: true
      t.references :ar_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
