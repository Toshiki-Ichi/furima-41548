class ShippingDay < ActiveHash::Base
  self.data = [
    { id: 1, when: '---' },
    { id: 2, when: '1~2日で発送' },
    { id: 3, when: '2~3日で発送' },
    { id: 4, when: '4~7日で発送' }
  ]
  include ActiveHash::Associations
  has_many :items
end
