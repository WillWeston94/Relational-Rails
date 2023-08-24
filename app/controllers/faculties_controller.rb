class FacultiesController < ApplicationController
  def index
    @faculties = Faculty.order(created_at: :desc)
  end

  def new
    @faculty = Faculty.new
  end

  def show
    @faculty = Faculty.find(params[:id])
  end

  def create
    faculty = Faculty.new({
      name: params[:name],
      department: params[:department],
      email: params[:email],
      phone: params[:phone],
      office_hours: params[:office_hours],
      years_instructing: params[:years_instructing]
    })

    faculty.save

    redirect_to '/faculties'
  end

  def edit
    @faculty = Faculty.find(params[:id])
  end

  def update
    faculty = Faculty.find(params[:id])
    faculty.update({
      name: params[:name],
      department: params[:department],
      email: params[:email],
      phone: params[:phone],
      office_hours: params[:office_hours],
      years_instructing: params[:years_instructing]
    })

    faculty.save
    redirect_to "/faculties/#{faculty.id}"
  end
end
