class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :edit, :update, :destroy] 
  before_action :authorize_project
  
  def index
    @projects = policy_scope(Project)
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
      render 'edit'
    end
  end

  def show
    @project_devs = @project.users.where(user_type:'developer')
    @un_assigned_devs = User.where(user_type:'developer') - @project_devs
    @project_qas = @project.users.where(user_type:'qa')
    @un_assigned_qas = User.where(user_type:'qa') - @project_qas
  end

  def destroy
    
    if @project.destroy
      redirect_to projects_path, notice: "Project Deleted Successfully"
    else
      redirect_to projects_path, notice: "Can not delete project"
    end

  end  

  private 

  def find_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name,:description)
  end

  def authorize_project
    if @project.present?
      authorize @project 
    else 
      authorize Project
    end
  end

end
