class ShoppingForm
  attr_accessor :token
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture, :city, :city_number, :building, :tel, :shopping_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :city
    validates :city_number
    validates :tel, numericality: {only_integer: true}, length: { minimum: 11 }
    validates :token
  end
  validates :prefecture, numericality: { other_than: 1}

  def save
    shopping = Shopping.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, city_number: city_number, building: building, tel: tel, shopping_id: shopping.id)
  end
end