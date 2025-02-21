require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user: @user)
  end

  describe '商品出品機能' do
    context '商品出品できる場合' do
      it 'すべての項目が適切に入力されていれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品できない場合' do
      it '商品名が空では出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end

      it '商品名が40字以上では出品できない' do
        @item.item_name = 'a' * 41
        @item.valid?
        expect(@item.errors.full_messages).to include 'Item name is too long (maximum is 40 characters)'
      end

      it '商品説明が空では出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end

      it '商品説明が1000字以上では出品できない' do
        @item.description = 'a' * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include 'Description is too long (maximum is 1000 characters)'
      end

      it 'カテゴリーが未選択では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end

      it '商品の状態が未選択では出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end

      it '配送料の負担が未選択では出品できない' do
        @item.shipping_cost_burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping cost burden can't be blank"
      end

      it '発送元地域が未選択では出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end

      it '発送までの日数が未選択では出品できない' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping day can't be blank"
      end

      it '価格が空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it '価格が300円未満では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be greater than or equal to 300'
      end

      it '価格が9,999,999円以上では出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be less than or equal to 9999999'
      end

      it '価格が半角数字以外では保存されない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'

        @item.price = 'abcde'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end

      it '商品画像がないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end

      it 'ユーザーが存在しないと商品を出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'User must exist'
      end
    end
  end
end
