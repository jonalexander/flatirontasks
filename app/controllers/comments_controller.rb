class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def create
    @assignment = Assignment.find(comment_params[:assignment_id])
    @comment = @assignment.comments.create!(comment_params)

    if current_student
      @student = Student.find(current_student[:id])
      @student.comments << @comment
      #byebug
    elsif current_instructor
      @instructor = Instructor.find(current_instructor[:id])
      @instructor.comments << @comment
      #byebug
    end
    redirect_to assignment_path(@assignment)
  end

  def destroy
    @assignment = Assignment.find(params[:assignment_id])
    @comment = @assignment.comments.find(params[:id])
    @comment.destroy
    redirect_to assignment_path(@assignment)
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body, :assignment_id)
  end
end
