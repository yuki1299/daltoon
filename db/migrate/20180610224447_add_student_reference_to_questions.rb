class AddStudentReferenceToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_reference :questions, :student, foreign_key: true
  end
end
