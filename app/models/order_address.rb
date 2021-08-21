class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_number, :delivery_area_id, :city, :house_number, :building, :phone_number , :user_id, :item_id, :token
  with_options presence: true do
    validates :delivery_area_id
    validates :user_id
    validates :item_id
    validates :phone_number
    validates :post_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :token
  end
  validates :delivery_area_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_number: post_number, delivery_area_id: delivery_area_id, city: city, house_number: house_number, building: building, phone_number: phone_number,order_id: order.id)
  end
end