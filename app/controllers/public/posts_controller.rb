class Public::PostsController < PublicController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
  end

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
      redirect_to root_path
      return
    end
    @user = @post.user
    @tag_list = @post.tags.pluck(:name).join(',')
    @post_comment = PostComment.new
    @tags = @post.tags
    @post_detail = Post.find(params[:id])
    unless ViewCount.find_by(user_id: current_user.id, post_id: @post_detail.id)
      current_user.view_counts.create(post_id: @post_detail.id)
    end
  end

  def edit
    @user = current_user
    @post = Post.find_by(id: params[:id])
    #存在しないIDを検索したらトップへ遷移
    if @post.nil?
      redirect_to root_path
      return
    end
    @tags = @post.tags.pluck(:name).join(',')
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    tags = params[:post][:name].split(',')
   if @post.save
     @post.save_tags(tags)
     redirect_to posts_path(@post.id)
   else
     @user = current_user
     @posts = Post.all.page(params[:page])
     render :new
   end
  end

  def update
    @post = Post.find_by(id: params[:id])
    #存在しないIDを検索したらトップへ遷移
    if @post.nil?
      redirect_to root_path
      return
    end
    tags = params[:post][:name].split(',')
    if @post.update(post_params)
      @post.update_tags(tags)
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    post = Post.find_by(id: params[:id])
    #存在しないIDを検索したらトップへ遷移
    if post.nil?
      redirect_to root_path
      return
    end
    post.destroy
    @user = current_user
    redirect_to user_path(@user)
  end

  def search_tag
    if params[:tag_name].present?
      @tag = Tag.find_by(name: params[:tag_name])
      #存在しないタグを検索したらトップへ遷移
      if @tag.nil?
        redirect_to root_path
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
    params.require(:post).permit(:user_id, :title, :body, :score)
  end

  def tag_params
    params.require(:tag).permit(:name)
  end

  def ensure_correct_user
    @post = Post.find(params[:id])
    user = @post.user
    unless user.id == current_user.id
      redirect_to user_path(current_user)
    end
  end

end
