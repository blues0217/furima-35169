class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @items = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :detail_category_id, :detail_status_id, :delivery_fee_id, :delivery_area_id, :delivery_day_id, :price)
  end
end
