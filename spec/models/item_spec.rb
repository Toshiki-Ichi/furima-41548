require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品商品の登録' do
    context '商品を登録できる場合' do
      it 'item_name,note,price,category_id,status_id.region_id,shipping_day_id,image,が正しく存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品を登録できない場合' do
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'noteが空では登録できない' do
        @item.note = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Note can't be blank")
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが299以下では登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceが10,000,000以上では登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it 'priceが半角数値でないと登録できない' do
        @item.price = '３３３３'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'category_idが1(---)では登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'status_idが1(---)では登録できない' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end
      it 'region_idが1(---)では登録できない' do
        @item.region_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Region must be other than 1')
      end
      it 'shipping_day_idが1(---)では登録できない' do
        @item.shipping_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping day must be other than 1')
      end
      it 'responsible_idが1(---)では登録できない' do
        @item.responsible_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Responsible must be other than 1')
      end
      it 'userが紐付いていないと保存できない' do
				@item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
