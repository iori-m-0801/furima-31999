require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品新規登録' do
    it "商品画像が空だと登録できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Image can't be blank"
    end
    it "商品名が空では登録できない" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include "Name can't be blank"
    end
    it "商品の説明が空では登録できない" do
      @item.explanation = ""
      @item.valid?
      expect(@item.errors.full_messages).to include "Explanation can't be blank"
    end
    it "カテゴリーが--では登録できない" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Category must be other than 1"
    end
    it "商品の状態が--では登録できない" do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Status must be other than 1"
    end
    it "配送料の負担が--では登録できない" do
      @item.shipping_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping must be other than 1"
    end
    it "発送元の地域が--では登録できない" do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Prefecture must be other than 1"
    end
    it "発送までの日数が--では登録できない" do
      @item.day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Day must be other than 1"
    end
    it "価格が空では登録できない" do
      @item.money = ""
      @item.valid?
      expect(@item.errors.full_messages).to include "Money can't be blank"
    end
    it "価格が￥300以上でないと登録できない" do
      @item.money = 299
      @item.valid?
      expect(@item.errors.full_messages).to include "Money is not included in the list"
    end
    it "価格が￥9,999,999以下でないと登録できない" do
      @item.money = 10,000,000
      @item.valid?
      expect(@item.errors.full_messages).to include "Money is not included in the list"
    end
    it "価格が半角数字でないと登録できない" do
      @item.money = "３００"
      @item.valid?
      expect(@item.errors.full_messages).to include "Money is not included in the list"
    end
    it "すべての情報が正しく入力されていれば登録できる" do
      expect(@item).to be_valid
    end
  end
end