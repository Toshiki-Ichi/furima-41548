class Item < ApplicationRecord
include ActiveHash::Associations::ActiveRecordExtensions 
	has_one_attached :image
belongs_to :user

validates :image, :item_name, :note, :price, presence: true
  validates :category_id, :status_id, :responsible_id, :region_id, :shipping_day_id, presence: true, numericality: { other_than: 1 }
	validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
end