class ControllabilityAnswer < ApplicationRecord
  belongs_to :user
  belongs_to :controllability

  #answerの合計点とそれに基づく条件分岐文言
  def self.total_score_and_grade_for_user(user)
    score = where(user: user).sum(:answer)
    grade =
      case score
      when 0..25
        '誠実性は低め。衝動的に行動する予定を先延ばしにする。'
      when 26..32
        '誠実性は平均程度。コツコツ続けられることもあれば衝動的になることもある。'
      else
        '誠実性は高め。つらい仕事でも淡々と行える性格です。'
      end
    return score, grade
  end

end
