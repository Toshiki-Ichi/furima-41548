require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'nicknameとemail、passwordとpassword_confirmation、kanji_familyとkanji_name,kata_family.kata_name.birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'パスワードは、半角数字のみでは登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角の英字と数字の両方を含む必要があります')
      end
      it 'パスワードは、半角英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角の英字と数字の両方を含む必要があります')
      end
      it 'パスワードは、全角では登録できない' do
        @user.password = 'ああああああ'
        @user.password_confirmation = 'ああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角の英字と数字の両方を含む必要があります')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'お名前(全角)は、名字がないと登録できない。' do
        @user.kanji_family = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanji family can't be blank")
      end
      it 'お名前(全角)は、名前がないと登録できない' do
        @user.kanji_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanji name can't be blank")
      end
      it 'お名前(全角)の名字は、全角（漢字・ひらがな・カタカナ）のいずれかでないと登録できない' do
        @user.kanji_family = 'asdf'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kanji family is invalid')
      end
      it 'お名前(全角)の名前は、全角（漢字・ひらがな・カタカナ）のいずれかでないと登録できない' do
        @user.kanji_name = '1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kanji name is invalid')
      end
      it 'お名前カナ(全角)は、名字がないと登録できない' do
        @user.kata_family = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kata family can't be blank")
      end
      it 'お名前カナ(全角)は、名前がないと登録できない' do
        @user.kata_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kata name can't be blank")
      end
      it 'お名前カナ(全角)の名字は、カタカナでないと登録できない' do
        @user.kata_family = 'たなか'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kata family is invalid')
      end
      it 'お名前カナ(全角)の名前は、カタカナでないと登録できない' do
        @user.kata_name = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kata name is invalid')
      end
      it '誕生日の入力がないと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
