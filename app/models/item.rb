class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many_attached :images
  belongs_to :user
  belongs_to :category
  belongs_to :region
  belongs_to :responsible
  belongs_to :shipping_day
  belongs_to :status
  has_one :customer

  validates :images, :item_name, :note, :price, presence: true
  validates :category_id, :status_id, :responsible_id, :region_id, :shipping_day_id, presence: true,
                                                                                     numericality: { other_than: 1 }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :images, length: { minimum: 1, maximum: 5, message: "は1枚以上5枚以下にしてください" }
end
