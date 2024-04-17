class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #アソシエーション
  has_many :posts
  has_many :post_comments, dependent: :destroy
  has_many :view_counts, dependent: :destroy
  has_many :emotionality_answers, dependent: :destroy

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
