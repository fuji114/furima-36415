class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_set

  def index
    @order_address = OrderAddress.new
    redirect_to root_path if @item.order.present? || current_user.id == @item.user_id
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address)
          .permit(
            :postal_code, :invoice_territory_id, :city, :block, :building, :phone_number
          )
          .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item[:product_price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def item_set
    @item = Item.find(params[:item_id])
  end
end
