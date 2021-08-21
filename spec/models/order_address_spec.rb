require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_address.building = ''  
        @order_address.valid?
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が空だと登録できない' do
        @order_address.post_number = ''  
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post number can't be blank")
      end
      it '郵便番号が半角のハイフンを含んだ正しい形式でないと登録できない' do
        @order_address.post_number = '1234567'  
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post number is invalid. Include hyphen(-)")
      end
      it '市区町村が空だと登録できない' do
        @order_address.city = ''  
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと登録できない' do
        @order_address.house_number = ''  
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end
      it '配送エリアが「--」だと登録できない' do
        @order_address.delivery_area_id = 1  
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Delivery area can't be blank")
      end
      it '電話番号が空だと登録できない' do
        @order_address.phone_number = ''  
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が9桁以下だと登録できない' do
        @order_address.phone_number = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid.")
      end
      it '電話番号が12桁以上だと登録できない' do
        @order_address.phone_number = '123456789012' 
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid.")
      end
      it '電話番号に半角数字以外が含まれている場合は購入できない' do
        @order_address.phone_number = 'aaaaaaaaaa'  
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid.")
      end
      it 'tokenが空だと登録できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いていないと登録できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと登録できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end