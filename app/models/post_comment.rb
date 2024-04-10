class PostComment < ApplicationRecord
  
  belongs_to :user
  belongs_to :post
  
  #validates :comment, presence: true
  
  #has_many :view_counts, dependent: :destroy
  
end
