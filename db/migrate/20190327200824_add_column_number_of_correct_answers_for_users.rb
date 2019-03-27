class AddColumnNumberOfCorrectAnswersForUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :num_of_correct_answers, :integer
  end
end
