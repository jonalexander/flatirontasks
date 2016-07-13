class Cohort < ApplicationRecord
  has_many :instructor_cohorts
  has_many :instructors, through: :instructor_cohorts
  has_many :students
end
