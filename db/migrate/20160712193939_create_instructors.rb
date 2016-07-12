class CreateInstructors < ActiveRecord::Migration[5.0]
  def change
    create_table :instructors do |t|
      t.string :name
      t.string :email
      t.string :password_disgest

      t.timestamps
    end
  end
end
