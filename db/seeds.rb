# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


TEST_GMAIL_ACCOUNT_NAME = ENV["TEST_GMAIL_ACCOUNT_NAME"]
TEST_PASSWORD = ENV["TEST_PASSWORD"]

#管理者ログイン
Admin.create!(
   email: 'boca@gmail.com',
   password: '123456',
   password_confirmation: "123456"
)

#ユーザー
initial_users = [
  {
    name: "一ノ瀬洋子",
    introduction: "心理戦や考える系が好き"
  },
  {
    name: "二階堂啓介",
    introduction: "アクション系好き"
  },
]
initial_users.each.with_index(1) do |user, i|
  user["email"] = "#{TEST_GMAIL_ACCOUNT_NAME}+test#{i}@gmail.com"
  user["password"] = TEST_PASSWORD
  user["password_confirmation"] = TEST_PASSWORD
  User.create!(user)
end

#投稿
initial_posts = [
  {
    user_id: 1,
    title: "シンフォニー",
    body: "基本は頭脳戦で陰謀と策略が渦巻く中、魅力的なキャラのアクション表現が良かった！",
    score: 4,
    created_at: "2024/04/14 14:21:34"
  },
  {
    user_id: 2,
    title: "Paradise",
    body: "流行のタイトルを購入。タイトル回収が凄かった。",
    score: 5,
    created_at: "2024/04/15 15:43:52"
  },
  {
    user_id: 3,
    title: "夏祭りの始まり",
    body: "BoCA大賞ノミネート作品！感動作で泣けました！",
    score: 5,
    created_at: "2024/04/16 17:42:09"
  },
]
Post.create(initial_posts)

#タグ
initial_tags = [
  {
    name: "アクション",
  },
  {
    name: "頭脳戦",
  },
  {
    name: "SF",
  },
  {
    name: "ファンタジー",
  },
  {
    name: "感動",
  },
  {
    name: "ノミネート",
  },
]
Tag.create(initial_tags)


#タグ中間
initial_tag_relationships = [
  {
    tag_id: 1,
    post_id: 1,
  },
  {
    tag_id: 2,
    post_id: 1,
  },
  {
    tag_id: 3,
    post_id: 2,
  },
  {
    tag_id: 4,
    post_id: 2,
  },
  {
    tag_id: 5,
    post_id: 3,
  },
  {
    tag_id: 6,
    post_id: 3,
  },
]
TagRelationship.create(initial_tag_relationships)


#カテゴリー
initial_categories = [
  {name: "Emotionality1"},
  {name: "Emotionality2"},
  {name: "Emotionality3"},
  {name: "Emotionality4"},
  {name: "Emotionality5"},
  {name: "Extraversion1"},
  {name: "Extraversion2"},
  {name: "Extraversion3"},
  {name: "Extraversion4"},
  {name: "Extraversion5"},
  {name: "Controllability1"},
  {name: "Controllability2"},
  {name: "Controllability3"},
  {name: "Controllability4"},
  {name: "Controllability5"},
  {name: "Attachment1"},
  {name: "Attachment2"},
  {name: "Attachment3"},
  {name: "Attachment4"},
  {name: "Attachment5"},
  {name: "Playability1"},
  {name: "Playability2"},
  {name: "Playability3"},
  {name: "Playability4"},
  {name: "Playability5"},
]
Category.create(initial_categories)

#Emテーブル
initial_emotionalities = [
  {
    category_id: 1,
    question: "小さなことにはくよくよしない"
  },
  {
    category_id: 1,
    question: "ものごとがうまく行かないのではないかと，よく心配する"
  },
  {
    category_id: 2,
    question: "緊張してふるえるようなことはない"
  },
  {
    category_id: 2,
    question: "よく緊張する"
  },
  {
    category_id: 3,
    question: "見捨てられた感じがする"
  },
  {
    category_id: 3,
    question: "憂鬱になりやすい"
  },
  {
    category_id: 4,
    question: "自分がみじめな人間に思える"
  },
  {
    category_id: 4,
    question: "自分には全然価値がないように思えることがある"
  },
  {
    category_id: 5,
    question: "陽気になったり陰気になったり，気分が変りやすい"
  },
  {
    category_id: 5,
    question: "明るいときと暗いときの気分の差が大きい"
  },
]
Emotionality.create(initial_emotionalities)

