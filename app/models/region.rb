class Region < ActiveHash::Base
	self.data = [
    { id: 1, place: '---' }, 
    { id: 2, place: '北海道' },
    { id: 3, place: '青森県' },
    { id: 4, place: '岩手県' },
    { id: 5, place: '宮城県' },
    { id: 6, place: '秋田県' },
    { id: 7, place: '山形県' },
    { id: 8, place: '福島県' },
    { id: 9, place: '茨城県' },
    { id: 10, place: '栃木県' },
    { id: 11, place: '群馬県' },
    { id: 12, place: '埼玉県' },
    { id: 13, place: '千葉県' },
    { id: 14, place: '東京都' },
    { id: 15, place: '神奈川県' },
    { id: 16, place: '新潟県' },
    { id: 17, place: '富山県' },
    { id: 18, place: '石川県' },
    { id: 19, place: '福井県' },
    { id: 20, place: '山梨県' },
    { id: 21, place: '長野県' },
    { id: 22, place: '岐阜県' },
    { id: 23, place: '静岡県' },
    { id: 24, place: '愛知県' },
    { id: 25, place: '三重県' },
    { id: 26, place: '滋賀県' },
    { id: 27, place: '京都府' },
    { id: 28, place: '大阪府' },
    { id: 29, place: '兵庫県' },
    { id: 30, place: '奈良県' },
    { id: 31, place: '和歌山県' },
    { id: 32, place: '鳥取県' },
    { id: 33, place: '島根県' },
    { id: 34, place: '岡山県' },
    { id: 35, place: '広島県' },
    { id: 36, place: '山口県' },
    { id: 37, place: '徳島県' },
    { id: 38, place: '香川県' },
    { id: 39, place: '愛媛県' },
    { id: 40, place: '高知県' },
    { id: 41, place: '福岡県' },
    { id: 42, place: '佐賀県' },
    { id: 43, place: '長崎県' },
    { id: 44, place: '熊本県' },
    { id: 45, place: '大分県' },
    { id: 46, place: '宮崎県' },
    { id: 47, place: '鹿児島県' },
    { id: 48, place: '沖縄県' }
  ]
	
include ActiveHash::Associations
has_many :items
end