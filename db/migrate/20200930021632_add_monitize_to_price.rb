class AddMonitizeToPrice < ActiveRecord::Migration[6.0]
  def change
     add_monetize :furnitures, :price
  end
end
