class StudentsController < ApplicationController
  def index
    @teacher = Teacher.find params[:teacher_id]
    @classrooms = @teacher.classrooms
    @classroom = Classroom.find params[:classroom_id]
    @students = @classroom.students
  end

  def show
    @teacher = Teacher.find params[:teacher_id]
    @classrooms = @teacher.classrooms
    @classroom = Classroom.find params[:classroom_id]
    @students = @classroom.students
    @student = Student.find params[:student_id]
  end

  def index_mobile
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