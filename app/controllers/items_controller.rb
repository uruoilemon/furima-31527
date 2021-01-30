class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    redirect_to action: :index unless @item.user_id == current_user.id
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  # def destroy
  # end

  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :delivery_day_id, :payment_id, :prefecture_id, :status_id,
                                 :price).merge(user_id: current_user.id)
  end
end
