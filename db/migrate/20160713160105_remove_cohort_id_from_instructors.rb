class RemoveCohortIdFromInstructors < ActiveRecord::Migration[5.0]
  def change
    remove_column :instructors, :cohort_id
  end
end
