class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         # カタカナのバリデーション #テスト時通らないなら他のカラムのpresenceも記述する
  validates :kata_family, presence: true, format: { with: /\A[ァ-ヴー]+\z/}
  validates :kata_name, presence: true, format: { with: /\A[ァ-ヴー]+\z/}

   # パスワードのバリデーション
   validate :password_complexity

private
  def password_complexity
    if password.present?
      unless password =~ /(?=.*[a-zA-Z])(?=.*\d)/
        errors.add :password, 'は英字と数字の両方を含む必要があります'
      end
    end
  end
end