class Admin::UsersController < AdminController

  def index
    if params[:search].present?
       search_users = User.select { |user| user.name.include?(params[:search]) }
       @users = Kaminari.paginate_array(search_users).page(params[:page])
       @heading = "「#{params[:search]}」の検索結果"
    else
       @users = User.all.page(params[:page])
       @heading = "会員一覧"
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    #存在しないIDを検索したらトップへ遷移
    if @user.nil?
      redirect_to admin_root_path
      return
    end
    @posts = @user.posts.page(params[:page])
    @post = Post.new
    @tag_lists = {}
    @posts.each do |post|
      @tag_lists[post.id] = post.tags.pluck(:name).join(',')
    end
  end

end
