class AddPriorityToAssignments < ActiveRecord::Migration[5.0]
  def change
    add_column :assignments, :priority, :integer
  end
end
