class CommentsController < ApplicationController
  def create
    @assignment = Assignment.find(comment_params[:assignment_id])
    @comment = @assignment.comments.create(comment_params)
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
