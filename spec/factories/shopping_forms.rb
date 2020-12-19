FactoryBot.define do
  factory :shopping_form do
    postal_code   {"123-4567"}
    prefecture    {2}
    city          {"マチ"}
    city_number   {"hoge123"}
    building      {"hoge123"}
    tel           {"11111111111"}
    token         {"tok_abcdefghijk00000000000000000"}
    user_id       {1}
    item_id       {1}
  end
end