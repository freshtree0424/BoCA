class Post < ApplicationRecord

  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :view_counts, dependent: :destroy

  #タグ機能
  has_many :tag_relationships, dependent: :destroy
  has_many :tags, through: :tag_relationships, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }
  validates :score, presence: true

  #タグ付けの新規投稿用メソッド
  def save_tags(tags)
    tags.each do |new_tag|
      tag = Tag.find_or_create_by(name: new_tag)
      self.tags << tag unless self.tags.include?(tag)
    end
  end

  #タグ付けの更新用メソッド
  def update_tags(latest_tags)
    if self.tags.empty?
      latest_tags.each do |latest_tag|
        self.tags.find_or_create_by(name: latest_tag)
      end
    elsif latest_tags.empty?
      self.tags.each do |tag|
        self.tags.delete(tag)
      end
    else
      current_tags = self.tags.pluck(:name)
      old_tags = current_tags - latest_tags
      new_tags = latest_tags - current_tags
      old_tags.each do |old_tag|
        tag = self.tags.find_by(name: old_tag)
        self.tags.delete(tag) if tag.present?
      end
      new_tags.each do |new_tag|
        self.tags.find_or_create_by(name: new_tag)
      end
    end
  end

  def self.search_by_title_or_tag(query)
    joins(:tags).where("posts.title LIKE :query OR tags.name LIKE :query", query: "%#{query}%")
  end

end
