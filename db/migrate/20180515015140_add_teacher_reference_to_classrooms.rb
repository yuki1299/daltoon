class AddTeacherReferenceToClassrooms < ActiveRecord::Migration[5.1]
  def change
    add_reference :classrooms, :teacher, foreign_key: true
  end
end
