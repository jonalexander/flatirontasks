class AddInstructorIdToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :instructor_id, :integer
  end
end
