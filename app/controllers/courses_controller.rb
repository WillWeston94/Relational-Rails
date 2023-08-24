class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @courses = Course.find(params[:id])

    @faculty = @courses.faculty
  end
end
