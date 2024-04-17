class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #アソシエーション
  has_many :posts
  has_many :post_comments, dependent: :destroy
  has_many :view_counts, dependent: :destroy
  #性格分析アソシエーション
  has_many :emotionality_answers, dependent: :destroy
  has_many :emotionalities, through: :emotionality_answers, dependent: :destroy
  has_many :extraversion_answers, dependent: :destroy
  has_many :extraversions, through: :extraversion_answers, dependent: :destroy
  has_many :controllability_answers, dependent: :destroy
  has_many :controllabilities, through: :controllability_answers, dependent: :destroy
  has_many :attachment_answers, dependent: :destroy
  has_many :attachments, through: :attachment_answers, dependent: :destroy
  has_many :playability_answers, dependent: :destroy
  has_many :playabilities, through: :playability_answers, dependent: :destroy


  #バリテーション
  validates :name, presence: true, uniqueness: true, unless: :new_record?
  validates :introduction, length: { maximum: 50 }

  has_one_attached :profile_image

  #プロフィール画像の確認を行うメソッド
  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end

  # ゲストログイン用メソッド
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト"
      user.introduction = "ゲストで操作しています。"
    end
  end

end
