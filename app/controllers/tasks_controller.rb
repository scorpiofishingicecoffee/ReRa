class TasksController < ApplicationController
  before_action :set_project
  before_action :set_task, except: [:create]
  def create
    @tasks = @project.tasks.create(task_params)
    redirect_to @project, notice: "Recipe was added."
  end

  def destroy
    if @tasks.destroy
      flash[:success] = "Recipe was successfully destroyed."
    else
      flash[:error] = "Recipe not found."
    end
    redirect_to @project, notice: 'Recipe was successfully deleted.'
  end

  def complete
    @tasks.update_attribute(:completed_at, Time.now)
    redirect_to @project, notice: "Recipe has been added."
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
