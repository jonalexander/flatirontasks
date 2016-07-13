class Cohort < ApplicationRecord
  has_many :instructor_cohorts
  has_many :instructors, through: :instructor_cohorts
  has_many :students
  has_many :cohort_assignments
  has_many :assignments, through: :cohort_assignments
end
