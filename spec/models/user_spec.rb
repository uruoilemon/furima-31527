require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録が出来るとき' do
      it 'nickname,email,password,password_confirmation,last_name,first_name,last_name_kana,first_name_kana,birthday,が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが英数両方含めた6文字以上であれば登録できる' do
        @user.password = '12345a'
        @user.password_confirmation = '12345a'
        expect(@user).to be_valid
      end
    end

    context '新規登録が出来ないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordとpassword_confirmationが5文字以下では登録できない' do
        @user.password = '1234a'
        @user.password_confirmation = '1234a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角数字のみの場合は登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'passwordが半角英字のみの場合は登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'passwordが全角の場合は登録できない' do
        @user.password = 'あいうえおあ'
        @user.password_confirmation = 'あいうえおあ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'passwordとpassword_confirmationが一致していないと登録できない' do
        @user.password = '12345a'
        @user.password_confirmation = '12345b'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに＠が含まれていないと登録できない' do
        @user.email = 'abc.com'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end
      it '苗字は全角（漢字・ひらがな・カタカナ）での入力でなければ登録できない' do
        @user.last_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name is invalid. Input full-width characters.'
      end
      it '名前は全角（漢字・ひらがな・カタカナ）での入力でなければ登録できない' do
        @user.first_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name is invalid. Input full-width characters.'
      end
      it '苗字のフリガナは、全角（カタカナ）での入力での入力でなければ登録できない' do
        @user.last_name_kana = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kana is invalid. Input full-width katakana characters.'
      end
      it '名前のフリガナは、全角（カタカナ）での入力での入力でなければ登録できない' do
        @user.first_name_kana = '456'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana is invalid. Input full-width katakana characters.'
      end
    end
  end
end
