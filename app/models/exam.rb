class Exam < ActiveRecord::Base
	belongs_to :student
	has_many :questions
  has_many :exam_questions, through: :questions
end
