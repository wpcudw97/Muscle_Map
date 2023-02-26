class Users::CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.save
    flash[:notice] = "コメントしました！"
    redirect_to menu_path(@comment.menu)
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
    redirect_to menu_path(@comment.menu)
  end

  def destroy
    comment = Comment.find_by(id: params[:id], menu_id: params[:menu_id])
    comment.destroy
    flash[:notice] = "コメントを削除しました！"
    redirect_to menu_path(comment.menu)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, menu_id: params[:menu_id])
  end

end