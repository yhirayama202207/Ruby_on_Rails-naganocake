class Public::CustomersController < ApplicationController

  before_action :authenticate_customer!

  def show
    @customer = current_customer
    @customers = Customer.all
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:notice] = "会員情報の編集が完了しました"
      redirect_to customer_show_path(current_customer)
    else
      render :edit
    end
  end

  def confirm
    @customer = current_customer
  end

  def unsubscribe
    @customer = current_customer
    if @customer.update(is_deleted: true)
      reset_session
      #flash[:notice] = "退会が完了しました"
      redirect_to homes_top_path
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
