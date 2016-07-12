class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :cohort_id

      t.timestamps
    end
  end
end