#Exテーブル
#initial_extraversions = [
#  {
#    category_id: 6,
#    question: "もの静かである"
#  },
#  {
#    category_id: 6,
#    question: "じっとしているのが嫌いである"
#  },
#  {
#    category_id: 7,
#    question: "人の上に立つことが多い"
#  },
#  {
#    category_id: 7,
#    question: "人に指示を与えるような立場に立つことが多い"
#  },
#  {
#    category_id: 8,
#    question: "大勢でわいわい騒ぐのが好きである"
#  },
#  {
#    category_id: 8,
#    question: "大勢の人の中にいるのが好きである"
#  },
#  {
#    category_id: 9,
#    question: "スポーツ観戦で我を忘れて応援することがある"
#  },
#  {
#    category_id: 9,
#    question: "にぎやかな所が好きである"
#  },
#  {
#    category_id: 10,
#    question: "人から注目されるとうれしい"
#  },
#  {
#    category_id: 10,
#    question: "地味で目立つことはない"
#  },
#]
#Extraversion.create(initial_extraversions)

#Cテーブル
#initial_controllabilities = [
#  {
#    category_id: 11,
#    question: "あまりきっちりした人間ではない"
#  },
#  {
#    category_id: 11,
#    question: "几帳面である"
#  },
#  {
#    category_id: 12,
#    question: "根気が続かないほうである"
#  },
#  {
#    category_id: 12,
#    question: "まじめな努力家である"
#  },
#  {
#    category_id: 13,
#    question: "責任感が乏しいといわれることがある"
#  },
#  {
#    category_id: 13,
#    question: "仕事を投げやりにしてしまうことがある"
#  },
#  {
#    category_id: 14,
#    question: "欲望のままに行動してしまうようなことは，ほとんどない"
#  },
#  {
#    category_id: 14,
#    question: "しんどいことはやりたくない"
#  },
#  {
#    category_id: 15,
#    question: "よく考えてから行動する"
#  },
#  {
#    category_id: 15,
#    question: "仕事は計画的にするようにしている"
#  },
#]
#Controllability.create(initial_controllabilities)

#Aテーブル
#initial_attachments = [
#  {
#    category_id: 16,
#    question: "人には暖かく友好的に接している"
#  },
#  {
#    category_id: 16,
#    question: "あまり親切な人間ではない"
#  },
#  {
#    category_id: 17,
#    question: "人情深いほうだと思う"
#  },
#  {
#    category_id: 17,
#    question: "気配りをするほうである"
#  },
#  {
#    category_id: 18,
#    question: "出会った人はたいがい好きになる"
#  },
#  {
#    category_id: 18,
#    question: "どうしても好きになれない人がたくさんいる"
#  },
#  {
#    category_id: 19,
#    question: "人のよろこびを自分のことのように喜べる"
#  },
#  {
#    category_id: 19,
#    question: "人の気持ちを積極的に理解しようとは思わない"
#  },
#  {
#    category_id: 20,
#    question: "誰に対しても優しく親切にふるまうようにしている"
#  },
#  {
#    category_id: 20,
#    question: "人を馬鹿にしているといわれることがある"
#  },
#]
#Attachment.create(initial_attachments)

#Pテーブル
#initial_playabilities = [
#  {
#    category_id: 21,
#    question: "考えることは面白い"
#  },
#  {
#    category_id: 21,
#    question: "好奇心が強い"
#  },
#  {
#    category_id: 22,
#    question: "イメージがあふれ出てくる"
#  },
#  {
#    category_id: 22,
#    question: "空想の世界をさまようことはほとんどない"
#  },
#  {
#    category_id: 23,
#    question: "美や芸術にはあまり関心がない"
#  },
#  {
#    category_id: 23,
#    question: "芸術作品に接すると鳥肌がたち興奮をおぼえることがある"
#  },
#  {
#    category_id: 24,
#    question: "自分の感じたことを大切にする"
#  },
#  {
#    category_id: 24,
#    question: "感情豊かな人間である"
#  },
#  {
#    category_id: 25,
#    question: "変わった人だとよくいわれる"
#  },
#  {
#    category_id: 25,
#    question: "別世界に行ってみたい"
#  },
#]
#Playability.create(initial_playabilities)

#Em_answerテーブル
initial_emotionality_answers = [
  {
    user_id: 1,
    emotionality_id: 1,
    answer: 4
  },
  {
    user_id: 1,
    emotionality_id: 2,
    answer: 2
  },
  {
    user_id: 1,
    emotionality_id: 3,
    answer: 3
  },
  {
    user_id: 1,
    emotionality_id: 4,
    answer: 1
  },
  {
    user_id: 1,
    emotionality_id: 5,
    answer: 1
  },
  {
    user_id: 1,
    emotionality_id: 6,
    answer: 1
  },
  {
    user_id: 1,
    emotionality_id: 7,
    answer: 1
  },
  {
    user_id: 1,
    emotionality_id: 8,
    answer: 1
  },
  {
    user_id: 1,
    emotionality_id: 9,
    answer: 1
  },
  {
    user_id: 1,
    emotionality_id: 10,
    answer: 4
  },
]
EmotionalityAnswer.create(initial_emotionality_answers)

