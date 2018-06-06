module Api
  module V1
    class StudentsController < ApplicationController
      include DeviseTokenAuth::Concerns::SetUserByToken
      # before_action :authenticate_professor! 
      before_action :find_class_room
      before_action :load_student, except: :create
      skip_before_action :verify_authenticity_token  

      def index
        @students = @classroom.students
        render json: @students, each_serializer: StudentSerializer, status: 201
      end

      def create
        @student = @classroom.students.new(student_params)

        if @student.save && @student.build_exam.save
          render json: @student, serializer: StudentSerializer, status: 201
        else
          render json: { sucess: false, message: "Não foi possível criar a sala", error_message: @student.errors }, status: 400
        end
      end

      def update
        if @student.update_attributes(student_params)
          render json: @student, serializer: StudentSerializer, status: 302
        else
          render json: { sucess: false, message: "Não foi possível atualziar a sala", error_message: @student.errors }, status: 400
        end
      end

      def show
        if @student.present?
          render json: @student, serializer: ProfessorStudentSerializer, status: 201
        else
          render json: { sucess: false, message: "Aluno não encontrada!" }, status: 400
        end
      end

      def destroy
        if @student.destroy
          render json: { sucess: true, message: "Sala deletada com sucesso!" }, status: 201
        else
          render json: { sucess: false, message: "Sala foi possível deletar a sala!" }, status: 400
        end
      end

      private

      def load_student
        @student = Student.find_by_id params[:student_id]
      end

      def find_class_room
        @classroom = params[:classroom_id].present? ? Classroom.find_by_id(params[:classroom_id]) :  Classroom.find_by_code(params[:code]) 
      end

      def student_params
        params.require(:student).permit(:name)
      end

      def classroom_params
        params.require(:classroom).permit(:code)
      end
    end
  end
end