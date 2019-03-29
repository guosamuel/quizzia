require 'rest-client'
require 'json'
require 'pry'

@player = Audite.new

def play_audio(file_name)
  @player.load("./audio/#{file_name}")
  @player.start_stream
end

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
  @score_counter = 0
  @question_counter = 1
#runs when both num and type are retrieved
  api_hash_of_questions["results"].each do |question|
    puts "QUESTION #{@question_counter} of #{api_hash_of_questions["results"].length}"
    puts question["question"]

    if question["type"] == 'multiple'
      puts "    Please choose a number between 1 and 4"
      compiled_answers = compile_all_multiple_choice_answers(question)
      mult_cho_hash = multiple_choice_hash_maker(compiled_answers)
      format_display_mult_choi_answers(compiled_answers)
      answer = gets.chomp

      if answer.downcase == 'exit'
        exit_program
      end

      if mult_cho_hash[answer.to_i] == question["correct_answer"]
        puts "Correct!\n "
        play_audio('Super Mario Bros.-Coin Sound Effect.mp3')
        @score_counter += 1
      else
        puts "You wrong!\nIt is obviously '#{question["correct_answer"]}'.\n "
        play_audio('zapsplat_multimedia_game_error_tone_009_24927.mp3')
      end

    else
     puts "   Please type either True or False"
     answer = gets.chomp

       if answer.downcase == 'exit'
         exit_program
       end

       if  question["correct_answer"].first.downcase == answer.first.downcase
         puts "Correct!\n "
         play_audio('Super Mario Bros.-Coin Sound Effect.mp3')
         @score_counter += 1
       else
         puts "You're pretty dumb.\nThe correct answer was '#{question["correct_answer"]}'.\n "
         play_audio('zapsplat_multimedia_game_error_tone_009_24927.mp3')
       end
     end
  @question_counter += 1
  end #end for enumerable method
  puts "You managed to score #{@score_counter} out of #{api_hash_of_questions["results"].length}!\nYou must think you're soooo smmmarrt... Loser."
end

def save_program(current_user_name)
  puts "*+" * 15
  puts "\nWould you like to save your progress? [Y/N]"
  keep_user = gets.chomp

  if keep_user.downcase == 'n' || keep_user.downcase == 'no'
     # literally does nothing in this body
  elsif keep_user.downcase == 'y' || keep_user.downcase == 'yes'
    if !User.find_by(user_name: current_user_name).num_of_total_answers
      current_num_of_total_answers = @question_counter - 1
      current_num_of_correct_answers = @score_counter
    else
      current_num_of_total_answers = User.find_by(user_name: current_user_name).num_of_total_answers
      current_num_of_total_answers += @question_counter - 1

      current_num_of_correct_answers = User.find_by(user_name: current_user_name).num_of_correct_answers
      current_num_of_correct_answers += @score_counter
    end
    User.update(User.find_by(user_name: current_user_name).id, num_of_correct_answers: current_num_of_correct_answers, num_of_total_answers: current_num_of_total_answers)
      puts "Saving file. Do not shutdown computer.\n "
      timer = 1

      while timer < 5
        print "*+*+*"
        print " #{100/(5-timer)}% "
        sleep(1)
        timer += 1
      end

    print " Complete!"
    play_audio('zapsplat_multimedia_notification_mallet_synth_dreamy_014_26423.mp3')
    sleep(1)
    puts " "
    puts " \nSave Successful!\n "

  else
    puts "Invalid argument. Select Yes or No"
    save_program(current_user_name)
  end
end
