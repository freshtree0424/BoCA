class Playability < ApplicationRecord
  belongs_to :category
  has_many :playability_answers, dependent: :destroy
end
