class LoginController < ApplicationController
  def index
  	resource = Teacher.find_by_email params[:username]
  		binding.pry
  	if resource&.valid_password? params[:password]
  		sign_in('teacher',resource)
  		redirect_to register_path
		end
  end
end