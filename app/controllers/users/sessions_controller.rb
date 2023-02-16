# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :reject_deleted_user, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(@user)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def reject_deleted_user
    @user=User.find_by(email: params[:user][:email])
    if @user
      if @user.valid_password?(params[:user][:password]) && @user.is_deleted == "退会"
        flash[:notice] = "退会済みの為、再登録が必要です"
        redirect_to new_user_registration_path
      end
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :name_kana, :date_of_birth, :sex_select, :introduction, :profile_image, :is_deleted])
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
