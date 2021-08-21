FactoryBot.define do
  factory :order_address do
    post_number {'123-4567'}
    delivery_area_id {2} 
    city {'札幌市'} 
    house_number {'1-1'} 
    building {'建物'} 
    phone_number {'0123456789'}
    token {'0123456789'}
  end
end
