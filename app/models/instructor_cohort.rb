class InstructorCohort < ApplicationRecord
  belongs_to :instructor
  belongs_to :cohort
end
