class ClassroomSerializer < ActiveModel::Serializer
  attributes  :id, 
  					  :code,
  					  :school,
  					  :slug,
  					  :teacher,
              :classroom_title

  def classroom_title
    "#{object.school} - #{object.slug} - #{object.code.present? ? object.code : 'não tem' }"  
  end

  def teacher
    build_teacher_hash object.teacher
  end

  protected

  def build_teacher_hash teacher
    {
      id: teacher.id,
      name: teacher.name,
      email: teacher.email,
    }
  end
end