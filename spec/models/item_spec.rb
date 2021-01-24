require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.create(:item)
  end
  describe '新規出品データの登録' do
    context '新規出品登録が出来るとき' do
      it 'image,name,text,category_id,status_id,payment_id,prefecture_id,delivary_day_id,priceが存在し、かつ価格の範囲が¥300~¥9,999,999の間である時登録できる' do
        expect(@item).to be_valid
      end
    end

    context '新規出品登録が出来ないとき' do
      it '画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'nameが空では登録できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it 'textが空では登録できない' do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Text can't be blank"
      end
      it 'category_idが空では登録できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'Category Select'
      end
      it 'status_idが空では登録できない' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'Status Select'
      end
      it 'payment_idが空では登録できない' do
        @item.payment_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'Payment Select'
      end
      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'Prefecture Select'
      end
      it 'delivery_day_idが空では登録できない' do
        @item.delivery_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'Delivery day Select'
      end
      it 'category_idが「---」では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Category Select'
      end
      it 'status_idが「---」では登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Status Select'
      end
      it 'payment_idが「---」では登録できない' do
        @item.payment_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Payment Select'
      end
      it 'prefecture_idが「---」では登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Prefecture Select'
      end
      it 'delivery_day_idが「---」では登録できない' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Delivery day Select'
      end
      it '価格が¥299以下では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price Out of setting range'
      end
      it '価格が¥10,000,000以上では登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price Out of setting range'
      end
      it '価格が全角入力では登録できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price Half-width number'
      end
    end
  end
end
