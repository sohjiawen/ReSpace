class Theme < ApplicationRecord
    THEMES = [
      {name: 'Minimalist', image_id: 'minimalist_ilbrjt'},
      {name: 'Beach', image_id: 'beach_amqzbx'},
      {name: 'Eclectic', image_id: 'eclectic_uvcy1y'},
      {name: 'Comfy', image_id: 'comfy_legbql'},
      {name: 'Gamer', image_id: 'gamer_qffg6l'},
      {name: 'Nature', image_id: 'nature_algmhj'}]

    has_many :furnitures
    has_many :users, through: :user_themes
end
