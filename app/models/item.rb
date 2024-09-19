class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :user  
  belongs_to :category
  belongs_to :region
  belongs_to :responsible
  belongs_to :shipping_day
  belongs_to :status

  validates :image, :item_name, :note, :price, presence: true
  validates :category_id, :status_id, :responsible_id, :region_id, :shipping_day_id, presence: true,
                                                                                     numericality: { other_than: 1 }
  validates :price, numericality: { only_integer: true,greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
