class Admin::PostsController < AdminController
  before_action :authenticate_admin!

  def index
    if params[:search].present?
      search_posts = Post.select { |post| post.title.include?(params[:search]) }
      @posts = Kaminari.paginate_array(search_posts).page(params[:page])
      @heading = "「#{params[:search]}」の検索結果"
    else
      @posts = Post.all.order(created_at: :desc).page(params[:page])
      @heading = "投稿一覧"
    end
    @tag_lists = {}
      @posts.each do |post|
      # 各投稿ごとにタグを取得し、ハッシュに格納する
      @tag_lists[post.id] = post.tags.pluck(:name).join(',')
      end
  end

  def show
    @post = Post.find_by(id: params[:id])
    #存在しないIDを検索したらトップへ遷移
    if @post.nil?
      redirect_to admin_root_path
      return
    end
    @post_comment = PostComment.new
    @post_detail = Post.find(params[:id])
    @tag_list = @post.tags.pluck(:name).join(',')
    @tags = @post.tags
  end

  def destroy
    post = Post.find_by(id: params[:id])
    #存在しないIDを検索したらトップへ遷移
    if post.nil?
      redirect_to admin_root_path
      return
    end
    post.destroy
    redirect_to admin_posts_path
  end

  def search_tag
    if params[:tag_name].present?
      @tag = Tag.find_by(name: params[:tag_name])
      #存在しないタグを検索したらトップへ遷移
      if @tag.nil?
        redirect_to admin_root_path
        return
      end
      @posts = @tag.posts.page(params[:page])
    else
      @tag_list = Tag.all
    end
    @tag_lists = {}
    @posts.each do |post|
      @tag_lists[post.id] = post.tags.pluck(:name).join(',')
    end
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :title, :body, :star, :score)
  end

  def tag_params
    params.require(:tag).permit(:name)
  end

end
