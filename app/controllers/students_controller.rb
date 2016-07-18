class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :login_required
  before_filter :validate_user, only: [:edit, :destroy]
  skip_before_action :login_required, only: [:new, :create]

  def index
     @students = Student.all
  end


  def show
    unless current_student == Student.find(params[:id]) || @user.is_a?(Instructor)
      redirect_to students_path
    end
   # byebug
    @list =  ListOfTasksAssignments.new(@student)
    params[:sort].present? ? @list.sort_list(params) : @list.default_sort_priority_desc

    @task = Task.new  
  end

  def new
    @student = Student.new
  end

  def edit
  end

  def create
    @student = Student.create(student_params)
    session[:student_id] = @student.id

    @cohort = Cohort.find(student_params[:cohort_id])
    @student.add_cohorts_assignments_to_student(@cohort)

    if @student.save
      redirect_to student_path(@student)
    else
      flash.now[:message] = "Please enter correct email format"
      render action: "new"
    end

  end

  def update
  end

  def destroy
    @student.destroy
    redirect_to students_path
  end

  def validate_user
    redirect_to :back unless current_student == Student.find(params[:id])
  end


  private

  # def sort_params
  #   params.require(:sort).permit(:order, :sort_id)
  # end

  def student_params
    params.require(:student).permit(:name, :email, :cohort_id, :password, :password_confirmation)
  end

  def set_student
    @student = Student.find(params[:id])
  end
end
