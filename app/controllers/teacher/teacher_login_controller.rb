class Teacher::TeacherLoginController < ApplicationController
	def index
		resource = Teacher.find_by_email params[:username]
		if resource.present? && resource.valid_password?(params[:password])
			sign_in('teacher',resource)
			redirect_to professor_students_results_path(resource.id)
		end
	end
end	