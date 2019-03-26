require 'rest-client'
require 'json'
require 'pry'

 def get_api(num_of_questions, question_type = nil)
   response_string = RestClient.get("https://opentdb.com/api.php?amount=#{num_of_questions}&type=#{question_type}")
   response_hash = JSON.parse(response_string)
 end

def generate_questions(api_hash_of_questions)
#runs when both num and type are retrieved
  api_hash_of_questions["results"].each do |question|
    puts question["question"]
    puts "Please type in your answer:"
    # puts question["correct_answer"]
      answer = gets.chomp
      if question["correct_answer"].downcase == answer.downcase
        puts 'Correct!'
      else
        puts "you dumb"
        puts "The correct answer was #{question["correct_answer"]}"
      end
    end
end
