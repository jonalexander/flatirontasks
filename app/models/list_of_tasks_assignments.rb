class ListOfTasksAssignments 

  attr_accessor :student, :sorted_list

  def initialize(student)
    @student = student
    @sorted_list = nil
  end

  def tasks_and_assignments
    @student.assignments + @student.tasks
    # => array of assignments/tasks, no order
  end

  def sorted_tasks_assigments
    tasks_and_assignments.sort_by(&params[:sort][:sort_id][0].to_sym)
  end

  def sort_list(params)
    if params[:sort][:order][0].include?('asc')
      @sorted_list = tasks_and_assignments.sort_by(&params[:sort][:sort_id][0].to_sym)

      # should accept :priority or :time through params
    elsif params[:sort][:order][0].include?('desc')
     @sorted_list = tasks_and_assignments.sort_by(&params[:sort][:sort_id][0].to_sym).reverse
    end
  end

  def default_sort_priority_desc
    @sorted_list = tasks_and_assignments.sort_by(&:priority).reverse
  end 
end