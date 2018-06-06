class Question < ActiveRecord::Base
	has_many :exams
  has_many :exam_questions, through: :exams
end
