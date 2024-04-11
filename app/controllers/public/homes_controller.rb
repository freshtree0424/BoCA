class Public::HomesController < PublicController

  def top
   @posts = Post.all
  end

  def about
  end
  
  def search
    case params[:search_model]
    when "user" then
      redirect_to users_path(search: params[:search])
    when "post" then
      redirect_to posts_path(search: params[:search])
    end
  end
   
end
