class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:create]
  before_action :security_order, except: [:create]
  before_action :set_order

  def index
    @order = Order.new
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:post_number, :delivery_area_id, :city, :house_number, :building, :phone_number).merge(user_id: current_user.id,token: params[:token],item_id: params[:item_id])
  end


  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  
      card: order_params[:token],    
      currency: 'jpy'                
    )
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

  def security_order
    @item = Item.find(params[:item_id])
    if @item.order.present? || current_user.id == @item.user_id
      redirect_to root_path 
    else
      redirect_to items_path 
    end
  end
end
  