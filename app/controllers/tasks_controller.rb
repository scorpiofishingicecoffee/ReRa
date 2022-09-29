class TasksController < ApplicationController
  before_action :set_project
  before_action :set_task, except: [:create]

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

  def complete
    @tasks.update_attribute(:completed_at, Time.now)
    redirect_to @project, notice: 'Task completed successfully.'
  end

  private
  def set_project
        @project = Project.find(params[:project_id])
  end

  def set_task
    @tasks = @project.tasks.find(params[:id])
  end

  def task_params
       params[:task].permit(:content)
  end
end
