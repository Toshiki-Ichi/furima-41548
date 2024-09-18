FactoryBot.define do
  factory :item do
    item_name                    { Faker::Name.name }
    note                         { Faker::Lorem.sentence }
    price                        { rand(300..9999999) }
    category_id                  { rand(2..11) }
    status_id                    { rand(2..7) }
    region_id                    { rand(2..48) }
    responsible_id               { rand(2..3) }
    shipping_day_id              { rand(2..4) }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
