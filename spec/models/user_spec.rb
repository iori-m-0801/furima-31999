require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it "emailに@が含まれていない場合登録できない" do
      @user.email = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end
    it '重複したemailが存在する場合は登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include "Email has already been taken"
    end
    it "passwordが半角英数混合でないと登録できない" do
      @user.password = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password Include both letters and numbers"
    end
    it "passwordが半角英数混合でないと登録できない" do
      @user.password = "111111"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password Include both letters and numbers"
    end
    it "passwordが半角英数混合でないと登録できない" do
      @user.password = "Ａ１Ａ１Ａ１"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password Include both letters and numbers"
    end
    it "passwordが空の場合登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it "passwordが6文字以上でないと登録できない" do
      @user.password = "11111"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password min 6 characters"
    end
    it "passwordとpassword_confirmationが一致しない場合登録できない" do
      @user.password = "1a1a1a"
      @user.password_confirmation = "2b2b2b"
      @user.valid?
      binding.pry
      expect(@user.errors.full_messages).to include "Password_confirmation don't match"
    end
    it "first_nameが全角（漢字・ひらがな・カタカナ）での入力でないと登録できない" do
      @user.first_name = "hoge"
      @user.valid?
      expect(@user.errors.full_messages).to include "First_name can't be blank"
    end
    it "first_nameが空の場合登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "first_name can't be blank"
    end
    it "last_nameが全角（漢字・ひらがな・カタカナ）での入力でないと登録できない" do
      @user.last_name = "hoge"
      @user.valid?
      expect(@user.errors.full_messages).to include "Last_name can't be blank"
    end
    it "last_nameが空の場合登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "last_name can't be blank"
    end
    it "kana_firstが全角（カタカナ）での入力登録できない" do
      @user.kana_first = "hoge"
      @user.valid?
      expect(@user.errors.full_messages).to include "Kana_first can't be blank"
    end
    it "kana_firstが空の場合登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "kana_first can't be blank"
    end
    it "kana_lastが全角（カタカナ）での入力登録できない" do
      @user.kana_last = "hoge"
      @user.valid?
      expect(@user.errors.full_messages).to include "Kana_last can't be blank"
    end
    it "kana_lastが空の場合登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "kana_last can't be blank"
    end
    it "birthdayが空では登録できない" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
    it "すべての情報が正しいフォーマットで入力されていれば登録できる" do
      expect(@user).to be_valid
    end
  end
end
