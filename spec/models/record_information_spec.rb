require 'rails_helper'

RSpec.describe RecordInformation, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user: @user)
    @record_information = FactoryBot.build(:record_information,user_id: @user.id, item_id: @item.id)
  end


describe '購入情報の保存' do

  context '内容に問題ない場合' do
    it 'すべての値が正しく入力されていれば保存できる' do
      expect(@record_information).to be_valid
    end

    it 'buildingは空でも保存できる' do
      @record_information.building = ''
      expect(@record_information).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'postal_codeがないと保存できない' do
      @record_information.postal_code = nil
      @record_information.valid?
      expect(@record_information.errors.full_messages).to include "Postal code can't be blank"
    end

    it 'postal_codeは、「3桁ハイフン4桁」の半角文字列のみでないと保存できない' do
      @record_information.postal_code = '1234567'
      @record_information.valid?
      expect(@record_information.errors.full_messages).to include "Postal code is invalid. Include hyphen(-)"
    end

    it 'prefecture_idが空では保存できない' do
      @record_information.prefecture_id = 1
      @record_information.valid?
      expect(@record_information.errors.full_messages).to include "Prefecture can't be blank"
    end

    it 'cityが空では保存できない保存できない' do
      @record_information.city = ''
      @record_information.valid?
      expect(@record_information.errors.full_messages).to include "City can't be blank"
    end

    it 'streetが空では保存できない' do
      @record_information.street = ''
      @record_information.valid?
      expect(@record_information.errors.full_messages).to include "Street can't be blank"
    end

    it 'phone_numberが空では保存できない' do
      @record_information.phone_number = ''
      @record_information.valid?
      expect(@record_information.errors.full_messages).to include "Phone number can't be blank"
    end

    it 'phone_numberは、10桁以上11桁以内の半角数値のみでないと保存できない' do
      @record_information.phone_number = '1234567891000'
      @record_information.valid?
      expect(@record_information.errors.full_messages).to include "Phone number must be 10 or 11 digits long without any special characters"
    end

    it 'userが紐付いていないと保存できない' do
      @record_information.user_id = nil
      @record_information.valid?
      expect(@record_information.errors.full_messages).to include "User can't be blank"
    end

    it 'itemが紐付いていないと保存できない' do
      @record_information.item_id = nil
      @record_information.valid?
      expect(@record_information.errors.full_messages).to include "Item can't be blank"
    end

  end
 end
end