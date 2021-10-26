FactoryBot.define do
  factory :item do
    item_name     { Faker::Lorem.sentence }
    info          { Faker::Lorem.sentence }
    category_id        { 2 }
    salesstatus_id     { 2 }
    shippingfees_id    { 2 }
    prefecture_id      { 1 }
    delivery_id        { 2 }
    price { 2000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/star.png'), filename: 'star.png')
    end

  end
end
