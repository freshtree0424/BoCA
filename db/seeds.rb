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
   email: 'boca@example.com',
   password: '123456',
   password_confirmation: "123456"
)

#ユーザー
initial_users = [
  {
    name: "一ノ瀬洋子",
    introduction: "ファンタジーが特に好き"
  },
  {
    name: "二階堂啓介",
    introduction: "アクション系が好き"
  },
  {
    name: "三浦健太",
    introduction: "ミステリーが好き"
  },
  {
    name: "四谷葵",
    introduction: "ロマンス系好き"
  },
  {
    name: "五条咲夜",
    introduction: "歴史関係が好き"
  },
  {
    name: "六本木裕太",
    introduction: "ホラー系好き"
  },
  {
    name: "七海美咲",
    introduction: "コメディが好き"
  },
  {
    name: "八幡哲也",
    introduction: "ドラマ系好き"
  },
  {
    name: "九条華",
    introduction: "心理戦や考える系が好き"
  },
  {
    name: "十森蓮",
    introduction: "SFが好き"
  },
]
initial_users.each.with_index(1) do |user, i|
  user["email"] = "#{TEST_GMAIL_ACCOUNT_NAME}+test#{i}@example.com"
  user["password"] = TEST_PASSWORD
  user["password_confirmation"] = TEST_PASSWORD
  User.create!(user)
end

#投稿
initial_posts = [
  {
    user_id: 1,
    title: "魔法の書と失われた王国",
    body: "魔法の力と冒険が織りなすファンタジーの物語です。主人公は失われた王国の謎を解き明かすため、魔法の書を求めて危険な旅に出ます。著者は魔法の世界をリアルに描写し、読者を魅了します。予測不能な展開と緊張感が持続する一冊です。",
    star: 4,
    score: 1,
    created_at: "2024/04/12 14:21:34"
  },
  {
    user_id: 2,
    title: "機械の騎士と銀河の戦士",
    body: "未来の銀河を舞台にしたスチームパンクの冒険物語です。主人公は機械の騎士として、銀河の平和を守るために戦います。著者はスチームパンクの世界観を緻密に構築し、読者を没入させます。アクションと人間ドラマが絶妙に絡み合った一冊です。",
    star: 5,
    score: 0.6,
    created_at: "2024/04/15 15:43:52"
  },
  {
    user_id: 1,
    title: "宇宙の詩人",
    body: "宇宙を詩的な視点から描いた作品です。主人公は宇宙船の船長として星々の間を旅し、その経験を詩に綴ります。著者は宇宙の壮大さと神秘性を美しい言葉で表現し、読者を感動させます。宇宙の奥深さと人間の情熱が交錯する感動的な物語です。",
    star: 5,
    score: 0.3,
    created_at: "2024/04/16 17:42:09"
  },
  {
    user_id: 1,
    title: "星の舞踏会",
    body: " この本は、宇宙船の乗組員たちが未知の惑星で行われる神秘的な舞踏会に招かれる物語です。著者は宇宙の無限の可能性を描きながら、人間の心の複雑さと探求心を探求します。キャラクターの心情描写が深く、読み手を物語の世界に引き込みます。",
    star: 4,
    score: 0.6,
    created_at: "2024/04/17 14:21:34"
  },
  {
    user_id: 1,
    title: "時の迷宮",
    body: "この小説は、時間旅行を巡る驚くべき冒険を描いています。主人公は時間の迷宮に迷い込み、過去と未来の間を行き来しながら自身の運命を模索します。著者は時間の謎を巧みに操り、読者を非常に惹きつけます。絶え間ないサスペンスと驚きが詰まった一冊です。",
    star: 5,
    score: 1,
    created_at: "2024/04/18 13:43:52"
  },
  {
    user_id: 1,
    title: "銀河の謎",
    body: "宇宙を舞台にした壮大なミステリーです。銀河系の彼方にある謎の惑星を舞台に、探検家たちが奇妙な現象と対峙します。著者は惑星の秘密を徐々に明らかにしながら、読者に興奮と興味を与えます。想像力を刺激し、深い哲学的なテーマを探求した一冊です。",
    star: 5,
    score: 0.6,
    created_at: "2024/04/19 16:02:09"
  },
  {
    user_id: 1,
    title: "夢幻の林檎",
    body: "魔法と冒険が溢れる幻想的な世界を描いています。主人公は不思議な林檎を手に入れ、それが彼の人生に及ぼす影響を追求します。著者は豊かな描写とキャラクターの成長を通じて、読者を魅了します。ファンタジーの魅力と心温まる物語が絶妙に組み合わさった作品です。",
    star: 4,
    score: 1,
    created_at: "2024/04/20 17:21:34"
  },
  {
    user_id: 2,
    title: "未知なる深淵",
    body: "海底に広がる未知の領域を舞台にしたスリリングな冒険を描いています。主人公は深海探査に参加し、そこで遭遇する驚異的な生物や未解明の現象に直面します。著者は読者を海の底の神秘的な世界に引き込みながら、科学と冒険の融合を楽しませます。",
    star: 5,
    score: 0.1,
    created_at: "2024/04/21 18:43:52"
  },
]
Post.create(initial_posts)

