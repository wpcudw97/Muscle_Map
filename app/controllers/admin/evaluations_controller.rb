class Admin::EvaluationsController < ApplicationController
  before_action :authenticate_admin!

  def edit
    @post = Post.find(params[:post_id])
    @evaluation = Evaluation.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @evaluation = Evaluation.find(params[:id])
    if @evaluation.update(evaluation_params)
      flash[:notice] = "コメント内容を変更しました！"
      redirect_to admin_post_path(@evaluation.post)
    else
      render :edit
    end
  end

  def destroy
    evaluation = Evaluation.find_by(id: params[:id], post_id: params[:post_id])
    evaluation.destroy
    flash[:notice] = "コメントを削除しました！"
    redirect_to admin_post_path(evaluation.post)
  end

  private

  def evaluation_params
    params.require(:evaluation).permit(:evaluation).merge(post_id: params[:post_id])
  end

end
