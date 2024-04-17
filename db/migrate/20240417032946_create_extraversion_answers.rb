class CreateExtraversionAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :extraversion_answers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :extraversion, null: false, foreign_key: true
      t.integer :answer

      t.timestamps
    end
  end
end
