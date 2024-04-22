class Public::UsersController < PublicController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]

  def index
    if params[:search].present?
      @users = User.where("name LIKE ?", "%#{params[:search]}%") if params[:search].present?
      @heading = "「#{params[:search]}」の検索結果"
    else
      @users = User.all
      @heading = "会員一覧"
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    #存在しないIDを検索したらトップへ遷移
    if @user.nil?
      redirect_to root_path
      return
    end
    @posts = @user.posts.order(created_at: :desc)
    @post = Post.new
    @tag_lists = {}
    @posts.each do |post|
      @tag_lists[post.id] = post.tags.pluck(:name).join(',')
    end
    @emotionality_total_score, @emotionality_grade = EmotionalityAnswer.total_score_and_grade_for_user(@user)
    @extraversion_total_score, @extraversion_grade = ExtraversionAnswer.total_score_and_grade_for_user(@user)
    @controllability_total_score, @controllability_grade = ControllabilityAnswer.total_score_and_grade_for_user(@user)
    @attachment_total_score, @attachment_grade = AttachmentAnswer.total_score_and_grade_for_user(@user)
    @playability_total_score, @playability_grade = PlayabilityAnswer.total_score_and_grade_for_user(@user)
  end

  def edit
    @user = User.find_by(id: params[:id])
    if @user.nil?
      redirect_to root_path
      return
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.nil?
      redirect_to root_path
      return
    end
    if @user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to user_path(current_user)
    end
  end

end
