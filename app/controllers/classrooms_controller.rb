 class ClassroomsController < ApplicationController
  before_action :load_classroom, only: [:update, :show, :destroy]
  skip_before_action :verify_authenticity_token  

  def index
    teacher = Teacher.find params[:teacher_id]
    @classroom = teacher.classrooms
    render json: @classroom, each_serializer: ClassroomSerializer, status: 201
  end

  def create
    @teacher = Teacher.find params[:teacher_id]
    @classroom = @teacher.classrooms.new(classroom_params)
    generate_code

    if @classroom.save
      redirect_to professor_students_results_path(@teacher.id), notice: "Classe criada com sucesso"
    else
      flash[:error] = "Não foi possível criar a classe"
      redirect_to new_teacher_classroom_path(@teacher.id)
    end
  end

  def new
    @teacher = Teacher.find params[:teacher_id]
    @classrooms = @teacher.classrooms.order(school: :asc).collect{ |classroom| classroom if classroom.id.present? }.compact
    @classroom = @teacher.classrooms.new
  end

  def show
    if @classroom.present?
      render json: @classroom, serializer: ClassroomSerializer, status: 201
    else
      render json: { sucess: false, message: "Sala não encontrada!" }, status: 400
    end
  end

  def destroy
    if @classroom.destroy
      render json: { sucess: true, message: "Sala deletada com sucesso!" }, status: 201
    else
      render json: { sucess: false, message: "Sala foi possível deletar a sala!" }, status: 400
    end
  end

  private

  def generate_code
    @classroom.code = (0...8).map { (65 + rand(26)).chr }.join
  end

  def load_classroom
    @classroom = Classroom.find_by_id params[:id]
  end

  def classroom_params
    params.require(:classroom).permit(:school, :slug)
  end
end