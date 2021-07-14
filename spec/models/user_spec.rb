require 'rails_helper'

RSpec.describe User, type: :model do
  describe '新規登録' do
    it 'nicknameが空では登録できない' do
      user = FactoryBot.build(:user)
      user.nickname = ''  
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      user = FactoryBot.build(:user)
      user.email = ''
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      user = FactoryBot.build(:user)
      user.password = ''
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it 'family_name_zenkakuが空では登録できない' do
      user = FactoryBot.build(:user)
      user.family_name_zenkaku = ''
      user.valid?
      expect(user.errors.full_messages).to include("Family name zenkaku can't be blank")
    end
    it 'first_name_zenkakuが空では登録できない' do
      user = FactoryBot.build(:user)
      user.first_name_zenkaku = ''
      user.valid?
      expect(user.errors.full_messages).to include("First name zenkaku can't be blank")
    end
    it 'family_name_huriganaが空では登録できない' do
      user = FactoryBot.build(:user)
      user.family_name_hurigana = ''
      user.valid?
      expect(user.errors.full_messages).to include("Family name hurigana can't be blank")
    end
    it 'first_name_huriganaが空では登録できない' do
      user = FactoryBot.build(:user)
      user.first_name_hurigana = ''
      user.valid?
      expect(user.errors.full_messages).to include("First name hurigana can't be blank")
    end
    it 'birthdayが空では登録できない' do
      user = FactoryBot.build(:user)
      user.birthday = ''
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
