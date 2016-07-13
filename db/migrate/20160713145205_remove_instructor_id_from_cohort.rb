class RemoveInstructorIdFromCohort < ActiveRecord::Migration[5.0]
  def change
    remove_column :cohorts, :instructor_id, :integer
  end
end
