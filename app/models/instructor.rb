#main goal
#create assignments(hours, etc.) for a specific cohort


#dashboard, view stats of students 
#has cohort finished the assignment?

class Instructor < ApplicationRecord
  has_many :instructor_cohorts
  has_many :cohorts, through: :instructor_cohorts

  def all_students
    Student.joins(cohort: :instructors).where("instructors.id = ?", self.id)
  end

  def student_assignement_status(assignment)
    all_students.joins(:student_assignments).where(assignment = assignment("student_assignments.status = true")
  end 
end
