class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @customer = @order.customer
    @order_details = Order_detail.find(params[:id])
    @item = @order_details.item
  end

  def update
  end

end
