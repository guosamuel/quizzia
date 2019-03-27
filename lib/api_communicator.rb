require 'rest-client'
require 'json'
require 'pry'

 def get_api(num_of_questions, question_type = nil)
   response_string = RestClient.get("https://opentdb.com/api.php?amount=#{num_of_questions}&type=#{question_type}")
   response_hash = JSON.parse(response_string)
 end

def compile_all_multiple_choice_answers(questions)
  all_answers = questions["incorrect_answers"]
  all_answers << questions["correct_answer"]
  all_answers.shuffle!
end

def multiple_choice_hash_maker(compiled_answer)
  answer_hash = Hash.new{0}
  hash_counter = 1
     compiled_answer.each do |answer|
      answer_hash[hash_counter] = answer
      hash_counter += 1
      # binding.pry
     end
   answer_hash
end

def format_display_mult_choi_answers(compiled_answer_2)
  counter = 1
    compiled_answer_2.each do |answer|
      puts "#{counter} - #{answer}"
      counter += 1
    end
end

def generate_questions(api_hash_of_questions)
  score_counter = 0
  question_counter = 1
#runs when both num and type are retrieved
  api_hash_of_questions["results"].each do |question|
    puts "QUESTION #{question_counter} of #{api_hash_of_questions["results"].length}"
    puts question["question"]
    # puts "Please type in your answer:"
    # puts question["correct_answer"]
    # puts question["incorrect_answers"]
      if question["type"] == 'multiple'
        puts "Please choose a number betwee 1 and 4"
# =======================
        compiled_answers = compile_all_multiple_choice_answers(question)
       # all_answers = question["incorrect_answers"]
       # all_answers << question["correct_answer"]
       # all_answers.shuffle!
# binding.pry
# =======================
        mult_cho_hash = multiple_choice_hash_maker(compiled_answers)
       # answer_hash = Hash.new{0}
       # hash_counter = 1
       #    compiled_answers.each do |answer|
       #     answer_hash[hash_counter] = answer
       #     hash_counter += 1
       #     # binding.pry
       #  end
# =======================

       # puts answer_hash
# =======================
      format_display_mult_choi_answers(compiled_answers)
#        counter = 1
#          compiled_answers.each do |answer|
#            puts "#{counter} - #{answer}"
#            # answer_hash = {"#{counter}" => "#{answer}"}
#             # if answer_hash
#            counter += 1
# # =======================
#          end
       answer = gets.chomp

       if mult_cho_hash[answer.to_i] == question["correct_answer"]
          # if answer_hash[answer.to_i] == question["correct_answer"]
            puts "Correct!"
            puts " "
            score_counter += 1
          else
            # binding.pry
            puts "You wrong!"
            puts "It is obviously '#{question["correct_answer"]}'"
            puts " "
          end

      else

       puts "Please type either True or False"
       answer = gets.chomp
         if  question["correct_answer"].first.downcase == answer.first.downcase
           puts 'Correct!'
           puts " "
           score_counter += 1
         else
           puts "You're pretty dumb."
           puts "The correct answer was '#{question["correct_answer"]}'"
           puts " "
         end
       end
       question_counter += 1
    end
    puts "You managed to score #{score_counter} out of #{api_hash_of_questions["results"].length}!"
    puts "You must think you're soooo smmmarrt... Looser."
end

#Get score to stay with user_name after game ends then clears if user creates new user

# def multiple_choice_answer_display
#
#
# end
