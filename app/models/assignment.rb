class Assignment < ApplicationRecord
  has_many :student_assignments
  has_many :students, through: :student_assignments
  has_many :cohort_assignments
  has_many :cohorts, through: :cohort_assignments
  has_many :comments

  def add_assignment_to_students(cohort)
    cohort.students.each do |student|
      student.assignments << self
      student.save
    end 
  end 

  def statuses(cohort)
    StudentAssignment.joins(:student).where(student: cohort.students, assignment: self).pluck('students.name', :status)
  end

  def comment_count
    self.comments.count
  end

  def 

  def self.sort_by_most_comments
    self.all.sort_by { |assignment}
  end

  # def display_students(cohort)
  #   self.students.where(cohort_id: cohort.id)
  # end 

  # def display_student_assignments(cohort)
  #   display_students(cohort).each do |student|
  #     student.student_assignments.each do |joins|
  #       byebug 
  #     end 
  #   end 
  # end 

   

  # def student_assignment_status(cohort)
  #   display_students(cohort).each do |student|
  #     student.student_assignment.status
  #   end 
  # end 


  # def all_students
  #   Student.joins(cohort: :instructors).where("instructors.id = ?", self.id)
  # end

  # def add_assignment_to_cohort(cohort, assignment)
  #   cohort.assignments << assigment
  #   students_in_cohort(cohort).each do|student|
  #     student.assignments << assignment
  #   end 
  # end 

  

  # def students_in_cohort(cohort)
  #   all_students.where("students.cohort_id = ?", cohort.id)
  #   #Student.joins(cohort: :instructors).where("cohort.id = ?", cohort.id).where("instructors.id = ?", self.id)
  # end 

  # def cohort_finished_assignment(cohort)
  #   #students_in_cohort(cohort).joins(:student_assignments).where("student_assignments.status = true")
  # end 



end
