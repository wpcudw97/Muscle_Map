class Admin::MenusController < ApplicationController

  def index
    @menus = Menu.all
    @menu = params[:tag_id].present? ? Tag.find(params[:tag_id]).menus : Menu.all
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)
    @menu.save
    flash[:notice] = "メニューを作成しました！"
    redirect_to admin_menus_path
  end

  def show
    @menu = Menu.find(params[:id])
    @comment = Comment.new
    @comments = @menu.comments.includes(:user)
  end

  def edit
    @menu = Menu.find(params[:id])
  end

  def update
    @menu = Menu.find(params[:id])
    @menu.update(menu_params)
    flash[:notice] = "メニュー内容を更新しました！"
    redirect_to admin_menu_path(@menu)
  end

  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
    flash[:notice] = "メニューを削除しました"
    redirect_to admin_menus_path
  end

  private

  def menu_params
    params.require(:menu).permit(:genre_id, :title, :body, :menu_image, tag_ids: [])
  end

end
