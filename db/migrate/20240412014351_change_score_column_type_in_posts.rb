class ChangeScoreColumnTypeInPosts < ActiveRecord::Migration[6.1]
  def change
    change_column :posts, :score, :string
  end
end
