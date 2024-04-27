class Attachment < ApplicationRecord
  belongs_to :category
  has_many :attachment_answers, dependent: :destroy
  
  validates :question, presence: true
  
end
