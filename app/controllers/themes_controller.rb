class ThemesController < ApplicationController

def index
  @themes = Theme.all
end

  def create
    @user = current_user
    @user.theme = @theme
  end

end
