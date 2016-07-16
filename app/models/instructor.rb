#main goal
#create assignments(hours, etc.) for a specific cohort


#dashboard, view stats of students
#has cohort finished the assignment?

class Instructor < ApplicationRecord
  has_many :instructor_cohorts
  has_many :cohorts, through: :instructor_cohorts
  has_many :comments
  has_secure_password

  def all_students
    Student.joins(cohort: :instructors).where("instructors.id = ?", self.id)
  end

  def add_assignment_to_cohort(cohort, assignment)
    cohort.assignments << assignment
    students_in_cohort(cohort).each do|student|
      student.assignments << assignment
    end
  end



  def students_in_cohort(cohort)
    all_students.where("students.cohort_id = ?", cohort.id)
    #Student.joins(cohort: :instructors).where("cohort.id = ?", cohort.id).where("instructors.id = ?", self.id)
  end

  def cohort_finished_assignment(cohort)
    #students_in_cohort(cohort).joins(:student_assignments).where("student_assignments.status = true")
  end
end
