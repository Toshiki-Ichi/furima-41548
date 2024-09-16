FactoryBot.define do
  factory :user do
    nickname                 { Faker::Name.name }
    email                    { Faker::Internet.email }
    password                 { Faker::Internet.password(min_length: 6) }
    password_confirmation    { password }
    kanji_family             { '田中' }
    kanji_name               { '太郎' }
    kata_family              { 'タナカ' }
    kata_name                { 'タロウ' }
    birthday                 { Faker::Date.birthday }
  end
end
