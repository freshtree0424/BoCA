class Controllability < ApplicationRecord
  belongs_to :category
  has_many :controllability_answers, dependent: :destroy
  
  validates :question, presence: true
  
end
