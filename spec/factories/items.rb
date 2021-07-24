FactoryBot.define do

  factory :item do
    association :user
    name                  {"テスト"}
    description           {"説明"}
    detail_category_id    {2}
    detail_status_id      {2}
    delivery_fee_id       {2}
    delivery_area_id      {2}
    delivery_day_id       {2}
    price                 {500}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end