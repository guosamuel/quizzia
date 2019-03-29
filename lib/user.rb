class User < ActiveRecord::Base
  has_many :user_answers
  has_many :questions, through: :user_answers

  def user_stats
    if !self.num_of_total_answers
      puts "You have not answered any questions!"
    else
    puts "You have answered #{self.num_of_correct_answers} questions correctly out of a total of #{self.num_of_total_answers}."
    accuracy_percentage
    end

  end

  def accuracy_percentage
    percentage = (self.num_of_correct_answers.to_f / self.num_of_total_answers)*100
    puts "Your accuracy is #{percentage.round(2)}%."
  end

end
