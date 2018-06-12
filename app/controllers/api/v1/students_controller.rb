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
        @student = @classroom.students.new(student_params) if @classroom.present?

        if @student.present? && @student.save && create_questions
          redirect_to questions_one_path(@student.id)
        else
          redirect_to root_path, alert: "Não foi possivel iniciar o teste"
        end
      end

      private

      def create_questions
        arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
        arr.each do |question_number|
          @student.questions.create(number: question_number, description: "question-#{question_number}", correct_answer: 1)
        end
        true
      end

      def load_student
        @student = Student.find_by_id params[:student_id]
      end

      def find_class_room
        @classroom = Classroom.find_by_code(params[:student][:classroom_id]) 
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