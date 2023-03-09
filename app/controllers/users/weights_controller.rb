class Users::WeightsController < ApplicationController
  before_action :authenticate_user!

  def create
    @weight = Weight.new(weight_params)
    @weight.user_id = current_user.id
    if @weight.save
      flash[:notice] = "体重を入力しました"
      redirect_to weights_path
    else
      @weights = Weight.all
      @user = current_user
      render :index
    end
  end

  def index
    @weights = Weight.all
    @weights = current_user.weights
    @weight = Weight.new
    @user = User.where(params[:id])
    @user = current_user

  end

  def edit
    @weight = Weight.find(params[:id])
  end

  def update
    @weight = Weight.find(params[:id])
    if @weight.update(weight_params)
      flash[:notice] = "体重の数値を更新しました"
      redirect_to weights_path
    else
      render :edit
    end
  end

  def destroy
    @weight = Weight.find(params[:id])
    @weight.destroy
    flash[:notice] = "削除しました"
    redirect_to weights_path
  end

  private

  def weight_params
    params.require(:weight).permit(:user_id, :weight).merge(user_id: current_user.id)
  end

end
