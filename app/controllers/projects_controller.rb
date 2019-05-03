class ProjectsController < ApplicationController
  
  def index
  	@projects = Project.where(created_by:current_user.id)
  end
  
  def new
  	@project = Project.new
  end
  
  def create
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end  

end
