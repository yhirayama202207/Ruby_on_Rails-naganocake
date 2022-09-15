class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end

  def search
    #Viewのformで取得したパラメータをモデルに渡す
    @items = Item.search(params[:search])
  end

end
