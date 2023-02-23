class Users::CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to menu_path(@comment.menu)
    else
      @menu = @comment.menu
      @comments = @menu.comments.includes(:user)
      render "posts/show"
    end
  end

  def destroy
    # comment = Comment.find_by(id: params[:id], post_id: params[:post_id])
    # comment.destroy
    # redirect_to post_path(comment.post)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, menu_id: params[:menu_id])
  end

end