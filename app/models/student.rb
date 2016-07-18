#main goals
#see what assignments have been given for their cohort
#add tasks
#view a combination of tasks and assignments for today, and
#mark as complete

class Student < ApplicationRecord
  belongs_to :cohort, optional: true
  has_many :student_assignments
  has_many :assignments, through: :student_assignments
  has_many :tasks
  has_many :comments
  has_secure_password

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_format_of :email, with: EMAIL_REGEX, :on => :create
  #validates_presence_of :name, :email, :password, :password_confirmation
  #validates_uniqueness_of :email

  def assignment_status(assignment)
    if self.student_assignments.where('student_id = ?', self.id).where("assignment_id = ?", assignment.id)[0][:status] == false
      "Incomplete"
    else
      "Completed"
    end
  end

  def add_cohorts_assignments_to_student(cohort)
    cohort.assignments.each { |assignment| self.assignments << assignment }
  end

#### REFACTOR INTO SERVICE CLASS

  def tasks_and_assignments
    #byebug
    self.assignments + self.tasks
  end

  def generate_sorted_list(params)
    if params[:sort][:order].include?('asc')
      @sorted_list = self.tasks_and_assignments.sort_by(&params[:sort][:sort_id][0])
      # should accept :priority or :time through params
    elsif params[:sort][:order].include?('desc')
     @sorted_list = self.tasks_and_assignments.sort_by(&params[:sort][:sort_id][0]).reverse
  end

    # if params[:sort][:order] == 'asc'
    #   self.tasks_and_assignments.sort_by(&params[:sort][:sort_id].to_sym) 
    # elsif params[:sort][:order] == 'desc'
    #   self.tasks_and_assignments.sort_by(&params[:sort][:sort_id].to_sym).reverse
    # end
  end

  def default_list
     self.tasks_and_assignments.sort_by(&:priority).reverse
   end

#### 

  def incomplete_assignments
    #self.assignments.joins(:student_assignments).where("student_assignments.status = ?", false)
    self.student_assignments.where("student_assignments.status = ?", false)
  end

  def completed_assignments
    #self.assignments.joins(:student_assignments).where("student_assignments.status = ?", true)
    self.student_assignments.where("student_assignments.status = ?", true)
  end

  def incomplete_tasks
    self.tasks.where(status: false)
  end

  def completed_tasks
    self.tasks.where(status: true)
  end

  # needs to be built in ERB with .pluralize
  def assignments_tasks_status_info
    "You have #{incomplete_assignments.size} incomplete assignments and #{incomplete_tasks.size} incomplete tasks."
  end

end
