class FacultyCoursesController < ApplicationController
  def index
    @faculty = Faculty.find(params[:faculty_id])
    if params[:sort_alpha] == 'true'
      @courses = @faculty.courses_alphabetical
    else
      @courses = @faculty.courses
    end
  end

  def filter
    @faculty = Faculty.find(params[:faculty_id])
    @courses = @faculty.courses

    threshold = params[:threshold].to_i
    @courses = @courses.where('credits > ?', threshold)

    render :index
  end
  
  def new
    @faculty = Faculty.find(params[:faculty_id])
    @course = Course.new
  end

  def create
    faculty = Faculty.find(params[:faculty_id])
    # binding.pry
    course = faculty.courses.build({
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
    @faculty = Faculty.find(params[:id])
    @courses = @faculty.courses
  end

 

  def new
    @faculty = Faculty.find(params[:id])
    @course = Course.new
  end
end