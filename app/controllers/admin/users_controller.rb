class Admin::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    flash[:notice] = "登録内容を更新しました！"
    redirect_to  admin_user_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :name_kana, :date_of_birth, :sex_select, :introduction, :profile_image, :email, :is_deleted)
  end
end