#タグ
initial_tags = [
  {
    name: "ファンタジー",
  },
  {
    name: "ミステリー",
  },
  {
    name: "アクション",
  },
  {
    name: "ドラマ",
  },
  {
    name: "感動",
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
    tag_id: 1,
    post_id: 3,
  },
  {
    tag_id: 1,
    post_id: 4,
  },
  {
    tag_id: 1,
    post_id: 5,
  },
  {
    tag_id: 1,
    post_id: 6,
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
initial_extraversions = [
  {
    category_id: 6,
    question: "もの静かである"
  },
  {
    category_id: 6,
    question: "じっとしているのが嫌いである"
  },
  {
    category_id: 7,
    question: "人の上に立つことが多い"
  },
  {
    category_id: 7,
    question: "人に指示を与えるような立場に立つことが多い"
  },
  {
    category_id: 8,
    question: "大勢でわいわい騒ぐのが好きである"
  },
  {
    category_id: 8,
    question: "大勢の人の中にいるのが好きである"
  },
  {
    category_id: 9,
    question: "スポーツ観戦で我を忘れて応援することがある"
  },
  {
    category_id: 9,
    question: "にぎやかな所が好きである"
  },
  {
    category_id: 10,
    question: "人から注目されるとうれしい"
  },
  {
    category_id: 10,
    question: "地味で目立つことはない"
  },
]
Extraversion.create(initial_extraversions)

#Cテーブル
initial_controllabilities = [
  {
    category_id: 11,
    question: "あまりきっちりした人間ではない"
  },
  {
    category_id: 11,
    question: "几帳面である"
  },
  {
    category_id: 12,
    question: "根気が続かないほうである"
  },
  {
    category_id: 12,
    question: "まじめな努力家である"
  },
  {
    category_id: 13,
    question: "責任感が乏しいといわれることがある"
  },
  {
    category_id: 13,
    question: "仕事を投げやりにしてしまうことがある"
  },
  {
    category_id: 14,
    question: "欲望のままに行動してしまうようなことは，ほとんどない"
  },
  {
    category_id: 14,
    question: "しんどいことはやりたくない"
  },
  {
    category_id: 15,
    question: "よく考えてから行動する"
  },
  {
    category_id: 15,
    question: "仕事は計画的にするようにしている"
  },
]
Controllability.create(initial_controllabilities)

#Aテーブル
initial_attachments = [
  {
    category_id: 16,
    question: "人には暖かく友好的に接している"
  },
  {
    category_id: 16,
    question: "あまり親切な人間ではない"
  },
  {
    category_id: 17,
    question: "人情深いほうだと思う"
  },
  {
    category_id: 17,
    question: "気配りをするほうである"
  },
  {
    category_id: 18,
    question: "出会った人はたいがい好きになる"
  },
  {
    category_id: 18,
    question: "どうしても好きになれない人がたくさんいる"
  },
  {
    category_id: 19,
    question: "人のよろこびを自分のことのように喜べる"
  },
  {
    category_id: 19,
    question: "人の気持ちを積極的に理解しようとは思わない"
  },
  {
    category_id: 20,
    question: "誰に対しても優しく親切にふるまうようにしている"
  },
  {
    category_id: 20,
    question: "人を馬鹿にしているといわれることがある"
  },
]
Attachment.create(initial_attachments)

#Pテーブル
initial_playabilities = [
  {
    category_id: 21,
    question: "考えることは面白い"
  },
  {
    category_id: 21,
    question: "好奇心が強い"
  },
  {
    category_id: 22,
    question: "イメージがあふれ出てくる"
  },
  {
    category_id: 22,
    question: "空想の世界をさまようことはほとんどない"
  },
  {
    category_id: 23,
    question: "美や芸術にはあまり関心がない"
  },
  {
    category_id: 23,
    question: "芸術作品に接すると鳥肌がたち興奮をおぼえることがある"
  },
  {
    category_id: 24,
    question: "自分の感じたことを大切にする"
  },
  {
    category_id: 24,
    question: "感情豊かな人間である"
  },
  {
    category_id: 25,
    question: "変わった人だとよくいわれる"
  },
  {
    category_id: 25,
    question: "別世界に行ってみたい"
  },
]
Playability.create(initial_playabilities)

#Em_answerテーブル
initial_emotionality_answers = [
  {
    user_id: 1,
    emotionality_id: 1,
    answer: 2
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
initial_extraversion_answers = [
  {
    user_id: 1,
    extraversion_id: 1,
    answer: 3
  },
  {
    user_id: 1,
    extraversion_id: 2,
    answer: 2
  },
  {
    user_id: 1,
    extraversion_id: 3,
    answer: 3
  },
  {
    user_id: 1,
    extraversion_id: 4,
    answer: 3
  },
  {
    user_id: 1,
    extraversion_id: 5,
    answer: 2
  },
  {
    user_id: 1,
    extraversion_id: 6,
    answer: 2
  },
  {
    user_id: 1,
    extraversion_id: 7,
    answer: 4
  },
  {
    user_id: 1,
    extraversion_id: 8,
    answer: 2
  },
  {
    user_id: 1,
    extraversion_id: 9,
    answer: 4
  },
  {
    user_id: 1,
    extraversion_id: 10,
    answer: 3
  },
]
ExtraversionAnswer.create(initial_extraversion_answers)

#C_answerテーブル
initial_controllability_answers = [
  {
    user_id: 1,
    controllability_id: 1,
    answer: 4
  },
  {
    user_id: 1,
    controllability_id: 2,
    answer: 4
  },
  {
    user_id: 1,
    controllability_id: 3,
    answer: 3
  },
  {
    user_id: 1,
    controllability_id: 4,
    answer: 4
  },
  {
    user_id: 1,
    controllability_id: 5,
    answer: 5
  },
  {
    user_id: 1,
    controllability_id: 6,
    answer: 5
  },
  {
    user_id: 1,
    controllability_id: 7,
    answer: 3
  },
  {
    user_id: 1,
    controllability_id: 8,
    answer: 3
  },
  {
    user_id: 1,
    controllability_id: 9,
    answer: 2
  },
  {
    user_id: 1,
    controllability_id: 10,
    answer: 4
  },
]
ControllabilityAnswer.create(initial_controllability_answers)

#A_answerテーブル
initial_attachment_answers = [
  {
    user_id: 1,
    attachment_id: 1,
    answer: 4
  },
  {
    user_id: 1,
    attachment_id: 2,
    answer: 4
  },
  {
    user_id: 1,
    attachment_id: 3,
    answer: 3
  },
  {
    user_id: 1,
    attachment_id: 4,
    answer: 5
  },
  {
    user_id: 1,
    attachment_id: 5,
    answer: 3
  },
  {
    user_id: 1,
    attachment_id: 6,
    answer: 3
  },
  {
    user_id: 1,
    attachment_id: 7,
    answer: 4
  },
  {
    user_id: 1,
    attachment_id: 8,
    answer: 4
  },
  {
    user_id: 1,
    attachment_id: 9,
    answer: 3
  },
  {
    user_id: 1,
    attachment_id: 10,
    answer: 4
  },
]
AttachmentAnswer.create(initial_attachment_answers)

#P_answerテーブル
initial_playability_answers = [
  {
    user_id: 1,
    playability_id: 1,
    answer: 4
  },
  {
    user_id: 1,
    playability_id: 2,
    answer: 4
  },
  {
    user_id: 1,
    playability_id: 3,
    answer: 2
  },
  {
    user_id: 1,
    playability_id: 4,
    answer: 5
  },
  {
    user_id: 1,
    playability_id: 5,
    answer: 5
  },
  {
    user_id: 1,
    playability_id: 6,
    answer: 5
  },
  {
    user_id: 1,
    playability_id: 7,
    answer: 5
  },
  {
    user_id: 1,
    playability_id: 8,
    answer: 3
  },
  {
    user_id: 1,
    playability_id: 9,
    answer: 3
  },
  {
    user_id: 1,
    playability_id: 10,
    answer: 4
  },
]
PlayabilityAnswer.create(initial_playability_answers)