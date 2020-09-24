class Theme < ApplicationRecord
    THEMES = ['Minimalist','Beach', 'Eclectic', 'Comfy', 'Gamer', 'Nature']

    has_many :furnitures
    has_many :users, through: :user_themes
end
