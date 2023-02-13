class User::UserController < ApplicationController

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to  user_path
  end

   private

  def user_params
    params.require(:user).permit(:name, :name_kana, :date_of_birth, :sex, :ntroduction, :profile_image, :is_deleted)
  end

end
