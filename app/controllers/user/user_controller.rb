class User::UserController < ApplicationController

  def show
    @user = User.find(params[:id])
    @user = current_user
    @user.save
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
      flash[:notice] = 'You have updated user successfully.'
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

   private

  def user_params
    params.require(:user).permit(:name, :name_kana, :date_of_birth, :sex_select, :introduction, :profile_image, :is_deleted)
  end

end
