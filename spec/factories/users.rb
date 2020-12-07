FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"hoge123"}
    password_confirmation {"hoge123"}
    first_name            {person.first.kanji}
    last_name             {person.last.kanji}
    kana_first            {person.first.katakana}
    kana_last             {person.last.katakana}
    birthday              {"1234-11-11"}
  end
end