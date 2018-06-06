class AddClassroomReferenceToStudents < ActiveRecord::Migration[5.1]
  def change
    add_reference :students, :classroom, foreign_key: true
  end
end
