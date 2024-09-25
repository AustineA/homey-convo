class CommentsController < ApplicationController
  before_action :set_project, only: [ :create, :destroy ]
  before_action :set_comment, only: [ :destroy ]

  def create
    @comment = @project.comments.new(comment_params)
    if @comment.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @project }
      end
    else
      render "projects/show"
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @project }
    end
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_comment
    @comment = @project.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :author)
  end
end
