FactoryBot.define do
  factory :item do
    image         {Faker::Lorem.sentence}
    item_name     {Faker::Lorem.sentence}
    info          {Faker::Lorem.sentence}
    category_id        {2}
    salesstatus_id     {2}
    shippingfees_id    {2}
    prefecture_id      {1}
    delivery_id        {2}
    price            {2000}
    association :user
  end
end
