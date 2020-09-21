class Theme < ApplicationRecord
    THEMES = ['theme1', 'theme2', 'theme3', 'theme3', 'theme4', 'theme5', 'theme6']
    
    has_many :furnitures
end
