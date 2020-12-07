FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {hoge123}
    password_confirmation {hoge123}
    first_name            {Faker::Internet.Japanese::Name.first_name}
    last_name             {Faker::Internet.Japanese::Name.last_name}
    kana_first            {Faker::Internet.Japanese::Name.first_kana_name}
    kana_last             {Faker::Internet.Japanese::Name.last_kana_name}
    birthday              {Faker::Internet.dateTime}
  end
end