class LoginController < ApplicationController
  def index
  	@student = Student.new
    if params[:classroom_id].present? && Classroom.find_by_code(params[:classroom_id])
	    @classroom = Classroom.find_by_code(params[:classroom_id])
	    @student = @classroom.students.new(student_params)
	    redirect_to question_one(@student.id)
	  end
  end

  private

  def student_params
    params.require(:student).permit(:name, :classroom_id)
  end
end