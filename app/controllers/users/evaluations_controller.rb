class Users::EvaluationsController < ApplicationController
  before_action :authenticate_user!

  def create
    @evaluation = Evaluation.new(evaluation_params)
    @evaluation.save
    @post = Post.find(params[:post_id])
    flash[:notice] = "コメントしました！"
    redirect_to post_path(@evaluation.post)
  end

  def edit
    @post = Post.find(params[:post_id])
    @evaluation = Evaluation.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @evaluation = Evaluation.find(params[:id])
    @evaluation.update(evaluation_params)
    flash[:notice] = "コメント内容を変更しました！"
    redirect_to post_path(@evaluation.post)
  end


  def destroy
    evaluation = Evaluation.find_by(id: params[:id], post_id: params[:post_id])
    evaluation.destroy
    flash[:notice] = "コメントを削除しました！"
    redirect_to post_path(evaluation.post)
  end

  private

  def evaluation_params
    params.require(:evaluation).permit(:evaluation).merge(user_id: current_user.id, post_id: params[:post_id])
  end

end
