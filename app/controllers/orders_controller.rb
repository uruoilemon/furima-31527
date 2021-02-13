class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!

  def index
    redirect_to controller: :items, action: :index unless @item.user_id != current_user.id
    @item_order = ItemOrder.new
  end

  def create
    @item_order = ItemOrder.new(order_params)
     if @item_order.valid?
       @item_order.save
       redirect_to controller: :items, action: :index
      else
       render action: :index
      end
  end

  private
 def order_params
  params.require(:item_order).permit(:postal_code, :prefecture, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
 end

 def set_item
  @item = Item.find(params[:item_id])
 end

end
