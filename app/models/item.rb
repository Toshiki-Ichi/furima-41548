class Item < ApplicationRecord
include ActiveHash::Associations::ActiveRecordExtensions 
	has_one_attached :image
belongs_to :user


validates :image, presence: true
validates :price, :category_id, :status_id, :responsible_id, :region_id, :shipping_day_id, presence: true
validates :category_id, numericality: { other_than: 1 }
validates :region_id, numericality: { other_than: 1 }
validates :responsible_id, numericality: { other_than: 1 }
validates :shipping_day_id, numericality: { other_than: 1 }
validates :status_id, numericality: { other_than: 1 }
end
