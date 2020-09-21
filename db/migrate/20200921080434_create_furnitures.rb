class CreateFurnitures < ActiveRecord::Migration[6.0]
  def change
    create_table :furnitures do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.references :manufacturer, null: false, foreign_key: true
      t.integer :rating
      t.integer :dimension_height
      t.integer :dimension_width
      t.references :theme, null: false, foreign_key: true
      t.boolean :preset
      t.string :thumbnail_url

      t.timestamps
    end
  end
end
