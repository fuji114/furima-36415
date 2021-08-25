class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :orders

  with_options presence: true do
    validates :nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birth_date
  end
  validates :password, :password_confirmation, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/ }, allow_blank: true
  validates :family_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }, allow_blank: true
  validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }, allow_blank: true
  validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }, allow_blank: true
  validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }, allow_blank: true
end
