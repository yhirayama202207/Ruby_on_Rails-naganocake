class Admin::GenresController < ApplicationController

  def index
    @genre = Genre.new
    @genre.id = Genre.find(params[:id])
    @genres = Genre.all
  end

  def create
  end

  def edit
  end

  def update
  end

end
