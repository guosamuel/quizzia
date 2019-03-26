require 'rest-client'
require 'json'
require 'pry'

 def get_api(num_of_questions, question_type = nil)
   response_string = RestClient.get("https://opentdb.com/api.php?amount=#{num_of_questions}&type=#{question_type}")
   response_hash = JSON.parse(response_string)
 end

get_api(rand(50))

def generate_questions
#runs when both num and type are retrieved
end
