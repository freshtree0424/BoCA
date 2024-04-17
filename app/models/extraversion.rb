class Extraversion < ApplicationRecord
  belongs_to :category
  has_many :extraversion_answers, dependent: :destroy
end
