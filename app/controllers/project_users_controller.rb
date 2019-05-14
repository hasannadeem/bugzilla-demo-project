class ProjectUsersController < ApplicationController
  
  layout false

  before_action :find_project_user, only: [:destroy]

  def create
    project_user = ProjectUser.new(project_id:params[:project_id],user_id:params[:user_id])
    
    if project_user.save!
    	render :json => {:msg => "user added"}
    else
    	render :json => {:msg => "user not added"}
    end
  end

  def destroy
    @project_users.each do |project_user|
      project_user.destroy
    end
    redirect_to request.referrer
  end
  
  private

  def find_project_user
    @project_users ||= ProjectUser.where(user_id:params[:user_id],project_id:params[:project_id])
  end

  def project_params
    params.require(:project_user).permit(:project_id,:user_id)
  end

end
