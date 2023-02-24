class Admin::MenusController < ApplicationController

  def index
    @menus = Menu.all
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)
    @menu.save
    redirect_to admin_menus_path
  end

  def show
    @menus = Menu.all
    @menu = Menu.find(params[:id])
    @comment = Comment.new
    @comments = @menu.comments
  end

  def edit
    @menu = Menu.find(params[:id])
  end

  def update
    @menu = Menu.find(params[:id])
    @menu.update(menu_params)
    redirect_to admin_menu_path(@menu.id)
  end

  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
    flash[:notice] = "メニューを削除しました"
    redirect_to admin_menus_path
  end

  def menu_params
    params.require(:menu).permit(:genre_id, :title, :body, :menu_image)
  end

end
