class CohortsController < ApplicationController
  def index
    @cohorts = Cohort.all
  end

  def new
    @cohort = Cohort.new
  end

  def show
   # byebug
    @assignment = Assignment.new
    @cohort_assignment = CohortAssignment.new
    @cohort = Cohort.find(params[:id])
  end

  def create
    @cohort = Cohort.create(cohort_params)
    redirect_to cohort_path(@cohort)
  end

  private

  def cohort_params
    params.require(:cohort).permit(:name)
  end 

end
