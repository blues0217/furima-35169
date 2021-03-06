class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]
  before_action :security_tem, except: [:index, :new, :create, :show]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @item = Item.order(created_at: :desc)
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
  end

  def edit
    if @item.order.present? 
      redirect_to root_path
    else
      render :edit
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :detail_category_id, :detail_status_id, :delivery_fee_id, :delivery_area_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def security_tem
    redirect_to root_path unless current_user.id == @item.user_id
  end
end
