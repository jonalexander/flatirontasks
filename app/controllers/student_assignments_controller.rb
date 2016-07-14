class StudentAssignmentsController < ApplicationController
    def complete  
    @student = Student.find(params[:id])
    @assignment = Assignment.find(params[:assignment][:assignment_id])
    @student_assignment = StudentAssignment.where(student_id: @student.id).where(assignment_id: @assignment.id)
    @student_assignment.first.status = true
    @student_assignment.first.save
    redirect_to student_path(@student)
  end
end
