class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "会員情報の編集が完了しました"
      redirect_to customers_path(@customer.id)
    else
      render :edit
    end
  end

  def confirm
  end

  def unsubscribe
  end

end
