class ControllabilityAnswer < ApplicationRecord
  belongs_to :user
  belongs_to :controllability
  
  # レコードごとに回答された値を合計して返すメソッド
  def self.total_score_for_user(user)
    where(user: user).sum(:answer)
  end
end
