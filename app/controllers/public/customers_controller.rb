class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
    @customers = Customer.all
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
    @customer = Customer.find(params[:id])
  end

  def unsubscribe
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "退会が完了しました"
    else
      render :confirm
    end
  end

  #投稿データのストロングパラメータ
  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number,:email, :is_deleted)
  end

end
