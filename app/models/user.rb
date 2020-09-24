class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :favourites, dependent: :destroy
  has_one :cart, dependent: :destroy
  has_one :theme, through: :user_themes
end
