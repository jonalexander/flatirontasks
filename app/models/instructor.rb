class Instructor < ApplicationRecord
  belongs_to :cohort, optional: true
 

end
