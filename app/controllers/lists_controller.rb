class ListsController < ApplicationController
  #get lists
  def index
    @lists = List.all
  end
  #get lists/:id
  def show
    @list = List.find(params[:id])
    @bookmarks = @list.bookmarks
  end
  #get lists/new
  def new
    @list = List.new
  end
  #post lists
  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list), notice: "list was successfully uploaded"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def list_params
    params.require(:list).permit(:name)
  end
end
