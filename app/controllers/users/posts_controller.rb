class Users::PostsController < ApplicationController
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
    @new_post = Post.new
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :post_image, :rate)
  end

end
