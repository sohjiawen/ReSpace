class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :favourites, dependent: :destroy
  has_one :user_theme
  has_one :theme, through: :user_theme
  has_one :cart, dependent: :destroy
  has_many :cart_items, through: :cart
  has_many :marketplace_ar_items, dependent: :destroy
  has_many :furnitures, through: :marketplace_ar_items

  after_create :create_cart

  private

  def create_cart
    new_cart = Cart.new(user: self)
    new_cart.save!
  end
end
