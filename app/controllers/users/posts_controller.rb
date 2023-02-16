class Users::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
    @post = Post.new
  end

  def show
  end

  def edit
  end

  def update
  end

  def delete
  end
end
