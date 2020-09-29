class FurnituresController < ApplicationController
  def index
    if params[:theme_name]
      Theme::THEMES.each do |theme|
        @theme = Theme.find_by(name: params[:theme_name])
        @furnitures = Furniture.where(theme_id: @theme.id)
      end
    elsif params[:query].present?
      sql_query = "name ILIKE :query"
      @furnitures = Furniture.where(sql_query, query: "%#{params[:query]}%")
    else
      @furnitures = Furniture.all
    end
  end

  def show
    @furniture = Furniture.find(params[:id])
    @cart = current_user.cart
  end


  private

  def allow_params
    require(:furniture).permit(:name, :manufacturer)
  end
end
