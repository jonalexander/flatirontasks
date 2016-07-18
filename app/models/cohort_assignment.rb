class CohortAssignment < ApplicationRecord
  belongs_to :cohort
  belongs_to :assignment
  belongs_to :instructor
end
