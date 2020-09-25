class AddImageIdToTheme < ActiveRecord::Migration[6.0]
  def change
    add_column :themes, :image_id, :string
  end
end
