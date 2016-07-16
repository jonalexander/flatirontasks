class Cohort < ApplicationRecord
  has_many :instructor_cohorts
  has_many :instructors, through: :instructor_cohorts
  has_many :students
  has_many :cohort_assignments
  has_many :assignments, through: :cohort_assignments

  #ranks students by completed assignments 
  def cohort_student_assignments
    StudentAssignment.joins(:student).where(student: self.students)
  end 

  def cohort_statuses_for_all_students
    cohort_student_assignments.pluck('students.name', :status)
  end 

  def students_grouped_by_completed_statuses
    cohort_statuses_for_all_students.each_with_object({}) do |student, result|
      result[student[0]] ||= {true: 0, false: 0}
      if student[1] == true
        result[student[0]][:true]+=1
      else 
        result[student[0]][:false]+=1
      end  
    end 
  end 

  def ranked_students
    students_grouped_by_completed_statuses.sort_by {|student, status| status[:true]}
  end 

  #ranks assignments by completion
  def cohort_assignments
    StudentAssignment.joins(:assignment).where(assignment: self.assignments)
  end 

  def cohort_statuses_for_all_assignments
    cohort_assignments.pluck('assignments.name', :status)
  end 

  # def students_grouped_by_completed_statuses
  #   cohort_statuses_for_all_assignments.each_with_object({}) do |student, result|
  #     result[student[0]] ||= {true: 0, false: 0}
  #     if student[1] == true
  #       result[student[0]][:true]+=1
  #     else 
  #       result[student[0]][:false]+=1
  #     end  
  #   end 
  # end 

  # def ranked_students
  #   students_grouped_by_completed_statuses.sort_by {|student, status| status[:true]}
  # end 



        


end
