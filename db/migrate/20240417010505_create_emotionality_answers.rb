class CreateEmotionalityAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :emotionality_answers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :emotionality, null: false, foreign_key: true
      t.integer :answer

      t.timestamps
    end
  end
end
