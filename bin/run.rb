require_relative '../config/environment'
require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"
# puts "hello world"

welcome
user_name = get_user_name
check_user_name(user_name)
start_trivia
num_of_questions_integer = get_number_of_questions
