require_relative '../config/environment'
require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"
# puts "hello world"
  ActiveRecord::Base.logger = nil


welcome
user_name = get_user_name
check_user_name(user_name)
start_trivia
num_of_questions_integer = get_number_of_questions
question_type = get_type_of_questions
questions_list = get_api(num_of_questions_integer, question_type)
generate_questions(questions_list)
puts "Thanks for playing!"
