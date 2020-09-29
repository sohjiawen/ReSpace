class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :favourites, dependent: :destroy
  has_one :cart, dependent: :destroy
  has_many :user_themes
  has_many :themes, through: :user_themes
  has_many :marketplace_ar_items 
  has_many :furnitures, through: :marketplace_ar_items
end
