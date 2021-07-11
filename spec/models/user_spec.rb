require 'rails_helper'

RSpec.describe User, type: :model do
  describe '新規登録' do
    it 'nicknameが空では登録できない' do
      user = User.new(nickname: '', email: 'test@example', password: 'test000000', password_confirmation: 'test000000', family_name_zenkaku: '苗字', first_name_zenkaku:'名前', family_name_hurigana:'ミョウジ', first_name_hurigana:'ナマエ', birthday:'20210707')
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      user = User.new(nickname: 'test', email: '', password: 'test000000', password_confirmation: 'test000000', family_name_zenkaku: '苗字', first_name_zenkaku:'名前', family_name_hurigana:'ミョウジ', first_name_hurigana:'ナマエ', birthday:'20210707')
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '', password_confirmation: 'test000000', family_name_zenkaku: '苗字', first_name_zenkaku:'名前', family_name_hurigana:'ミョウジ', first_name_hurigana:'ナマエ', birthday:'20210707')
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it 'family_name_zenkakuが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: 'test000000', password_confirmation: 'test000000', family_name_zenkaku: '', first_name_zenkaku:'名前', family_name_hurigana:'ミョウジ', first_name_hurigana:'ナマエ', birthday:'20210707')
      user.valid?
      expect(user.errors.full_messages).to include("Family name zenkaku can't be blank")
    end
    it 'first_name_zenkakuが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: 'test000000', password_confirmation: 'test000000', family_name_zenkaku: '苗字', first_name_zenkaku:'', family_name_hurigana:'ミョウジ', first_name_hurigana:'ナマエ', birthday:'20210707')
      user.valid?
      expect(user.errors.full_messages).to include("First name zenkaku can't be blank")
    end
    it 'family_name_huriganaが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: 'test000000', password_confirmation: 'test000000', family_name_zenkaku: '苗字', first_name_zenkaku:'名前', family_name_hurigana:'', first_name_hurigana:'ナマエ', birthday:'20210707')
      user.valid?
      expect(user.errors.full_messages).to include("Family name hurigana can't be blank")
    end
    it 'first_name_huriganaが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: 'test000000', password_confirmation: 'test000000', family_name_zenkaku: '苗字', first_name_zenkaku:'名前', family_name_hurigana:'ミョウジ', first_name_hurigana:'', birthday:'20210707')
      user.valid?
      expect(user.errors.full_messages).to include("First name hurigana can't be blank")
    end
    it 'birthdayが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: 'test000000', password_confirmation: 'test000000', family_name_zenkaku: '苗字', first_name_zenkaku:'名前', family_name_hurigana:'ミョウジ', first_name_hurigana:'ナマエ', birthday:'')
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
