class Users::CommentsController < ApplicationController

  def show
    @comments = Comment.all
  end

  def create
    menu = Menu.find(params[:menu_id])
    @comment = menu.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
       flash[:notice] = "コメントしました"
      redirect_to cmenu_comments_path(@menu)
    else
      flash[:notice] = "コメントできませんでした"
      redirect_to cmenu_comments_path(@menu)
    end
  end

  def edit

  end

  def update
  end

  def destroy

  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :menu_id, :comment)
  end
end
