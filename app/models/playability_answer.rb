class PlayabilityAnswer < ApplicationRecord
  belongs_to :user
  belongs_to :playability

  #answerの合計点とそれに基づく条件分岐文言
  def self.total_score_and_grade_for_user(user)
    score = where(user: user).sum(:answer)
    grade =
      case score
      when 0..31
        '開放性は低め。新しい事を好まず、決まったルールや規則を守りたい性格です。'
      when 32..38
        '開放性は平均程度。ルールを守りつつ新しい事に挑戦したい性格です。'
      else
        '開放性は高め。知的好奇心が高く、新しいことを試したい性格です。'
      end
    return score, grade
  end

end
