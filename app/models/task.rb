class Task < ApplicationRecord
  belongs_to :student

  def task_status
    self.status == false ? "Incomplete" : "Complete"
  end

end
