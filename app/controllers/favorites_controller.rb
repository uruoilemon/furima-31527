class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  def create
    @favorite = Favorite.create(user_id: current_user.id,item_id: @item.id)
    if @favorite.save
      redirect_to item_path(@item)
    end
  end

  def destroy 
    @favorite = Favorite.find_by(user_id: current_user.id,item_id: @item.id)
    @favorite.destroy
    if @favorite.destroy
      redirect_to item_path(@item)
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

end
