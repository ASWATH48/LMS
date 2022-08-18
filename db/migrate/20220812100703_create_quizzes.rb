class CreateQuizzes < ActiveRecord::Migration[6.1]
  def change
    create_table :quizzes do |t|
      t.string :question
      t.string :answer
      t.string :choice
      t.string :option1
      t.string :option2

      t.timestamps
    end
  end
end
