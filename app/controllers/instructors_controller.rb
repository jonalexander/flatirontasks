class InstructorsController < ApplicationController

  def index 
    @instructors = Instructor.all
  end 

  def new 
    @instructor = Instructor.new
    @cohorts = Cohort.all

  end 

  def create 

    @instructor = Instructor.create(instructor_params)
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
    params.require(:instructor).permit(:name, :email, :password, :cohort_id)
  end
end
