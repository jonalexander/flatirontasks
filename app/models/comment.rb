class Comment < ApplicationRecord
  belongs_to :assignment, optional: true
  belongs_to :instructor, optional: true
  belongs_to :student, optional: true
end
