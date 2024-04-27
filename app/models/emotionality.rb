class Emotionality < ApplicationRecord
  belongs_to :category
  has_many :emotionality_answers, dependent: :destroy
  
  validates :question, presence: true
  
end
