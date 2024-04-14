class Public::HomesController < PublicController

  def top
   @posts = Post.order(created_at: :desc)
   @tag_lists = {}
    @posts.each do |post|
      @tag_lists[post.id] = post.tags.pluck(:name).join(',')
    end
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
