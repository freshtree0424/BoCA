class ExtraversionAnswer < ApplicationRecord
  belongs_to :user
  belongs_to :extraversion
  
  # レコードごとに回答された値を合計して返すメソッド
  def self.total_score
    sum(:answer)
  end
end
