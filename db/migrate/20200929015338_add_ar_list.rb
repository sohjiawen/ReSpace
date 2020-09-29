class AddArList < ActiveRecord::Migration[6.0]
  def change
    create_table :marketplace_ar_items do |t|
      t.references :furniture, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
 
      t.timestamps
    end
  end
end
