require 'rails_helper'

RSpec.describe CustomerArea, type: :model do

  before do
    @customer_area = FactoryBot.build(:customer_area)
  end
  describe '商品購入機能' do

    context '購入できる場合' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@customer_area).to be_valid
      end
      it 'tel_numは10桁の半角数字でも購入できること' do
        @customer_area.tel_num = '1234567890'
        expect(@customer_area).to be_valid
      end
      it 'buildは空でも購入できること' do
        @customer_area.building = ''
        expect(@customer_area).to be_valid
      end
    end

    context '購入できない場合' do
      it 'postalが空だと購入できないこと' do
        @customer_area.postal = ''
        @customer_area.valid?
        expect(@customer_area.errors.full_messages).to include("Postal can't be blank")
      end
      it 'postalが半角のハイフンを含んだ正しい形式でないと購入できないこと' do
        @customer_area.postal= '1234567'
        @customer_area.valid?
        expect(@customer_area.errors.full_messages).to include("Postal は「XXX-XXXX」の形式で入力してください")
      end
      it 'region_idを選択していないと購入できないこと' do
        @customer_area.region_id = 1
        @customer_area.valid?
        expect(@customer_area.errors.full_messages).to include("Region is invalid")
      end
      it 'cityが空だと購入できないこと' do
        @customer_area.city = ''
        @customer_area.valid?
        expect(@customer_area.errors.full_messages).to include("City can't be blank")
      end
      it 'city_numが空だと購入できないこと' do
        @customer_area.city_num = ''
        @customer_area.valid?
        expect(@customer_area.errors.full_messages).to include("City num can't be blank")
      end
      it 'priceが空だと購入できないこと' do
        @customer_area.price = nil
        @customer_area.valid?
        expect(@customer_area.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが全角数字だと購入できないこと' do
        @customer_area.price = '２０００'
        @customer_area.valid?
        expect(@customer_area.errors.full_messages).to include("Price は半角数字のみで入力してください")
      end
      it 'priceが1円未満では購入できないこと' do
        @customer_area.price = 0
        @customer_area.valid?
        expect(@customer_area.errors.full_messages).to include("Price must be greater than or equal to 1")
      end
      it 'priceが1,000,000以上では購入できないこと' do
        @customer_area.price = 10000000
        @customer_area.valid?
        expect(@customer_area.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it 'tel_numが空だと購入できないこと' do
        @customer_area.tel_num = ''
        @customer_area.valid?
        expect(@customer_area.errors.full_messages).to include("Tel num can't be blank")
      end
      it 'tel_numが(-)がある購入できないこと' do
        @customer_area.tel_num= '180-1234-4567'
        @customer_area.valid?
        expect(@customer_area.errors.full_messages).to include("Tel num は10桁以上11桁以下の半角数字で入力してください")
      end
      it 'tel_numが10桁以上11桁以下の半角数字のみでないと購入できないこと' do
        @customer_area.tel_num= '18012344'
        @customer_area.valid?
        expect(@customer_area.errors.full_messages).to include("Tel num は10桁以上11桁以下の半角数字で入力してください")
      end
      it 'userが紐付いていないと購入できないこと' do
        @customer_area.user_id = nil
        @customer_area.valid?
        expect(@customer_area.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと購入できないこと' do
        @customer_area.item_id = nil
        @customer_area.valid?
        expect(@customer_area.errors.full_messages).to include("Item can't be blank")
      end
      it 'customerが紐付いていないと保存できないこと' do
        @customer_area.customer_id = nil
        @customer_area.valid?
        expect(@customer_area.errors.full_messages).to include("Customer can't be blank")
      end
    end
  end
end

