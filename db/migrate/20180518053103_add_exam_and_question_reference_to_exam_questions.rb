class AddExamAndQuestionReferenceToExamQuestions < ActiveRecord::Migration[5.1]
  def change
    add_reference :exam_questions, :exam, foreign_key: true
    add_reference :exam_questions, :question, foreign_key: true
  end
end
