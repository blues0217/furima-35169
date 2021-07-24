require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
      @item = FactoryBot.build(:item)
  end

  describe '#create' do
    context '出品できる時' do
      it '全ての項目が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '出品できない時' do
      it 'nameが空では登録できない' do
        @item.name = ''  
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '説明が空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "カテゴリーが「--」だと登録できない" do
        @item.detail_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail category can't be blank")
      end
      it "商品の状態が「--」だと登録できない" do
        @item.detail_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail status can't be blank")
      end
      it "送料負担が「--」だと登録できない" do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end
      it "配送エリアが「--」だと登録できない" do
        @item.delivery_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery area can't be blank")
      end
      it "出荷日が「--」だと登録できない" do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank")
      end
      it '販売価格が空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格が全角数字だと出品できない' do
        @item.price = '２０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it '販売価格が300未満だと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '販売価格が10,000,000以上だと出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
