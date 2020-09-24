class ThemesController < ApplicationController

  def index
    @themes = Theme.all
    # UserTheme.where(user: current_user).destroy_all
    @user_theme = UserTheme.new
  end
end
