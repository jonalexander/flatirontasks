class AddStudentIdToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :student_id, :integer
  end
end
