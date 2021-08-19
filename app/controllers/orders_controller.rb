class OrdersController < ApplicationController
  before_action :security_order, except: [:create]

  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
    
  end

  def create
    @item = Item.find(params[:item_id])
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
    Payjp.api_key = "sk_test_8fe7c0f5cfa2df1b3256d167"  
    Payjp::Charge.create(
      amount: @item.price,  
      card: order_params[:token],    
      currency: 'jpy'                
    )
  end

  def security_order
    @item = Item.find(params[:item_id])
    if @item.order.present?
      redirect_to root_path
    elsif user_signed_in? && current_user.id != @item.user_id
      render :index
    else
      redirect_to root_path
    end
  end
end
