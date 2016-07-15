class ChangeColumnNameStudents < ActiveRecord::Migration[5.0]
  def change
     rename_column :students, :password, :password_digest
  end
end
