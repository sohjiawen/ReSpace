class Theme < ApplicationRecord
    THEMES = ['Minimalist','Beach', 'Eclectic', 'Comfy', 'Gamer', 'Nature']

    has_many :furnitures
end
