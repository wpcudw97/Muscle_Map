class SearchesController <
  before_action :authenticate_user!

  def search
    @range = params[:range]

    if @range == "Menu"
      @menus = Menu.looks(params[:search], params[:word])
    else
      @posts = Post.looks(params[:search], params[:word])
    end
  end
end
