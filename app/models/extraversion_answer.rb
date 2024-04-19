class ExtraversionAnswer < ApplicationRecord
  belongs_to :user
  belongs_to :extraversion

  #answerの合計点とそれに基づく条件分岐文言
  def self.total_score_and_grade_for_user(user)
    score = where(user: user).sum(:answer)
    grade =
      case score
      when 0..27
        '外向性は低め。他人と関わるのが苦手で内向的。思考力や洞察力に優れている場合も高くなる傾向があります。'
      when 28..34
        '外向性は平均程度。適度に外向的で適度に内向的。どちらの性格も併せ持っています。'
      else
        '外向性は高め。活動的で他人と関わることが好き、もしくは苦ではない性格です。'
      end
    return score, grade
  end

  #特定のquestionの回答を逆転させるメソッド
  def reverse_answer(extraversion_id)
    # 特定のextraversionに関連するExtraversionAnswerを取得
    answer = ExtraversionAnswer.find_by(extraversion_id: extraversion_id, user_id: user_id)
    return unless answer # 該当する回答が見つからない場合は何もしない
    # 回答を逆転させる
    answer.update(answer: 6 - answer.answer)
  end

end
