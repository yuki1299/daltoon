class Teacher::StudentsResultsController < ApplicationController
	def index
		@teacher = Teacher.find params[:id]
		@classrooms = @teacher.classrooms
	end
end	
