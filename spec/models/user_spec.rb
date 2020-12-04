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
    it "passwordが半角英数混合でないと登録できない" do
      @user.password = "aaaaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password Include both letters and numbers"
    end
    it "first_nameが空では登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "First_name can't be blank"
    end
    it "last_nameが空では登録できない" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Last_name can't be blank"
    end
    it "kana_firstが空では登録できない" do
      @user.kana_first = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Kana_first can't be blank"
    end
    it "kana_lastが空では登録できない" do
      @user.kana_last = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Kana_last can't be blank"
    end
    it "birthdayが空では登録できない" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
  end
end
