class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :furniture
end
