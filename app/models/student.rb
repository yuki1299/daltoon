class Student < ActiveRecord::Base
  validates_presence_of :name
  belongs_to :classroom
  has_many :questions

  def correct_answers
		correct = 0
		self.questions.each{ |question| correct += 1 if question.answer.present? && question.correct_answer == question.answer }		
		correct
	end

	def wrong_answers
		wrong = 0
		self.questions.each{ |question| wrong += 1 if question.answer.present? && question.correct_answer != question.answer }		
		wrong
	end

	def calculate_percentage_wrong
		answered_questions = self.questions.collect{ |question| question if question.answer.present? }.compact.count
		percentage = (wrong_answers.to_f/answered_questions.to_f) * 100
		"#{percentage.round(2)}%"
	end

	def calculate_percentage_correct
		answered_questions = self.questions.collect{ |question| question if question.answer.present? }.compact.count
		percentage = (correct_answers.to_f / answered_questions.to_f) * 100
		"#{percentage.round(2)}%"
	end
end