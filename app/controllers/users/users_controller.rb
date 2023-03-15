class Users::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
    @user = current_user
    user_id = params[:id].to_i
    login_user_id = current_user.id
    if(user_id != login_user_id)
      redirect_to user_path(@user)
    end
  end

  def update
     @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "登録内容を更新しました！"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def unsubscribe
    @user = current_user
  end

  def withdraw
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会が完了しました"
    redirect_to root_path
  end

  def likes
    @users = User.page(params[:page])
    @favorites = Favorite.where(user_id: current_user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :name_kana, :date_of_birth, :sex_select, :introduction, :profile_image, :email, :is_deleted)
  end

end