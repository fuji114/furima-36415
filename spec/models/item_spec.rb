require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品の保存' do
    context '商品出品ができる時' do
      it '商品出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品ができない時' do
      it '商品画像が必須' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が必須' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it '商品の説明が必須' do
        @item.product_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product description can't be blank")
      end

      it '商品の詳細のカテゴリーが空欄' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の詳細のカテゴリーが"--"を選択した場合登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の詳細の商品の状態が空欄' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it '商品の詳細の商品の状態が"--"を選択した場合登録できない' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it '配送についての配送料の負担が空欄' do
        @item.invoice_price_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Invoice price can't be blank")
      end
      it '配送についての配送料の負担が"--"を選択した場合登録できない' do
        @item.invoice_price_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Invoice price can't be blank")
      end
      it '配送についての発送元の地域が空欄' do
        @item.invoice_territory_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Invoice territory can't be blank")
      end
      it '配送についての発送元の地域が"--"を選択した場合登録できない' do
        @item.invoice_territory_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Invoice territory can't be blank")
      end
      it '配送についての発送までの日数が空欄' do
        @item.days_to_delivery_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to delivery can't be blank")
      end
      it '配送についての発送までの日数が"--"を選択した場合登録できない' do
        @item.days_to_delivery_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to delivery can't be blank")
      end

      it '販売価格が必須' do
        @item.product_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product price can't be blank")
      end
      it '販売価格が300円以下' do
        @item.product_price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Product price is not included in the list')
      end
      it '販売価格が9999999円以上' do
        @item.product_price = '1000000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Product price is not included in the list')
      end

      it 'ユーザー情報がない場合登録できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it '商品の販売価格が全角文字では登録できないこと' do
        @item.product_price = '１００００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Product price is not included in the list')
      end
      it '商品の販売価格が半角英数混合では登録できないこと' do
        @item.product_price = '10000O'
        @item.valid?
        expect(@item.errors.full_messages).to include('Product price is not a number')
      end
      it '商品の販売価格が半角英語のみでは登録できないこと' do
        @item.product_price = 'IOOOO'
        @item.valid?
        expect(@item.errors.full_messages).to include('Product price is not a number')
      end
    end
  end
end
