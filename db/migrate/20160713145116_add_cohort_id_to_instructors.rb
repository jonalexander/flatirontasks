class AddCohortIdToInstructors < ActiveRecord::Migration[5.0]
  def change
    add_column :instructors, :cohort_id, :integer
  end
end
