FactoryBot.define do
  factory :user do
    nickname                 {Faker::Name}
    email                    {Faker::Internet.email}
    password                 {Faker::Internet.password(min_length:6)}
    password_confirmation    {password}
    kanji_family             {Faker::Name.last_name}
    kanji_name               {Faker::Name.first_name}
    kata_family              {"タナカ"}
    kata_name                {"タロウ"}
    birthday                 {Faker::Date.birthday}
  end
end
