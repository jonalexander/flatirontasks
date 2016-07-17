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
    @assignment = Assignment.new(assignment_params)

    if @assignment.save
      @cohort = Cohort.find(params[:assignment][:cohort_id])
      @assignment.cohorts << @cohort
      @assignment.add_assignment_to_students(@cohort)
      @assignment.save
      redirect_to cohort_path(@cohort)
    else
      render 'cohort/show'
    end    
  end

  def status
    @comment = Comment.new #for comment display
    # could replace in rails tag for comment partial - pass @comment there **
    @assignment = Assignment.find(params[:assignment_id])
    @cohort = Cohort.find(params[:cohort_id])
  end 

  private 

  def assignment_params
    params.require(:assignment).permit(:name, :description, :time, :priority) 
  end
end
