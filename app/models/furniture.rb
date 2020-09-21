class Furniture < ApplicationRecord
  belongs_to :manufacturer
  belongs_to :theme

  has_many :ar_list_items
  has_many :favourites, dependent: :destroy
  has_many :cart_items, dependent: :destroy
end
