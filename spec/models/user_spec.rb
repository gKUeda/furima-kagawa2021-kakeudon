require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '会員情報入力' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、名字と名前、名字（カナ）と名前（カナ）、誕生日が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = 'test123'
        @user.password_confirmation = 'test123'
        expect(@user).to be_valid
      end
    end  

    context '新規登録できないとき' do 
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
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
      #test
      it "passwordが半角英数字混合でなければ登録できない" do
        @user.password = "1111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it 'パスワードが英語のみでは登録できない' do
        @user.password = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include('は半角英数を両方含む必要があります')
      end
      it 'パスワードが数字のみでは登録できない' do
        @user.password = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include('は半角英数を両方含む必要があります')
      end
      #test

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードが違います")
      end
      it "名字が空だと登録できない" do
        @user.lastname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("名字を入力して下さい")
      end
      it "名前が空と登録できない" do
        @user.firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力して下さい")     
      end
      it '名字は全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.lastname = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("名字は、漢字、全角ひらがな、全角カタカナで入力して下さい")
      end
      it '名前は全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
         @user.firstname = 'aaaa'
         @user.valid?
         expect(@user.errors.full_messages).to include("名前は、漢字、全角ひらがな、全角カタカナで入力して下さい")
      end
       it 'フリガナ（名字）が空だと登録できない' do
         @user.lastname_kana = ''
         @user.valid?
         expect(@user.errors.full_messages).to include("フリガナを全角カタカナで入力して下さい")
      end
        it 'フリガナ（名前）が空だと登録できない' do
         @user.firstname = ''
         @user.valid?
         expect(@user.errors.full_messages).to include("フリガナを全角カタカナで入力して下さい")
      end
        it '名字のフリガナは全角（カタカナ）でなければ登録できない' do
        @user.lastname_kana = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("フリガナは全角カタカナで入力して下さい")
      end
        it '名前のフリガナは全角（カタカナ）でなければ登録できない' do
        @user.firstname_kana = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("フリガナは全角カタカナで入力して下さい")
      end
        it '生年月日が空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
    



     