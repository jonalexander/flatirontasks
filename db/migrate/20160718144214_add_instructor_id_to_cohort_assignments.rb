class AddInstructorIdToCohortAssignments < ActiveRecord::Migration[5.0]
  def change
    add_column :cohort_assignments, :instructor_id, :integer
  end
end
