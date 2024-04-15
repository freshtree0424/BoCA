class Admin::TagsController < AdminController
  
  def index
    if params[:search].present?
      @tags = Tag.where("name LIKE ?", "%#{params[:search]}%") if params[:search].present?
      @posts = Post.joins(:tags).where(tags: { id: @tags }).distinct
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
end