class ChangeColumnNameInstructors < ActiveRecord::Migration[5.0]
  def change
    rename_column :instructors, :password, :password_digest
  end
end
