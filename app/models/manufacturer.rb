class Manufacturer < ApplicationRecord
    has_many :furnitures, dependent: :destroy
end
