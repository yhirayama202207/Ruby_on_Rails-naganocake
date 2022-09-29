class Admin::HomesController < ApplicationController

  before_action :authenticate_admin!

  def top
    @orders = Order.all.page(params[:page])
    #@order = Order.find(params[:id])
    #@customer = @order.customer
    #@order_details = Order_details.find(params[:id])
  end

end
