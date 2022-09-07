class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.all.page(params[:page])
  end


  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "顧客情報の更新が完了しました"
      redirect_to admin_customer_path(@customer.id)
    end
  end

  #投稿データのストロングパラメータ
  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number,:email, :is_deleted)
  end

end