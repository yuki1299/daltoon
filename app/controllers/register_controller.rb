class RegisterController < ApplicationController
  def index
  	@teacher = Teacher.new
  end
end