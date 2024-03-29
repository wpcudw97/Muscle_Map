class Users::MenusController < ApplicationController
  before_action :authenticate_user!

  def index
    @menus = params[:tag_id].present? ? Tag.find(params[:tag_id]).menus.page(params[:page]): Menu.all.page(params[:page])
  end

  def show
    @menus = Menu.all
    @menu = Menu.find(params[:id])
    @comment = Comment.new
    @comments = @menu.comments.includes(:user)
  end

  private

  def menu_params
    params.require(:menu).permit(:genre_id, :title, :body, :menu_image)
  end
end
