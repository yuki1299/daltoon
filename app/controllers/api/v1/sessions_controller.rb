module Api
  module V1
		class SessionsController < ApplicationController
      include DeviseTokenAuth::Concerns::SetUserByToken
      skip_before_action :verify_authenticity_token

		  def create
		  	resource = Teacher.find_by_email params[:email]
		  	if resource&.valid_password? params[:password]
		  		sign_in('teacher',resource)
				  render json: { sucess: true, message: "Usuário Logado", email: resource.email, token: resource.authentication_token }, status: 200
				else
				  render json: { sucess: false, message: "Não foi iniciar a sessão", error_message: @classroom.errors }, status: 400
				end
		  end

		  def destroy
		  	teacher = Teacher.find_by_email params[:email]
		  	sign_out teacher
		  end
		end
	end
end