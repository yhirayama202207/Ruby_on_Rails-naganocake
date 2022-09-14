class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def confirm
  end

  def complete
  end

  def create
  end

  def index
  end

  def show
  end

#投稿データのストロングパラメータ
  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status )
  end

end