#Ex_answerテーブル
#initial_extraversion_answers = [
#  {
#    user_id: 1,
#    extraversion_id: 1,
#    answer: 3
#  },
#  {
#    user_id: 1,
#    extraversion_id: 2,
#    answer: 2
#  },
#  {
#    user_id: 1,
#    extraversion_id: 3,
#    answer: 3
#  },
#  {
#    user_id: 1,
#    extraversion_id: 4,
#    answer: 3
#  },
#  {
#    user_id: 1,
#    extraversion_id: 5,
#    answer: 2
#  },
#  {
#    user_id: 1,
#    extraversion_id: 6,
#    answer: 2
#  },
#  {
#    user_id: 1,
#    extraversion_id: 7,
#    answer: 4
#  },
#  {
#    user_id: 1,
#    extraversion_id: 8,
#    answer: 2
#  },
#  {
#    user_id: 1,
#    extraversion_id: 9,
#    answer: 4
#  },
#  {
#    user_id: 1,
#    extraversion_id: 10,
#    answer: 3
#  },
#]
#Extraversion_answer.create(initial_extraversion_answers)

#C_answerテーブル
#initial_controllability_answers = [
#  {
#    user_id: 1,
#    controllability_id: 1,
#    answer: 2
#  },
#  {
#    user_id: 1,
#    controllability_id: 2,
#    answer: 4
#  },
#  {
#    user_id: 1,
#    controllability_id: 3,
#    answer: 3
#  },
#  {
#    user_id: 1,
#    controllability_id: 4,
#    answer: 4
#  },
#  {
#    user_id: 1,
#    controllability_id: 5,
#    answer: 1
#  },
#  {
#    user_id: 1,
#    controllability_id: 6,
#    answer: 1
#  },
#  {
#    user_id: 1,
#    controllability_id: 7,
#    answer: 3
#  },
#  {
#    user_id: 1,
#    controllability_id: 8,
#    answer: 3
#  },
#  {
#    user_id: 1,
#    controllability_id: 9,
#    answer: 2
#  },
#  {
#    user_id: 1,
#    controllability_id: 10,
#    answer: 4
#  },
#]
#Controllability_answer.create(initial_controllability_answers)

#A_answerテーブル
#initial_attachment_answers = [
#  {
#    user_id: 1,
#    attachment_id: 1,
#    answer: 4
#  },
#  {
#    user_id: 1,
#    attachment_id: 2,
#    answer: 2
#  },
#  {
#    user_id: 1,
#    attachment_id: 3,
#    answer: 3
#  },
#  {
#    user_id: 1,
#    attachment_id: 4,
#    answer: 5
#  },
#  {
#    user_id: 1,
#    attachment_id: 5,
#    answer: 3
#  },
#  {
#    user_id: 1,
#    attachment_id: 6,
#    answer: 3
#  },
#  {
#    user_id: 1,
#    attachment_id: 7,
#    answer: 4
#  },
#  {
#    user_id: 1,
#    attachment_id: 8,
#    answer: 2
#  },
#  {
#    user_id: 1,
#    attachment_id: 9,
#    answer: 3
#  },
#  {
#    user_id: 1,
#    attachment_id: 10,
#    answer: 2
#  },
#]
#Attachment_answer.create(initial_attachment_answers)

#P_answerテーブル
#initial_playability_answers = [
#  {
#    user_id: 1,
#    playability_id: 1,
#    answer: 4
#  },
#  {
#    user_id: 1,
#    playability_id: 2,
#    answer: 4
#  },
#  {
#    user_id: 1,
#    playability_id: 3,
#    answer: 2
#  },
#  {
#    user_id: 1,
#    playability_id: 4,
#    answer: 1
#  },
#  {
#    user_id: 1,
#    playability_id: 5,
#    answer: 1
#  },
#  {
#    user_id: 1,
#    playability_id: 6,
#    answer: 5
#  },
#  {
#    user_id: 1,
#    playability_id: 7,
#    answer: 5
#  },
#  {
#    user_id: 1,
#    playability_id: 8,
#    answer: 3
#  },
#  {
#    user_id: 1,
#    playability_id: 9,
#    answer: 3
#  },
#  {
#    user_id: 1,
#    playability_id: 10,
#    answer: 4
#  },
#]
#Playability_answer.create(initial_playability_answers)