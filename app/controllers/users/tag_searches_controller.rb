class Users::TagSearchesController < ApplicationController

  def tag_search
    @menus = params[:tag_id].present? ? Tag.find(params[:tag_id]).menus : Menu.all
  end

end
