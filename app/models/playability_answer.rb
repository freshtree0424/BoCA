class PlayabilityAnswer < ApplicationRecord
  belongs_to :user
  belongs_to :playability

  # レコードごとに回答された値を合計して返すメソッド
  def self.total_score
    sum(:answer)
  end
end
