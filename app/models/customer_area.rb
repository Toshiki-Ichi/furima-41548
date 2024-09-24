class CustomerArea
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal, :region_id, :city, :city_num, :building, :tel_num, :customer_id
  attr_accessor :token, :price

  validates :user_id, :item_id, :customer_id, :city_num, :price, presence: true
  validate :postal_validation
  validates :region_id, numericality: { other_than: 1, message: 'is invalid' }
  validate :city_validation
  validate :tel_num_validation

  validates :price, format: { with: /\A\d+\z/, message: 'は半角数字のみで入力してください' }
  validates :price, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 9_999_999 }

  def save
    customer = Customer.create(user_id:, item_id:)

    Area.create(postal:, region_id:, city:, city_num:, building:, tel_num:,
                customer_id: customer.id)
  end
end

private

def postal_validation
  if postal.blank?
    errors.add(:postal, "can't be blank")
  elsif !postal.match?(/\A\d{3}-\d{4}\z/)
    errors.add(:postal, 'は「XXX-XXXX」の形式で入力してください')
  end
end

def city_validation
  if city.blank?
    errors.add(:city, "can't be blank")
  elsif !city.match?(/\A[^\x01-\x7E]+\z/)
    errors.add(:city, 'は全角文字のみで入力してください')
  end
end

def tel_num_validation
  if tel_num.blank?
    errors.add(:tel_num, "can't be blank")
  elsif !tel_num.match?(/\A\d{10,11}\z/)
    errors.add(:tel_num, 'は10桁以上11桁以下の半角数字で入力してください')
  end
end
