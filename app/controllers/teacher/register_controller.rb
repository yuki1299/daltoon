class Teacher::RegisterController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
  	@teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      redirect_to professor_login_teacher_path, notice: "Cadastro realizado com sucesso"
    else
      flash[:error] = "Não foi possível realizar o cadastro"
      redirect_to professor_register_teacher_path
    end
  end

  private

  def teacher_params
    params.require(:teacher).permit!
  end
end