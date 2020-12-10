class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :shopping
  has_one_attached :image
  belongs_to :category
  belongs_to :status
  belongs_to :shipping
  belongs_to :prefecture
  belongs_to :day

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :category_id, numericality: { other_than: 1 }
    validates :status_id, numericality: { other_than: 1 }
    validates :shipping_id, numericality: { other_than: 1 }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :day_id, numericality: { other_than: 1 }
    validates :money
  end

  validates :money,format: { with: /[0-9]/ }
  validates :money,inclusion: { in: (300..9999999)}

end