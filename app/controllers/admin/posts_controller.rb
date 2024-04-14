class Admin::PostsController < AdminController
  before_action :authenticate_admin!

  def index
    if params[:search].present?
      @posts = Post.where("title LIKE ?", "%#{params[:search]}%") if params[:search].present?
      @heading = "「#{params[:search]}」の検索結果"
    else
      @posts = Post.all.order(created_at: :asc)
      @heading = "投稿一覧"
    end
    @tag_lists = {}
      @posts.each do |post|
      # 各投稿ごとにタグを取得し、ハッシュに格納する
      @tag_lists[post.id] = post.tags.pluck(:name).join(',')
      end
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @post_detail = Post.find(params[:id])
    @tag_list = @post.tags.pluck(:name).join(',')
    @tags = @post.tags
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to admin_posts_path
  end
  
  def search_tag
    if params[:tag_name].present?
      @tag = Tag.find_by(name: params[:tag_name])
      @posts = @tag.posts
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
    params.require(:post).permit(:user_id, :title, :body, :score)
  end
  
  def tag_params
    params.require(:tag).permit(:name)
  end

end
