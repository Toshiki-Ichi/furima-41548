class Responsible < ActiveHash::Base
  self.data = [
    { id: 1, who: '---' },
    { id: 2, who: '着払い(購入者負担)' },
    { id: 3, who: '送料込み(出品者負担)' }
  ]
  include ActiveHash::Associations
  has_many :items
end
