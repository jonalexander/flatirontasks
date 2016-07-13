class CreateCohortAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :cohort_assignments do |t|
      t.integer :assignment_id
      t.integer :cohort_id
    end
  end
end
