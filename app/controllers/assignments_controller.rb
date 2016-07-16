class AssignmentsController < ApplicationController
  before_action :login_required, :instructor?
  skip_before_action :instructor?, only: [:show]

  def index
    @assignments = Assignment.all
  end

  def new
    @assignment = Assignment.new
  end

  def show
    @assignment = Assignment.find(params[:id])
    @comment = Comment.new
  end

  def create
    #byebug
    @assignment = Assignment.create(assignment_params)
    @cohort = Cohort.find(params[:assignment][:cohort_id])
    @assignment.cohorts << @cohort
    @assignment.add_assignment_to_students(@cohort)
    @assignment.save
    
    redirect_to cohort_path(@cohort)
  end

  def status
    @assignment = Assignment.find(params[:assignment_id])
    @cohort = Cohort.find(params[:cohort_id])
    @comment = Comment.new
  end 

  private 

  def assignment_params
    params.require(:assignment).permit(:name, :description, :time, :priority) 
  end
end
