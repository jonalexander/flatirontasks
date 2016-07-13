class Instructor < ApplicationRecord
  has_many :instructor_cohorts
  has_many :cohorts, through: :instructor_cohorts

  def all_students
    self.cohorts.joins(:students)
  end
end
