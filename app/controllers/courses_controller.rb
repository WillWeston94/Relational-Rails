class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def new
    @faculty = Faculty.find(params[:faculty_id])
    @course = Course.new
  end

  def show
    @courses = Course.find(params[:id])
    @faculty = @courses.faculty
  end

  def create
    course = Course.find(params[:id])
    course.update({
      course_name: params[:course_name],
      professor: params[:professor],
      gen_ed: params[:gen_ed],
      credits: params[:credits],
      start_date: params[:start_date],
      end_date: params[:end_date]
    })

    course.save
    redirect_to "/courses/#{course.id}"
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    course = Course.find(params[:id])
    course.update({
      course_name: params[:course_name],
      professor: params[:professor],
      gen_ed: params[:gen_ed],
      credits: params[:credits],
      start_date: params[:start_date],
      end_date: params[:end_date]
    })

    course.save
    redirect_to "/courses/#{course.id}"
  end
end