class CreatePlayabilities < ActiveRecord::Migration[6.1]
  def change
    create_table :playabilities do |t|
      t.references :category, null: false, foreign_key: true
      t.string :question

      t.timestamps
    end
  end
end
