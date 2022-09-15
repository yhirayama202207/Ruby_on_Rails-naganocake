class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
    @genres = Genre.all
  end

  def genre_index
    @genres = Genre.all
    @genre = Genre.find(params[:id])
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end

  #def search
    #Viewのformで取得したパラメータをモデルに渡す
    #@items = Item.search(params[:search])
  #end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_active, :image, :genre_id)
  end

end
