class Users::MenusController < ApplicationController
  def index
     @menus = Menu.all
  end

  def show
    @menus = Menu.all
    @menu = Menu.find(params[:id])
  end

  def menu_params
    params.require(:menu).permit(:genre_id, :title, :body, :menu_image)
  end
end
