class RenameScoreToStarInPosts < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :score, :star
  end
end
