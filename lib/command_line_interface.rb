@player = Audite.new
# @player.load("./audio/Super Mario Bros.-Coin Sound Effect.mp3")
# @player.start_stream

def welcome
puts " "
print "Welcome to"
title_timer = 1
until title_timer == 5
  print "."
  sleep(0.5)
  title_timer += 1
end
puts " "
puts " "
puts "    ┈┈╱▔▔▔▔▔╲┈┈┈HM┈HM
    ┈╱┈┈╱▔╲╲╲▏┈┈┈HMMM
    ╱┈┈╱━╱▔▔▔▔▔╲━╮┈┈
    ▏┈▕┃▕╱▔╲╱▔╲▕╮┃┈┈
    ▏┈▕╰━▏▊▕▕▋▕▕━╯┈┈
    ╲┈┈╲╱▔╭╮▔▔┳╲╲┈┈┈
    ┈╲┈┈▏╭━━━━╯▕▕┈┈┈
    ┈┈╲┈╲▂▂▂▂▂▂╱╱┈┈┈
    ┈┈┈┈▏┊┈┈┈┈┊┈┈┈╲┈
    ┈┈┈┈▏┊┈┈┈┈┊▕╲┈┈╲
    ┈╱▔╲▏┊┈┈┈┈┊▕╱▔╲▕
    ┈▏ ┈┈┈╰┈┈┈┈╯┈┈┈▕▕
    ┈╲┈┈┈╲┈┈┈┈╱┈┈┈╱┈╲
    ┈┈╲┈┈▕▔▔▔▔▏┈┈╱╲╲╲▏
    ┈╱▔┈┈▕┈┈┈┈▏┈┈▔╲▔▔
    ┈╲▂▂▂╱┈┈┈┈╲▂▂▂╱┈"
puts"   ____        _     _        "
puts"  / __ l      (_)   (_)       "
puts" | |  | |_   _ _ _____  __ _  "
puts" | |  | | | | | |_  / |/ _` | "
puts" | |__| | |_| | |/ /| | (_| | "
puts"  l___l_ll__,_|_/___|_|l__,_| "
puts " "

@player.load('./audio/zapsplat_multimedia_radio_production_voice_male_processed_deep_says_get_ready_28178.mp3')
@player.start_stream
end







def get_user_name
  puts "Please type your user name:"
  user_name = gets.chomp
  if  user_name == 'exit'
    exit_program
  end
  user_name
  # binding.pry
end

def check_user_name(user_name)
  if User.find_by(user_name: user_name)
    puts "Welcome back #{user_name}!"
    # get_confirmation_for_deleting_user(user_name)
    # binding.pry
  else
    puts "Welcome to Quizia!"
    # binding.pry
    User.create(user_name: user_name)
  end
end

# def get_confirmation_for_deleting_user(user_name)#not used in our code so far
#   puts "Do you want to continue with your current account or start a new account?"
#   puts "Starting a new account will delete your current progress"
#   puts "1 - Continue with current account"
#   puts "2 - Start new account"
#   answer = gets.chomp
#     if answer == "2"
#       # User.destroy(User.find_by(user_name: user_name).id)
#       User.create(user_name: get_user_name)
#       puts "You did it!"
#     elsif answer == 'exit'
#       exit_program
#     end
# end

def start_trivia
  puts "Are you ready to start playing? [Y/N]"
  start_game = gets.chomp
  if start_game.downcase == "y" || start_game.downcase == "yes"
    # puts "this working?"
    # get_number_of_questions

  else
    # start_trivia
    exit_program
  end
end

def get_number_of_questions
#tell user to input an integer between 1 to 50 (inclusive)
  puts "How many questions would you like to waste your time with? (1-10)"
  num_of_questions_variable = gets.chomp
  if num_of_questions_variable.to_i >= 1 && num_of_questions_variable.to_i <= 10
    num_of_questions_variable.to_i
  elsif num_of_questions_variable == 'exit'
    exit_program
  else
    puts "Numbers between 1 and 10 dipwad"
    get_number_of_questions
  end
end

def get_type_of_questions
#tell user to input question type (1-multiple, 2-boolian, 3-both)
  puts "Choose a question type: [1, 2, or 3]\n1- Multiple Choice\n2- True/False\n3- Both"
  question_type_variable = gets.chomp
  if question_type_variable == "1"
    "multiple"
  elsif question_type_variable == "2"
    "boolean"
  elsif question_type_variable == "3"
    nil
  elsif question_type_variable == 'exit'
    exit_program
  else
    puts "Hey, you goofed, please select 1, 2, or 3"
    get_type_of_questions
  end
  # puts " "
end

# def save_program
#   puts "* * * *\n \nWould you like to save your file? [Y/N]"
#   keep_user = gets.chomp
#     if keep_user.downcase == 'n' || keep_user.downcase == 'no'
#        # User.destroy(User.find_by(user_name: user_name).id)
#     else
#         puts "Saving file. Do not shutdown computer.\n* * * * *\nSave Successfull!"
#      end
# end

def exit_program
  # save_program
  puts "Thanks for playing!"
  abort
end

def save_cahricter_stats
end

def delete_user(user_name)
  User.destroy(User.find_by(user_name: user_name).id)
  puts "Your account was successfully deleted! (We know you were trying to get rid of your horrible stats.)"
end

def display_main_menu
  puts "*" * 30
  puts "  1 - Start Trivia\n  2 - Delete Account\n  3 - Change Account Name\n  4 - Stats Page\n  5 - Exit"
  puts "*" * 30
  puts "Please choose select a number:"
end

def update_user_account_name(old_user_name)
  puts "Please enter your new user name:"
  new_user_name = gets.chomp
  if new_user_name == 'exit'
    exit_program
  elsif User.find_by(user_name: new_user_name)
    puts "Sorry, this user name is already taken."
    update_user_account_name(old_user_name)
  else
    User.update(User.find_by(user_name: old_user_name).id, user_name: new_user_name)
    puts "Your new user name is now #{new_user_name}."
  end
end

def play_again?(user_name)
  puts "Do you want to play again? [Y/N]"
  play_again_input = gets.chomp
  if play_again_input.first.downcase == "y" || play_again_input.downcase == "yes"
    main_program(user_name)
  end
end
