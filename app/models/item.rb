class Item < ApplicationRecord
ActiveHash::Associations::ActiveRecordExtensions 
	has_one_attached :image
belongs_to :user
belongs_to :genre


validates :image, presence: true
validates :price, :category_id, :status_id, :responsible_id, region_id, shipping_day_id, presence: true
validates :genre_id, numericality: { other_than: 1 }
end
