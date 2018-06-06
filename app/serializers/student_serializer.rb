class StudentSerializer < ActiveModel::Serializer
  attributes  :id, 
              :name,
              :exam,
              :student_answers,
              :total_correct_answers,
              :total_wrong_answers,
              :daltonism_percentage

  def exam
    object.exam
  end

  def student_answers
    exam_answers
  end

  def total_correct_answers
    10
  end

  def total_wrong_answers
    2
  end

  def daltonism_percentage
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

  def build_exam_answer_hash e
    {
      question: e.question.description,
      answer: e.answer
    }
  end

  def exam_answers
    ExamQuestion.where(student_id: object.exam.id).collect{ |e| build_exam_answer_hash e }
  end

  def teacher
    classroom.teacher
  end
end