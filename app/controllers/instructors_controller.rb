class InstructorsController < ApplicationController
  before_action :login_required
  skip_before_action :login_required, only: [:new, :create]
  

  def index 
    @instructors = Instructor.all
  end 

  def new 
    @instructor = Instructor.new
    @cohorts = Cohort.all
  end 

  def create 
    #byebug
    @instructor = Instructor.create(instructor_params)
    #byebug
    @cohort = Cohort.find(cohort_param[:id])
    @instructor.cohorts << @cohort
    @instructor.save
    session[:instructor_id] = @instructor.id
    redirect_to instructor_path(@instructor)
  end 

  def show
    @instructor = Instructor.find(params[:id])
  end

  def edit
    @instructor = Instructor.find(params[:id])
  end

  def update
    @instructor = Instructor.find(params[:id])
    if @instructor.update_attributes(instructor_params)
      redirect_to(@instructor)
    else
      render 'edit'
    end
  end

  def destroy
    @instructor.destroy
  end

  private 

  def instructor_params
    params.require(:instructor).permit(:name, :email, :password)
  end

  def cohort_param
    params.require(:instructor).permit(:id)
  end
end
