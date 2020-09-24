class ThemesController < ApplicationController

  def index
    @themes = Theme.all
  end

  def create
    @user = current_user
    @theme = @theme.find(params[:id])
    @user_theme = UserTheme.new(user: @user, theme: @theme)
    @user_theme.save!
  end

end
