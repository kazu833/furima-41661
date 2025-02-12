class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validate :validate_password
  validate :validate_names
  validate :validate_kana_names

  validates :birthday, presence: true
  validates :nickname, presence: true

  private

  def validate_password
    if password.present? && password_confirmation.present? && (errors[:password].blank? && errors[:password_confirmation].blank?)
      unless password =~ /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
        errors.add(:password, 'には英字と数字の両方を含めて設定してください')
      end
    end
  end

  def validate_names
    if first_name.blank?
      errors.add(:first_name, "can't be blank")
    elsif first_name !~ /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
      errors.add(:first_name, 'は全角文字で入力してください')
    end

    if last_name.blank?
      errors.add(:last_name, "can't be blank")
    elsif last_name !~ /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
      errors.add(:last_name, 'は全角文字で入力してください')
    end
  end

  def validate_kana_names
    if first_name_kana.blank?
      errors.add(:first_name_kana, "can't be blank")
    elsif first_name_kana !~ /\A[ァ-ヶ]+\z/
      errors.add(:first_name_kana, 'は全角(カタカナ)で入力してください')
    end

    if last_name_kana.blank?
      errors.add(:last_name_kana, "can't be blank")
    elsif last_name_kana !~ /\A[ァ-ヶ]+\z/
      errors.add(:last_name_kana, 'は全角(カタカナ)で入力してください')
    end
  end
end