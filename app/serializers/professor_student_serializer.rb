class ProfessorStudentSerializer < ActiveModel::Serializer
  attributes  :id, 
              :name,
              :total_correct_answers,
              :total_wrong_answers,
              :autism_percentage

  def total_correct_answers
    10
  end

  def total_wrong_answers
    2
  end

  def autism_percentage
    "80%"
  end

  protected

  def build_class_room_hash classroom
    {
      id: classroom.id,
      slug: classroom.slug,
      school: classroom.school,
      code: classroom.code,
      teacher_id: teacher.id,
      teacher: teacher.name,
    }
  end

  def teacher
    classroom.teacher
  end
end