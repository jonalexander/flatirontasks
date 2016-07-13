#main goals 
#see what assignments have been given for their cohort
#add tasks 
#view a combination of tasks and assignments for today, and 
#mark as complete

class Student < ApplicationRecord
  belongs_to :cohort, optional: true
  has_many :student_assignments
  has_many :assignments, through: :student_assignments
  has_many :tasks

  #validates_presence_of :name, :email, :password_disgest
  #validates_uniqueness_of :email
end
