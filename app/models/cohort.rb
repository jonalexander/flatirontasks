class Cohort < ApplicationRecord
  has_many :students
  has_many :instructors
end
