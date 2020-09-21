class ArList < ApplicationRecord
  belongs_to :user

  has_many :ar_list_items, dependent: :destroy
end
