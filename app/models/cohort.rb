class Cohort < ApplicationRecord
  has_many :students
  belongs_to :instructor
end
