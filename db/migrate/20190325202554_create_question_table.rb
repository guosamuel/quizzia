class CreateQuestionTable < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :trivia_question
      t.string :correct_answer
    end
  end
end
