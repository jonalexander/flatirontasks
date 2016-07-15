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
  has_secure_password 
  #validates_presence_of :name, :email, :password, :password_confirmation
  #validates_uniqueness_of :email

  def assignment_status(assignment)
    self.student_assignments.where('student_id = ?', self.id).where("assignment_id = ?", assignment.id)[0][:status]
  end 

  def add_cohorts_assignments_to_student(cohort)
    cohort.assignments.each { |assignment| self.assignments << assignment }
  end

  def tasks_and_assignments
    self.assignments + self.tasks
  end 

  # def generate_complete_link
  #   tasks_and_assignments.each do |item|
  #     if item.is_a?(Assignment)

  #     else

  #     end
  #   end
  # end


end
