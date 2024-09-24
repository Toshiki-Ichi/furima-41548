FactoryBot.define do
  factory :customer_area do
    postal { '123-4567' }
    region_id { rand(2..48) }
    city { '東京都' }
    city_num { '1-1' }
    building { '東京ハイツ' }
		tel_num{'08012345678'}
    price { 2000 }
		token {Faker::Alphanumeric.alphanumeric(number: 20)}
		user_id{1}
		item_id{1}
		customer_id{1}
  end
end