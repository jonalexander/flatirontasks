class RemovePriorityFromStudentAssignments < ActiveRecord::Migration[5.0]
  def change
    remove_column :student_assignments, :priority
  end
end
