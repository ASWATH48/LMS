class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.string :answer
      t.references :users, foreign_key: true
      t.references :quests, foreign_key: true
      t.references :assesments, foreign_key: true
      t.timestamps
    end
  end
end
