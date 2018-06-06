class AddStudentReferenceToExams < ActiveRecord::Migration[5.1]
  def change
    add_reference :exams, :student, foreign_key: true
  end
end
