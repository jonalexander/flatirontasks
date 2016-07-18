class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :login_required
  before_filter :validate_user, only: [:edit, :destroy]
  skip_before_action :login_required, only: [:new, :create]

  def index
     @students = Student.all
  end

  def show
  #byebug
    unless current_student == Student.find(params[:id]) || @user.is_a?(Instructor)
      redirect_to :back, :flash => 'Not your page bro'
    end

    if params[:sort].present?
      #byebug
      if params[:sort][:order] == 'asc'
        @list = @student.tasks_and_assignments.sort_by(&params[:sort][:sort_id].to_sym)
      elsif params[:sort][:order] == 'desc'
        @list = @student.tasks_and_assignments.sort_by(&params[:sort][:sort_id].to_sym).reverse
      end
    else 
      @list = @student.tasks_and_assignments.sort_by(&:priority).reverse
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
    if @student.save
      redirect_to student_path(@student)
    else
      flash.now[:message] = "Please enter correct email format"
      render action: "new"
    end
    # @assignments = @cohort.assignments
    # @assignments.each { |assignment| @student.assignments << assignment }
  end

  def update
  end

  def destroy
    @student.destroy
    redirect_to students_path
  end

  def validate_user
    unless current_student == Student.find(params[:id]) || @user.is_a?(Instructor)
      redirect_to :back
    end
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
