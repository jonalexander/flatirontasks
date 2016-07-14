class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = Student.all
  end

  def show
    #@student
    @task = Task.new  # for form
  end

  def new
    @student = Student.new
  end

  def edit
  end

  def create
    @student = Student.create(student_params)
    redirect_to student_path(@student)

    # respond_to do |format|
    #   if @student.save
    #     format.html { redirect_to @student, notice: 'Student was successfully created.' }
    #     format.json { render :show, status: :created, location: @student }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @student.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def update

    # respond_to do |format|
      # if @student.update(student_params)
      #   format.html { redirect_to @student, notice: 'Student was successfully updated.' }
      #   format.json { render :show, status: :ok, location: @student }
      # else
      #   format.html { render :edit }
      #   format.json { render json: @student.errors, status: :unprocessable_entity }
      # end
    #end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    redirect_to students_path
    # respond_to do |format|
    #   format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  private
    def student_params
      params.require(:student).permit(:name, :email, :password, :cohort_id)
    end

    def set_student
      @student = Student.find(params[:id])
    end
end
