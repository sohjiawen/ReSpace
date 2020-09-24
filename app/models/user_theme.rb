class UserTheme < ApplicationRecord
  has_one :user
  has_one :theme
end
