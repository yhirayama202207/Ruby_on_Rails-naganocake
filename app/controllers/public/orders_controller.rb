class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
    # if params[:order][:addresses] == "0"
    #   @order.postal_code = current_customer.postal_code
    #   @order.address = current_customer.address
    #   @order.name = current_customer.last_name + current_customer.first_name
    # elsif params[:order][:addresses] == "1"

    # elsif params[:order][:addresses] == "2"

    # end
    @cart_items = current_customer.cart_items
    @order.shipping_cost = 800
    @total = 0
  end

  def complete
  end

  def create
    @cart_items = current_customer.cart_items
    @total = 0
    @cart_items.each do |cart_item|
      @total += cart_item.subtotal
    end
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.shipping_cost = 800
    @order.total_payment = @total + @order.shipping_cost
    @order.save!

		@cart_items.each do |cart_item|
		  @order_detail = OrderDetail.new
			@order_detail.order_id = @order.id
			@order_detail.item_id = cart_item.item_id
			@order_detail.amount = cart_item.amount
			@order_detail.making_status = 0
			@order_detail.price = (cart_item.item.price * 1.1).floor
			@order_detail.save
		end
		  @cart_items.destroy_all

      redirect_to orders_complete_path

  end

  def index
    @orders = current_customer.orders
  end

  def show
    @orders = current_customer.orders
    @order = Order.find(params[:id])
    @total = 0
    @order_details = @order.order_details
    @order_details.each do |order_detail|
      @total += order_detail.price * order_detail.amount
    end

  end

#ストロングパラメータ
  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :total_payment, :shipping_cost)
  end

end