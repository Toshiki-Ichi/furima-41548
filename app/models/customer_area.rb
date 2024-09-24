class CustomerArea
  include ActiveModel::Model
	attr_accessor :user_id, :item_id,:postal, :region_id, :city, :city_num, :building, :tel_num, :customer_id
	attr_accessor :token,:price

  # ここにバリデーションの処理を書く
	with_options presence: true do
		validates :price
    validates :user_id, :item_id, :customer_id
		validates :postal,format: { with: /\A\d{3}-\d{4}\z/, message: 'は「XXX-XXXX」の形式で入力してください' }

		validates :city,format: { with: /\A[^\x01-\x7E]+\z/, message: 'は全角文字のみで入力してください' }
		validates :tel_num, format: { with: /\A\d+\z/, message: 'は半角数字のみで入力してください' }
  end
  validates :region_id, numericality: {other_than: 0, message: "can't be blank"}
	


  def save
	  customer = Customer.create(user_id: user_id, item_id: item_id)

		Area.create(postal: postal, region_id: region_id, city: city, city_num: city_num, building: building, tel_num: tel_num, customer_id: customer.id)
  end
end
