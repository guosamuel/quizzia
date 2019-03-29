require_relative '../config/environment'
require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"
# puts "hello world"
ActiveRecord::Base.logger = nil


welcome
user_name = get_user_name
check_user_name(user_name)

def main_program(input_user_name)
  display_main_menu
  user_choice = gets.chomp
  if user_choice == '1'#Start Trivia
    start_trivia
    num_of_questions_integer = get_number_of_questions
    question_type = get_type_of_questions
    questions_list = get_api(num_of_questions_integer, question_type)
    generate_questions(questions_list)
    save_program(input_user_name)
    play_again?(input_user_name)
    exit_program
  elsif user_choice == '2'#Delete Account
    delete_user(input_user_name)
    puts "See ya loser.\n "
    exit_program
  elsif user_choice == '3'#Change Account Name
    update_user_account_name(input_user_name)
  elsif user_choice == '5'|| user_choice.downcase == 'exit'# Exit
    exit_program
  elsif user_choice == '4' #Stats Page
    User.find_by(user_name: input_user_name).user_stats
    puts "Like what you see? Give us feedback!"
    like_it = gets.chomp
    puts " "
    main_program(input_user_name)
  else
    puts "Not a proper input."
    main_program(input_user_name)
  end
end

main_program(user_name)
