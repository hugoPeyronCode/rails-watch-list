class BookmarksController < ApplicationController

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @movie = Movie.find(params[:bookmark][:movie_id])
    @bookmark = Bookmark.new(list: @list, movie: @movie, comment: params[:bookmark][:comment])

    if @bookmark.save
      redirect_to list_path(@list)
    else
      render 'new'
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @list = @bookmark.list
    if @bookmark.destroy
      redirect_to list_path(@list), status: :see_other
    end
  end

  private

  def params_bookmark
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
