class TasksController < ApplicationController
  before_action :set_project

  def create
    @tasks = @project.tasks.create(task_params)
    redirect_to @project
  end

  def destroy
    @tasks = @project.tasks.find(params[:id])
    if @tasks.destroy
      flash[:success] = "Task successfully destroyed."
    else
      flash[:error] = "Task not found."
    end
    redirect_to @project
  end
  private
  def set_project
        @project = Project.find(params[:project_id])
  end

  def task_params
       params[:task].permit(:content)
  end
end
