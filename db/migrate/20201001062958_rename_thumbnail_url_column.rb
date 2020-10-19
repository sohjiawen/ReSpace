class RenameThumbnailUrlColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :furnitures, :thumbnail_url, :image
  end
end
