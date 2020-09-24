class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def ar
    # @furnitures = current_user.theme.furnitures
  end
end
