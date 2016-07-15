class TasksController < ApplicationController
  before_action :login_required
  def new
    @task = Task.new
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
    @student = Student.find(params[:task][:student_id])
    #byebug
    @task.save
    redirect_to student_path(@student)
  end

  def index
    @tasks = Task.all
  end

  def task_complete
    @student = Student.find(params[:id])
    @task = Task.find(params[:task][:task_id])
    # @student_assignment = StudentAssignment.where(student_id: @student.id).where(assignment_id: @assignment.id)
    @task.status = !@task.status
    @task.save
    redirect_to student_path(@student)
  end

  private 
  
  def task_params
    params.require(:task).permit(:name, :description, :time, :priority, :student_id)
  end
end
