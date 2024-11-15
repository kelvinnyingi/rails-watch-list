class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list), notice: "bookmark was successfully uploaded"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to_list_path (@bookmark.list), notice: "bookmark succesfully"
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
