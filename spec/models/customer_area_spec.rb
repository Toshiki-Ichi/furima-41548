require 'rails_helper'

RSpec.describe CustomerArea, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @customer_area = FactoryBot.build(:customer_area,user_id: @user.id, item_id: @item.id)
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

      it 'buildingは空でも購入できること' do
        @customer_area.building = ''
        expect(@customer_area).to be_valid
      end
    end

    context '購入できない場合' do
      it 'tokenが空だと購入できないこと' do
        @customer_area.token = ''
        @customer_area.valid?
        expect(@customer_area.errors.full_messages).to include("Token can't be blank")
      end
      it 'postalが空だと購入できないこと' do
        @customer_area.postal = ''
        @customer_area.valid?
        expect(@customer_area.errors.full_messages).to include("Postal は空白では登録できません")
      end
      it 'postalが半角のハイフンを含んだ正しい形式でないと購入できないこと' do
        @customer_area.postal = '1234567'
        @customer_area.valid?
        expect(@customer_area.errors.full_messages).to include('Postal は「XXX-XXXX」の形式で入力してください')
      end
      it 'region_idを選択していないと購入できないこと' do
        @customer_area.region_id = 1
        @customer_area.valid?
        expect(@customer_area.errors.full_messages).to include('Region は---以外を選択してください')
      end
      it 'cityが空だと購入できないこと' do
        @customer_area.city = ''
        @customer_area.valid?
        expect(@customer_area.errors.full_messages).to include("City は空白では登録できません")
      end
      it 'city_numが空だと購入できないこと' do
        @customer_area.city_num = ''
        @customer_area.valid?
        expect(@customer_area.errors.full_messages).to include("City num can't be blank")
      end
      it 'tel_numが空だと購入できないこと' do
        @customer_area.tel_num = ''
        @customer_area.valid?
        expect(@customer_area.errors.full_messages).to include("Tel num は空白では登録できません")
      end
      it 'tel_numに数値以外 例:(-) がある場合購入できないこと' do
        @customer_area.tel_num = '180-1234-4567'
        @customer_area.valid?
        expect(@customer_area.errors.full_messages).to include('Tel num は10桁以上11桁以下の半角数字で入力してください')
      end
      it 'tel_numが9桁以下では購入できないこと' do
        @customer_area.tel_num = '180123456'
        @customer_area.valid?
        expect(@customer_area.errors.full_messages).to include('Tel num は10桁以上11桁以下の半角数字で入力してください')
      end
      it 'tel_numが12桁以上では購入できないこと' do
        @customer_area.tel_num = '1801234561234'
        @customer_area.valid?
        expect(@customer_area.errors.full_messages).to include('Tel num は10桁以上11桁以下の半角数字で入力してください')
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
    end
  end
end
