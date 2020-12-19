require 'rails_helper'
RSpec.describe ShoppingForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @shopping = FactoryBot.build(:shopping_form,item_id: item.id,user_id: user.id)
  end
  describe '商品購入機能' do
    it "郵便番号が空だと購入できない" do
      @shopping.postal_code = ""
      @shopping.valid?
      expect(@shopping.errors.full_messages).to include "Postal code can't be blank"
      end
    it "都道府県が--だと購入できない" do
      @shopping.prefecture = 1
      @shopping.valid?
      expect(@shopping.errors.full_messages).to include "Prefecture must be other than 1"
    end
    it "市区町村が空だと購入できない" do
      @shopping.city = ""
      @shopping.valid?
      expect(@shopping.errors.full_messages).to include "City can't be blank"
    end
    it "番地が空だと購入できない" do
      @shopping.city_number = ""
      @shopping.valid?
      expect(@shopping.errors.full_messages).to include "City number can't be blank"
    end
    it "電話番号が空だと購入できない" do
      @shopping.tel = ""
      @shopping.valid?
      expect(@shopping.errors.full_messages).to include "Tel can't be blank"
    end
    it "郵便番号にハイフンがないと購入できない" do
      @shopping.postal_code = "1234567"
      @shopping.valid?
      expect(@shopping.errors.full_messages).to include "Postal code is invalid"
    end
    it "電話番号はハイフンなしでないと購入できない" do
      @shopping.tel = "090-12345678"
      @shopping.valid?
      expect(@shopping.errors.full_messages).to include "Tel is not a number"
    end
    it "電話番号は11桁以内でないと購入できない" do
      @shopping.tel = "090-123456789"
      @shopping.valid?
      expect(@shopping.errors.full_messages).to include "Tel is not a number"
    end
    it "tokenが空では登録できないこと" do
      @shopping.token = ""
      @shopping.valid?
      expect(@shopping.errors.full_messages).to include("Token can't be blank")
    end
    it "user_idが空では購入できないこと" do
      @shopping.user_id = ""
      @shopping.valid?
      expect(@shopping.errors.full_messages).to include("User can't be blank")
    end
    it "item_idが空では購入できないこと" do
      @shopping.item_id = ""
      @shopping.valid?
      expect(@shopping.errors.full_messages).to include("Item can't be blank")
    end
    it "必要な情報が適切に入力されていないと購入できない" do
      expect(@shopping).to be_valid
   end
  end
end