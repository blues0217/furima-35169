class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname
    validates :family_name_zenkaku, format: { with: /\A([ぁ-んァ-ン一-龥]|ー)+\z/}
    validates :first_name_zenkaku, format: { with: /\A([ぁ-んァ-ン一-龥]|ー)+\z/}
    validates :family_name_hurigana, format: { with: /\A([ァ-ン]|ー)+\z/}
    validates :first_name_hurigana, format: { with: /\A([ァ-ン]|ー)+\z/}
    validates :birthday
  end

  validates :password,:password_confirmation,format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/}

  has_many :items
  has_many :orders
end
