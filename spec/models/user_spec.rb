require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '#create' do
    context '新規登録できる時' do
      it '全ての項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'nicknameが登録できる' do
        @user.nickname = 'test'
        expect(@user).to be_valid
      end
      it 'emailが登録できる' do
        @user.email = 'test@example'
        expect(@user).to be_valid
      end
      it 'passwordが登録できる' do
        @user.password = 'test0000'
        expect(@user).to be_valid
      end
      it 'password_confirmationが登録できる' do
        @user.password_confirmation = 'test0000'
        expect(@user).to be_valid
      end
      it 'family_name_zenkakuが登録できる' do
        @user.family_name_zenkaku = '苗字'
        expect(@user).to be_valid
      end
      it 'first_name_zenkakuが登録できる' do
        @user.first_name_zenkaku = '名前'
        expect(@user).to be_valid
      end
      it 'family_name_huriganaが登録できる' do
        @user.family_name_hurigana = 'ミョウジ'
        expect(@user).to be_valid
      end
      it 'first_name_huriganaが登録できる' do
        @user.first_name_hurigana = 'ナマエ'
        expect(@user).to be_valid
      end
      it 'birthdayが登録できる' do
        @user.birthday = '20210707'
        expect(@user).to be_valid
      end
    end

    context '新規登録できない時' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailに@がないと登録できない" do
        @user.email = "testexample"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "重複したemailが存在すれば登録できない" do
        @user.save 
        another_user = FactoryBot.build(:user) 
        another_user.email = @user.email 
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが半角英数字混合でなければ登録できない" do
        @user.password = "testtest"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'password_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation is invalid")
      end
      it "passwordとpassword_confirmationが不一致では登録できない" do
        @user.password = "test0000"
        @user.password_confirmation = "test1111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'family_name_zenkakuが空では登録できない' do
        @user.family_name_zenkaku = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name zenkaku can't be blank")
      end
      it 'first_name_zenkakuが空では登録できない' do
        @user.first_name_zenkaku = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name zenkaku can't be blank")
      end
      it "family_name_zenkakuは全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
        @user.family_name_zenkaku = "kana"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name zenkaku is invalid")
      end
        it "first_name_zenkakuは全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
        @user.first_name_zenkaku = "kana"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name zenkaku is invalid")
      end
      it 'family_name_huriganaが空では登録できない' do
        @user.family_name_hurigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name hurigana can't be blank")
      end
      it 'first_name_huriganaが空では登録できない' do
        @user.first_name_hurigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name hurigana can't be blank")
      end
      it "family_name_huriganaは全角（カタカナ）でなければ登録できない" do
        @user.family_name_hurigana = "かな"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name hurigana is invalid")
        end
        it "first_name_huriganaは全角（カタカナ）でなければ登録できない" do
        @user.first_name_hurigana = "かな"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name hurigana is invalid")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
