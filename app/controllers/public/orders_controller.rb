class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:addresses] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:addresses] == "1"

    elsif params[:order][:addresses] == "2"

    end
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.shipping_cost = 800
    @total += cart_item.subtotal
    @order.total_payment = @total
    if @order.save!
      redirect_to orders_confirm_path
    end
  end

  def index
  end

  def show
  end

#ストロングパラメータ
  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :shipping_cost)
  end

end