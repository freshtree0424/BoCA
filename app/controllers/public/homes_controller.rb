class Public::HomesController < PublicController
skip_before_action :authenticate_user!, only: [:guest_sign_in]

  def top
   @posts = Post.order(created_at: :desc).page(params[:page])
   @tag_lists = {}
    @posts.each do |post|
      @tag_lists[post.id] = post.tags.pluck(:name).join(',')
    end
  end

  def about
  end

  #ゲストログイン用
  def guest_sign_in
    user = User.guest
    sign_in user
    flash[:notice] = "ゲストユーザーとしてログインしました。"
    redirect_to user_path(current_user)
  end

  def search
    case params[:search_model]
    when "user" then
      redirect_to users_path(search: params[:search])
    when "post" then
      redirect_to posts_path(search: params[:search])
    when "tag" then
      redirect_to tags_path(search: params[:search])
    end
  end

end
