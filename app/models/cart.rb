class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items, dependent: :destroy
  has_many :orders
  has_many :furnitures, through: :cart_items
end
