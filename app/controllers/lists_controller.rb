class ListsController < ApplicationController
  def index
    @lists = List.where(user_id: current_user.id)
    @list = List.new
  end

  def new
    @list = List.new
  end

  def create
    @user = current_user
    @list = List.new(list_params)
    @list.user = @user
    if @list.save
      flash[:notice] = "Saved!"
      redirect_to lists_path
    else
      flash[:alert] = "[Error] Did not save."
    end
  end

  def show
    @list = List.find(params[:id])
    @favorites = @list.favorites
    @favorite = Favorite.new
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
  end

  def destroy
      @list = List.find(params[:id])
      @list.destroy
      # No need for app/views/restaurants/destroy.html.erb
      redirect_to lists_path, status: :see_other
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
