class AddColumnNumOfTotalAnswersForUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :num_of_total_answers, :integer
  end
end
