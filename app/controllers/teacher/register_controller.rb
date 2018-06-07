class Teacher::RegisterController < ApplicationController
  def index
  	@teacher = Teacher.new
  end
end