class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :kanji_family, :kanji_name, :birthday, presence: true
  validates :kata_family, presence: true, format: { with: /\A[ァ-ヴー]+\z/ }
  validates :kata_name, presence: true, format: { with: /\A[ァ-ヴー]+\z/ }
  validates :kanji_family, presence: true, format:  { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :kanji_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }

  validate :password_complexity
  has_many :items
  private

  def password_complexity
    return unless password.present?
    return if password =~ /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i

    errors.add :password, 'は半角の英字と数字の両方を含む必要があります'
  end
end
