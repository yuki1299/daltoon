module Api
  module V1
    class QuestionsController < ApplicationController
      skip_before_action :verify_authenticity_token  
      def answer
        find_student(params[:student_id])      
        if @student.present?
          find_question(params[:question]) 
          @question.update_attributes(answer: params[:answer])
          if params[:next_path] == "finish_test"
            redirect_to finish_test_student_path 
          else
            redirect_to "/student/#{params[:student_id]}/questions-#{params[:next_path]}"
          end
        end 
      end

      private

      def questions_params
        params.require(:classroom).permit!
      end

      def find_student id
        @student = Student.find id
      end

      def find_question id
        @question = @student.questions.find_by_number id
      end
    end
  end
end