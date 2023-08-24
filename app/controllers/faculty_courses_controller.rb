class FacultyCoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def new
    @faculty = Faculty.find(params[:faculty_id])
    @course = Course.new
  end

  def create
    faculty = Faculty.find(params[:faculty_id])
    course = Course.new({
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

  def show
    @courses = Course.find(params[:id])
    @faculty = @courses.faculty
  end
end