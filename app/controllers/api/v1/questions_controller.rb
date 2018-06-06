module Api
  module V1
    class QuestionsController < ApplicationController
      skip_before_action :verify_authenticity_token  
      def answer
        student = Student.find_by_id params[:student_id]
        if student.present? && params[:question_id].present? && params[:answer].present?
          create_answer = ExamQuestion.new(exam: student.exam, question_id: params[:question_id], answer: params[:answer])
          create_answer.save
          render json: { sucess: true, message: "Resposta salva!" }, status: 201
        end 
      end

      private

      def questions_params
        params.require(:classroom).permit!
      end
    end
  end
end