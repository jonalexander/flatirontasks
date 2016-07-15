class CohortAssignmentsController < ApplicationController
  def create
    #byebug
    @cohort_assignment = CohortAssignment.create(cohort_assignment_params)
    @assignment = Assignment.find(cohort_assignment_params[:assignment_id])
    @cohort = Cohort.find(cohort_assignment_params[:cohort_id])
    @assignment.add_assignment_to_students(@cohort)
    redirect_to cohort_path(@cohort)
  end

  def cohort_assignment_params
    params.require(:cohort_assignment).permit(:assignment_id, :cohort_id)
  end
end