class ExtraversionAnswer < ApplicationRecord
  belongs_to :user
  belongs_to :extraversion

  #answerの合計点とそれに基づく条件分岐文言
  def self.total_score_and_grade_for_user(user)
    score = where(user: user).sum(:answer)
    grade =
      case score
      when 0..30
        '外向性は低め。他人と関わるのが苦手で内向的。思考力や洞察力に優れている場合も高くなる傾向があります。'
      when 31..39
        '外向性は平均程度。適度に外向的で適度に内向的。どちらの性格も併せ持っています。'
      else
        '外向性は高め。活動的で他人と関わることが好き、もしくは苦ではない性格です。'
      end
    return score, grade
  end

end
