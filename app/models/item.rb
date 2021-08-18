class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  with_options presence: true do
    validates :name
    validates :description
    with_options numericality: { other_than: 1 , message: "can't be blank"} do 
      validates :detail_category_id
      validates :detail_status_id
      validates :delivery_fee_id
      validates :delivery_area_id
      validates :delivery_day_id
    end
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :image
  end

  belongs_to :detail_category
  belongs_to :detail_status
  belongs_to :delivery_fee
  belongs_to :delivery_area
  belongs_to :delivery_day
  belongs_to :user
  has_one_attached :image
  has_one :order
end
