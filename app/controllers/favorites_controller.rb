class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  def create
    @favorite = current_user.favorites.new(item_id: @item.id)
    @favorite.save
    @favorites = Favorite.where(item_id: @item.id)
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id,item_id: @item.id).destroy
    @favorites = Favorite.where(item_id: @item.id)
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

end
