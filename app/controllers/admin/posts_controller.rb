class Admin::PostsController < ApplicationController
  def index
    @posts = Post.all
    @user = User.where(params[:id])
    @user = current_user
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @new_post = Post.new
    @evaluation = Evaluation.new
    @evaluations = @post.evaluations.includes(:user)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "登録内容を更新しました！"
      redirect_to admin_post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to admin_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :post_image, :rate)
  end

end
