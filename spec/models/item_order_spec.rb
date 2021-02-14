require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  describe '購入情報の保存' do
    before do
      @item_order = FactoryBot.build(:item_order)
    end
    context '購入情報が保存出来るとき' do
      it 'すべての値が正しく入力され、かつtokenがあれば保存できる' do
        expect(@item_order).to be_valid
      end
      it 'buildingは空でも保存できる' do
        @item_order.building = nil
        expect(@item_order).to be_valid
      end
    end

    context '購入情報が保存出来ないとき' do
      it 'postal_codeが空だと保存できない' do
        @item_order.postal_code = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include "Postal code can't be blank"
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できない' do
        @item_order.postal_code = 12_345_678
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include 'Postal code is invalid. Include hyphen(-)'
      end
      it 'prefectureを選択していないと保存できない' do
        @item_order.prefecture = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include 'Prefecture Select'
      end
      it 'cityが空では保存できない' do
        @item_order.city = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include "City can't be blank"
      end
      it 'addressが空では保存できない' do
        @item_order.address = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include "Address can't be blank"
      end
      it 'phone_numberが空では保存できない' do
        @item_order.phone_number = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include "Phone number can't be blank"
      end
      it 'phone_numberが10桁未満では保存できない' do
        @item_order.phone_number = 123_456_789
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include 'Phone number ten or elven digits'
      end
      it 'tokenが空では保存できない' do
        @item_order.token = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include "Token can't be blank"
      end
    end
  end
end
