require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '商品出品' do
    before do
      @product = FactoryBot.build(:product)
    end

    context '商品出品がうまくいく時' do
      it '全てのカラムが入力されていれば、出品することができる' do
        expect(@product).to be_valid
      end
    end

    context '商品出品がうまくいかない時' do
      it '画像がない状態では、出品することができない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空だと、出品することができない' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end

      it '商品説明が空だと、出品することができない' do
        @product.explanation = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Explanation can't be blank")
      end

      it 'カテゴリーが---だと、出品することができない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Category -- is can't choose")
      end

      it '商品状態が---だと、出品することができない' do
        @product.condition_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Condition -- is can't choose")
      end

      it '配送料負担が---だと、出品することができない' do
        @product.delivery_charge_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery charge -- is can't choose")
      end

      it '発送元の地域が---だと、出品することができない' do
        @product.delivery_source_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery source -- is can't choose")
      end

      it '発送までの日数が---だと、出品することができない' do
        @product.days_to_ship_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Days to ship -- is can't choose")
      end

      it '価格が空だと、出品することができない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end

      it '価格が全角で入力されると、出品することができない' do
        @product.price = '３００'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is from 300 yen to 9999999 yen, half-width only')
      end

      it '価格が300より下だと、出品することができない' do
        @product.price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is from 300 yen to 9999999 yen, half-width only')
      end

      it '価格が9,999,999より上だと、出品することができない' do
        @product.price = 10_000_000
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is from 300 yen to 9999999 yen, half-width only')
      end

      it 'ユーザーが紐づいていないと、出品することができない' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('User must exist')
      end
    end
  end
end
