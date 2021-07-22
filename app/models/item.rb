class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :description 
    validates :detail_category_id
    validates :detail_status_id
    validates :delivery_fee_id
    validates :delivery_area_id
    validates :delivery_day_id
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  belongs_to :detail_category
  belongs_to :detail_status
  belongs_to :delivery_fee
  belongs_to :delivery_area
  belongs_to :delivery_day
end
