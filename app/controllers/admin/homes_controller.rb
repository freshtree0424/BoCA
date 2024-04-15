class Admin::HomesController < AdminController
  def top
    @posts = Post.all.order(created_at: :desc)
    @tag_lists = {}
    @posts.each do |post|
      @tag_lists[post.id] = post.tags.pluck(:name).join(',')
    end
  end


  def search
    case params[:search_model]
    when "user" then
      redirect_to admin_users_path(search: params[:search])
    when "post" then
      redirect_to admin_posts_path(search: params[:search])
    when "tag" then
      redirect_to admin_tags_path(search: params[:search])
    end
  end
end
