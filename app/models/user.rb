class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :family_name, :first_name, :kana_family_name,
            :kana_first_name, :birthday, presence: true

  validates_format_of :family_name, :first_name, with: /\A[ぁ-んァ-ン一-龥]+\z/

  validates_format_of :kana_family_name, :kana_first_name, with: /\A[ァ-ヶー－]+\z/

  password_vali = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: password_vali

  has_many :products
  has_many :purchases
end
