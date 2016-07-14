class AssignmentsController < ApplicationController
  def new
    @assignment = Assignment.new
  end

  def show
    @assignment = Assignment.find(params[:id])
  end

  def create
    
    @assignment = Assignment.create(assignment_params)
    @cohort = Cohort.find(params[:assignment][:cohort_id])
    @assignment.cohorts << @cohort
    @assignment.add_assignment_to_students(@cohort)
    @assignment.save
    byebug
    redirect_to cohort_path(@cohort)
  end

  def index
    @assignments = Assignment.all
  end

  private 

  def assignment_params
    params.require(:assignment).permit(:name, :description, :time)
  end
end
