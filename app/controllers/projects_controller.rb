class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def update_status
    @project = Project.find(params[:project_id])

    if @project.update(status: params.permit(:status)[:status])
      flash[:notice] = "Status changed to #{@project.status.humanize}"
    else
      flash[:alert] = 'Something went wrong.'
    end
    redirect_to project_path(id: @project.id)
  end

  def create_comment
    @project = Project.find(params[:project_id])
    @user = User.find(params[:user_id])
    @comment = Comment.new(project: @project, user: @user, message: params.permit(:message)[:message])

    if @comment.save
      flash[:notice] = 'Comment was created'
    else
      flash[:alert] = "Here is some errors happened: #{@comment.errors.full_messages.join('. ')}."
    end
    redirect_to project_path(id: @project.id)
  end
end
