
paul = User.find_or_create_by(user_name: 'Paul')
sam = User.find_or_create_by(user_name: 'Sam')

question1 = Question.find_or_create_by(trivia_question: "What is the unit of currency in Laos?", correct_answer: "Kip")
question2 = Question.find_or_create_by(trivia_question: "Which UK country features a dragon on their flag?", correct_answer: "Wales")
question3 = Question.find_or_create_by(trivia_question: "What is the homeworld of the Elites from Halo?", correct_answer: "Sanghelios")
question4 = Question.find_or_create_by(trivia_question: "About how old is Earth?", correct_answer: "4.5 Billion Years")
question5 = Question.find_or_create_by(trivia_question: "Which Teenage Mutant Ninja Turtle traditionally wears an orange bandana?", correct_answer: "Michelangelo")

paul_answer1 = UserAnswer.find_or_create_by(user_id: paul.id, question_id: question1.id, correct: true)
sam_answer1 = UserAnswer.find_or_create_by(user_id: sam.id, question_id: question2.id, correct: false)
sam_answer2 = UserAnswer.find_or_create_by(user_id: sam.id, question_id: question3.id, correct: true)
