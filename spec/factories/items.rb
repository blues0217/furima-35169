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
  end
end