class CreateInstructorCohorts < ActiveRecord::Migration[5.0]
  def change
    create_table :instructor_cohorts do |t|
      t.integer :instructor_id
      t.integer :cohort_id

      t.timestamps
    end
  end
end
