class Public::AddressesController < ApplicationController

  def index
    @address = Address.new
    @addresses = Address.all
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      flash[:notice] = "配送先の登録が完了しました"
      redirect_to addresses_path
    end
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      flash[:notice] = "配送先情報の変更が完了しました"
      redirect_to addresses_path
    else
      render :edit
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end

  #投稿データのストロングパラメータ
  private

  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end

end