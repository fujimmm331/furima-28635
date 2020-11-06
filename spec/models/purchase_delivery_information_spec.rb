require 'rails_helper'

RSpec.describe PurchaseDeliveryInformation, type: :model do
  describe '配送情報の保存' do
    before do
      @purchasedeliveryinformation = FactoryBot.build(:purchase_delivery_information)
    end

    it '建物名が入っていなくても保存できる' do
      expect(@purchasedeliveryinformation).to be_valid
    end

    it '全ての値が入っても保存できる' do
      @purchasedeliveryinformation.building = 'アジアビル1F'
      expect(@purchasedeliveryinformation).to be_valid
    end

    it '郵便番号が空では保存できない' do
      @purchasedeliveryinformation.postal_code = ''
      @purchasedeliveryinformation.valid?
      expect(@purchasedeliveryinformation.errors.full_messages).to include("Postal code can't be blank")
    end

    it '郵便番号はハイフンが無いと保存できない' do
      @purchasedeliveryinformation.postal_code = '1234567'
      @purchasedeliveryinformation.valid?
      expect(@purchasedeliveryinformation.errors.full_messages).to include('Postal code must be 7digits and include 「-」')
    end

    it '郵便番号は数字が全角だと保存できない' do
      @purchasedeliveryinformation.postal_code = '１２３-４５６７'
      @purchasedeliveryinformation.valid?
      expect(@purchasedeliveryinformation.errors.full_messages).to include('Postal code must be 7digits and include 「-」')
    end

    it '都道府県のidが1では保存できない' do
      @purchasedeliveryinformation.delivery_source_id = 1
      @purchasedeliveryinformation.valid?
      expect(@purchasedeliveryinformation.errors.full_messages).to include("Delivery source -- is can't choose")
    end

    it '市区町村が空では保存できない' do
      @purchasedeliveryinformation.municipality = ''
      @purchasedeliveryinformation.valid?
      expect(@purchasedeliveryinformation.errors.full_messages).to include("Municipality can't be blank")
    end

    it '番地が空では保存できない' do
      @purchasedeliveryinformation.address = ''
      @purchasedeliveryinformation.valid?
      expect(@purchasedeliveryinformation.errors.full_messages).to include("Address can't be blank")
    end

    it '電話番号が空欄では保存できない' do
      @purchasedeliveryinformation.telephone_number = ''
      @purchasedeliveryinformation.valid?
      expect(@purchasedeliveryinformation.errors.full_messages).to include("Telephone number can't be blank")
    end

    it '電話番号は12桁以上では保存できない' do
      @purchasedeliveryinformation.telephone_number = '090123456789'
      @purchasedeliveryinformation.valid?
      expect(@purchasedeliveryinformation.errors.full_messages).to include('Telephone number within 11 digits')
    end

    it '電話番号は全角数字では保存できない' do
      @purchasedeliveryinformation.telephone_number = '０９０１２３４５６７８'
      @purchasedeliveryinformation.valid?
      expect(@purchasedeliveryinformation.errors.full_messages).to include('Telephone number within 11 digits')
    end

    it 'トークンが空では保存できない' do
      @purchasedeliveryinformation.token = ''
      @purchasedeliveryinformation.valid?
      expect(@purchasedeliveryinformation.errors.full_messages).to include("Token can't be blank")
    end

    it 'ユーザーが空では保存できない' do
      @purchasedeliveryinformation.user = ''
      @purchasedeliveryinformation.valid?
      expect(@purchasedeliveryinformation.errors.full_messages).to include("User can't be blank")
    end

    it '商品が空では保存できない' do
      @purchasedeliveryinformation.product = ''
      @purchasedeliveryinformation.valid?
      expect(@purchasedeliveryinformation.errors.full_messages).to include("Product can't be blank")
    end
  end
end
