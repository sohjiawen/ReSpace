class AddUserThemes2 < ActiveRecord::Migration[6.0]
  def change
    create_table :user_themes do |t|
      t.references :theme, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
 
      t.timestamps
    end
  end
end
