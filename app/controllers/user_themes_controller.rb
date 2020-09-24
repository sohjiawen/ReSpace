class UserThemesController < ApplicationController

  def create
    @user = current_user
    @theme = Theme.find(params[:user_theme][:theme_id])
    @user_theme = UserTheme.new(user: @user, theme: @theme)
    @user_theme.save!
  end

end
