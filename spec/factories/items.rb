FactoryBot.define do
  factory :item do
    name          {"タイトル"}
    explanation   {"説明文"}
    category_id   {2}
    status_id     {2}
    shipping_id   {2}
    prefecture_id {2}
    day_id        {2}
    money         {1000}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end