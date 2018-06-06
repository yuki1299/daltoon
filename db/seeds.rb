if Question.all.empty?
	quetion_arr =	[
									{description: "questao-1", correct_answer: 2,},
									{description: "questao-2", correct_answer: 2,},
									{description: "questao-3", correct_answer: 2,},
									{description: "questao-4", correct_answer: 2,},
									{description: "questao-5", correct_answer: 2,},
									{description: "questao-6", correct_answer: 2,},
									{description: "questao-7", correct_answer: 2,},
									{description: "questao-8", correct_answer: 2,},
									{description: "questao-9", correct_answer: 2,},
									{description: "questao-10", correct_answer: 2,}
								]
	quetion_arr.each do |question| 
		question_object = Question.new(description: question[:description], correct_answer: question[:correct_answer])
		puts "===> #{question_object.description}" if question_object.save
	end
end
