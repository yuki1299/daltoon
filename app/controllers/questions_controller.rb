class QuestionsController < ApplicationController
  def one
  end

  def two
  end

  def three
  end

  def four
  end

  def five
  end

  def six
  end

  def seven
  end

  def eight
  end

  def nine
  end

  def ten
  end

  def eleven
  end

  def send_question
    
  end

  private

  def find_student id
    @student = Student.find id
  end

  def find_question id
    @question = @student.questions.find_by_number id
  end
end