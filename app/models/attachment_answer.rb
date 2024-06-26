class AttachmentAnswer < ApplicationRecord
  belongs_to :user
  belongs_to :attachment

  #answerの合計点とそれに基づく条件分岐文言
  def self.total_score_and_grade_for_user(user)
    score = where(user: user).sum(:answer)
    grade =
      case score
      when 0..28
        '調和性は低め。他人への親切心があまりない性格です。交渉が得意なケースもあります。'
      when 29..35
        '調和性は平均程度。親切なこともあれば好き嫌いが激しい事もある性格です。'
      else
        '調和性は高め。他人に親切な性格です。'
      end
    return score, grade
  end


end
