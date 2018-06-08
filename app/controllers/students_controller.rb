class StudentsController < ApplicationController
  def index
    @teacher = Teacher.find params[:teacher_id]
    @classrooms = @teacher.classrooms
    @classroom = Classroom.find params[:classroom_id]
    @students = @classroom.students
  end
end