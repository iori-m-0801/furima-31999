class ShoppingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  def index
    redirect_to root_path if current_user.id == @item.user_id || @item.shopping.present?
    @shopping_form = ShoppingForm.new
  end

  def create
    @shopping_form = ShoppingForm.new(shopping_params)
      if @shopping_form.valid?
        pay_item
        @shopping_form.save
        redirect_to root_path
      else
        render :index
      end
  end

  private

  def shopping_params
    params.require(:shopping_form).permit(:postal_code, :prefecture, :city, :city_number, :building, :tel).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.money,
      card: shopping_params[:token],
      currency: 'jpy'
    )
  end
end