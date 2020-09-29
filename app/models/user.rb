class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :favourites, dependent: :destroy
  has_many :user_themes
  has_many :themes, through: :user_themes
  has_one :cart, dependent: :destroy
  has_many :cart_items, through: :cart

  after_create :create_cart

  private

  def create_cart
    new_cart = Cart.new(user: self)
    new_cart.save!
  end
end
