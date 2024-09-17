class Item < ApplicationRecord
 has_one_attached :image
belongs_to :user

validates :image, :price, :category_id, :status_id, :responsible_id, region_id, shipping_day_id: true
end
