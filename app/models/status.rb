class Status < ActiveHash::Base
  self.data = [
    { id: 1, level: '---' },
    { id: 2, level: '新品・未使用' },
    { id: 3, level: '未使用に近い' },
    { id: 4, level: '目立った傷や汚れなし' },
    { id: 5, level: 'やや傷や汚れあり' },
    { id: 6, level: '傷や汚れあり' },
    { id: 7, level: '全体的に状態が悪い' }
  ]
  include ActiveHash::Associations
  has_many :items
end
