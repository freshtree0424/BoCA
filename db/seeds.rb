# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

TEST_GMAIL_ACCOUNT_NAME = ENV["TEST_GMAIL_ACCOUNT_NAME"]
TEST_PASSWORD = ENV["TEST_PASSWORD"]






#initial_categories = [
#  {name: "Em1"},
#  {name: "Em2"},
#  {name: "Em3"},
#  {name: "Em4"},
#  {name: "Em5"},
#  {name: "Ex1"},
#  {name: "Ex2"},
#  {name: "Ex3"},
#  {name: "Ex4"},
#  {name: "Ex5"},
#  {name: "C1"},
#  {name: "C2"},
#  {name: "C3"},
#  {name: "C4"},
#  {name: "C5"},
#  {name: "A1"},
#  {name: "A2"},
#  {name: "A3"},
#  {name: "A4"},
#  {name: "A5"},
#  {name: "P1"},
#  {name: "P2"},
#  {name: "P3"},
#  {name: "P4"},
#  {name: "P5"},
#]
#Category.create(initial_categories)


initial_users = [
  {
    name: "一ノ瀬洋子",
    introduction: "小説全般好き"
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


initial_posts = [
  {
    user_id: 1,
    name: "一ノ瀬洋子",
    title: "test1",
    body: "test1",
    score: 4
  },
  {
    user_id: 2,
    name: "二階堂啓介",
    title: "test2",
    body: "test2",
    score: 3
  },
]
Post.create(initial_posts)
