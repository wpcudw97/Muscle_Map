class Users::PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.menu_id = current_user.id
    if @post.save
      flash[:notice] = "投稿しました！"
      redirect_to post_path(@post.id)
    else
      @posts = Post.all
      @user = current_user
      render :index
    end
  end

  def index
    @posts = Post.all
    @user = User.where(params[:id])
    @user = current_user
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
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
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.user_id = current_user.id
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :post_image, :rate)
  end

end