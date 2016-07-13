class AssignmentsController < ApplicationController
  def new
    @assignment = Assignment.new
  end

  def show
    @assignment = Assignment.find(params[:id])
  end

  def create
    @assignment = Assignment.create(assignment_params)
    redirect_to assignment_path(@assignment)
  end

  def index
    @assignments = Assignment.all
  end

  def assignment_params
    params.require(:assignment).permit(:name, :description, :time)
  end
end
