class HomeController < ApplicationController
  def index
    if current_user.student?
      @evaluations = current_user.evaluations
      render 'evaluations/index'
    else
      @courses = current_user.courses
      render 'courses/index'
    end
  end
end
