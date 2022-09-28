class Public::ItemsController < ApplicationController

  def index
    @items = Item.where(is_active: true)
    @genres = Genre.all
  end

  def genre_index
    @genres = Genre.all
    @genre = Genre.find(params[:id])
    @items = @genre.items.where(is_active: true)
    #@items = Item.where(genre_id: params[:id])

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
