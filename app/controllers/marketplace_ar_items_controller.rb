class MarketplaceArItemsController < ApplicationController
    def create 
      @user = current_user
      @furniture = Furniture.find(params[:furniture_id])
      @marketplace_ar_item = MarketplaceArItem.new(user: @user, furniture: @furniture)
      if MarketplaceArItem.exists?(user: @user, furniture: @furniture)
        flash[:alert] = "You have already added this item!"
      elsif @marketplace_ar_item.save
        flash[:notice] = "You can now view this item in AR mode!"
      else 
        flash[:alert] = "Something went wrong!"
      end

      redirect_to furnitures_path(anchor: "furniture-#{@furniture.id}")
    end
end
