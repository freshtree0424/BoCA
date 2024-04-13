class Tag < ApplicationRecord

  #タグ機能
  has_many :tag_relationships, dependent: :destroy
  has_many :posts, through: :tag_relationships, dependent: :destroy

end
