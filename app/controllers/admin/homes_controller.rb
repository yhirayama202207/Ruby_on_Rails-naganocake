class Admin::HomesController < ApplicationController

  def top
    @orders = Order.all
    @order = Order.find(params[:id])
    @customer = @order.customer
    @order_details = Order_details.find(params[:id])
  end

end
