FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'test0000'}
    password_confirmation {password}
    family_name_zenkaku   {'苗字'}
    first_name_zenkaku    {'名前'}
    family_name_hurigana  {'ミョウジ'}
    first_name_hurigana   {'ナマエ'}
    birthday              {'20210707'}
  end
end