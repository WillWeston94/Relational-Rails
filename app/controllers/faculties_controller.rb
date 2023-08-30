class FacultiesController < ApplicationController
  def index
    if params[:sort] == 'true'
      @faculties = Faculty.faculties_by_created_at
    elsif
    @faculties = Faculty.order_by_count
    else
      @faculties = Faculty.all
    end
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

  def destroy
    @faculty = Faculty.find(params[:id])
    @faculty.courses.destroy_all  
    @faculty.destroy             
    
    redirect_to '/faculties'
  end
end
