class Admin::CommentsController < ApplicationController

  def create
    @menu = Menu.find(params[:menu_id])
    @comment = @menu.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to admin_menu_path(@comment.menu)
    else
      @menu_new = Comment.new
      @comments = @menu.comments
      redirect_to new_admin_menu_path
    end
  end

  def edit
    @menu = Menu.find(params[:menu_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @menu = Menu.find(params[:menu_id])
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    flash[:notice] = "コメント内容を変更しました！"
    redirect_to  admin_menu_path(@comment.menu)
  end

  def destroy
    comment = Comment.find_by(id: params[:id], menu_id: params[:menu_id])
    comment.destroy
    flash[:notice] = "コメントを削除しました！"
    redirect_to admin_menu_path(comment.menu)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment).merge(menu_id: params[:menu_id])
  end

end
