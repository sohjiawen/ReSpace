class Theme < ApplicationRecord
    THEMES = ['Minimalist','Beach', 'Eclectic', 'theme3', 'theme4', 'theme5', 'theme6']

    has_many :furnitures
end
