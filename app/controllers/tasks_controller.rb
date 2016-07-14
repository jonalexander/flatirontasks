class TasksController < ApplicationController
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

  private 
  
  def task_params
    params.require(:task).permit(:name, :description, :time, :priority, :student_id)
  end
end
