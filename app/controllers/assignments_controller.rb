class AssignmentsController < ApplicationController
<<<<<<< 83a9fb65a15b4be2fc0284740f58b143086fa293
  before_action :login_required
=======
  def index
    @assignments = Assignment.all
  end

>>>>>>> some stuff
  def new
    @assignment = Assignment.new
  end

  def show
    @assignment = Assignment.find(params[:id])
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
  end 

  private 

  def assignment_params
    params.require(:assignment).permit(:name, :description, :time, :priority) 
  end
end
