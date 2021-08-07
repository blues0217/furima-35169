class Order < ApplicationRecord
  validates :price, presence: true
  belongs_to :item
  belongs_to :user
end
