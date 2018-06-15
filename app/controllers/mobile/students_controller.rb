class Mobile::StudentsController < ApplicationController
  def list
    @teacher = Teacher.find params[:teacher_id]
    @classrooms = @teacher.classrooms
    @classroom = Classroom.find params[:classroom_id]
    @students = @classroom.students
  end

  def show_mobile
    @teacher = Teacher.find params[:teacher_id]
    @classrooms = @teacher.classrooms
    @classroom = Classroom.find params[:classroom_id]
    @students = @classroom.students
    @student = Student.find params[:student_id]
  end
end