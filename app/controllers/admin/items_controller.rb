class Admin::ItemsController < ApplicationController

  def index
    @items = Item.all.page(params[:page])
  end

  def new
    @item = Item.new
  end

  def create
  end

  def show
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "アイテム編集が完了しました"
      redirect_to admin_genres_path
    else
      render :edit
    end
  end

  #投稿データのストロングパラメータ
  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_active)
  end

end
