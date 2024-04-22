class EmotionalityAnswer < ApplicationRecord
  belongs_to :user
  belongs_to :emotionality

  #answerの合計点とそれに基づく条件分岐文言
  def self.total_score_and_grade_for_user(user)
    score = where(user: user).sum(:answer)
    grade =
      case score
      when 0..31
        '神経症傾向は低め。多少の事ではメンタルが崩れません。'
      when 32..38
        '神経症傾向は平均程度。メンタルは普通で崩れることもあれば崩れないこともあります。'
      else
        '神経症傾向は高め。メンタルが敏感で多少のことで焦ったりします。感受性が高い場合も神経症傾向は高くなる傾向があります。'
      end
    return score, grade
  end

end
