class StudentAssignmentsController < ApplicationController
  before_action :login_required
  
  def complete  
    @student = Student.find(params[:id])
    @assignment = Assignment.find(params[:assignment][:assignment_id])
    @student_assignment = StudentAssignment.where(student_id: @student.id).where(assignment_id: @assignment.id)
    @student_assignment.first.status = !@student_assignment.first.status
    
    if @student_assignment.first.save
      session[:return_to] ||= request.referer
      redirect_to session.delete(:return_to)
    end
    
  end
end
