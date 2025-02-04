class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  validates_format_of :encrypted_password, with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message:'には英字と数字の両方を含めて設定してください'

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角文字で入力してください' } do
    validates :first_name
    validates :last_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: 'は全角(カタカナ)で入力してください' } do
    validates :first_name_kana
    validates :last_name_kana
  end

  validates :birthday, presence: true
end
