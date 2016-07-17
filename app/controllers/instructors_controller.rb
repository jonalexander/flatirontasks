class InstructorsController < ApplicationController
  before_action :login_required, :instructor? 
  skip_before_action :login_required, only: [:new, :create]
  skip_before_action :instructor?, only: [:new, :create]
  #validates_presence_of :name, :email, :password, :password_confirmation
  #validates_uniqueness_of :email

  def index 
    @instructors = Instructor.all
  end 

  def new 
    @instructor = Instructor.new
    @cohorts = Cohort.all
  end 

  def create 
    @instructor = Instructor.(instructor_params)
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
    params.require(:instructor).permit(:name, :email, :password, :password_digest)
  end

  def cohort_param
    params.require(:instructor).permit(:id)
  end
end
