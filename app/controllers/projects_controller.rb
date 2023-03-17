class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def history
    @project = Project.find(params[:project_id])
    @performed_actions = (
      PerformedAction.where(subject: @project) + PerformedAction.where(subject: @project.comments)
    ).sort_by(&:created_at).reverse
  end

  def update_status
    @project = Project.find(params[:project_id])

    if @project.update(status: params.permit(:status)[:status])
      flash[:notice] = "Status changed to #{@project.status.humanize}"
      PerformedAction.create!(subject: @project, action_type: :status_changed, description: "The '#{@project.name}' was changed the status to '#{@project.status.humanize}'")
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
      PerformedAction.create!(subject: @comment, action_type: :created, description: "The '#{@project.name}' project was commented by #{@user.full_name}: '#{@comment.message}'")
    else
      flash[:alert] = "Here is some errors happened: #{@comment.errors.full_messages.join('. ')}."
    end
    redirect_to project_path(id: @project.id)
  end
end
