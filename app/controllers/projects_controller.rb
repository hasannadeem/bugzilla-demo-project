class ProjectsController < ApplicationController
  before_action :find_project, except: [:index,:new,:create] 
  before_action :find_user, only: [:add_user, :remove_user]
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
    @pp = ProjectPresenter.new(@project,view_context)
  end
  
  def add_user
    if @project.users << @user
      redirect_to @project 
    else
      redirect_to @project, notice: "Can not add user to project"
    end
  end

  def remove_user
    if @project.users.destroy(@user)
      redirect_to @project 
    else
      redirect_to @project, notice: "Can not remove user from project"
    end
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
    @project ||= Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name,:description)
  end

  def find_user
    @user ||= User.find_by(id:params[:user_id])
  end

  def authorize_project
    if @project.present?
      authorize @project 
    else 
      authorize Project
    end
  end

end
