class Order < ApplicationRecord
  belongs_to :cart

  monetize :amount_cents
end
