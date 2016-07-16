class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :login_required
  skip_before_action :login_required, only: [:new, :create]

  def index
     @students = Student.all
  end

  def show
    unless current_student == Student.find(params[:id]) || @user.is_a?(Instructor)
      #byebug
      redirect_to :back, :alert => 'Not your page bro'
    end
    @task = Task.new  # for form
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
    @student.save

    redirect_to student_path(@student)
    # @assignments = @cohort.assignments
    # @assignments.each { |assignment| @student.assignments << assignment }
  end

  def update
  end

  def destroy
    @student.destroy
    redirect_to students_path
  end

  private

  def student_params
    params.require(:student).permit(:name, :email, :cohort_id, :password, :password_confirmation)
  end

  def set_student
    @student = Student.find(params[:id])
  end
end
