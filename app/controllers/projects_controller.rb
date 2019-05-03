class ProjectsController < ApplicationController
  
  before_action :find_project, only: [:show, :edit, :update, :destroy] 
  before_action :varify_creator, only: [:show, :edit, :update, :destroy]
  
  def index
  	@projects = Project.where(created_by:current_user.id)
  end
  
  def new
  	@project = Project.new
  end
  
  def create
    @project = current_user.projects.new(project_params)
    @project.created_by = current_user.id
    if @project.save
      redirect_to @project
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to @project
    else
      render 'update'
    end
  end

  def show
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end  

  private 

  def varify_creator
    if !(@project.created_by == current_user.id)
        redirect_to projects_path, notice: "Record not found" 
    end 
  end
  def find_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name,:description)
  end


end
