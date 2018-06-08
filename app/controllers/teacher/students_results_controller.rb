class Teacher::StudentsResultsController < ApplicationController
	def index
		@teacher = Teacher.find params[:id]
	end
end	
