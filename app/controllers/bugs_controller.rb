class BugsController < ApplicationController
  before_action :find_bug, except: [:index,:new,:create] 
  
  before_action :authorize_bug, except: [:index]
  
  def index
    authorize Bug.new(project_id:params[:project_id])
    @view_data = helpers.data_for_view Bug.where(project_id:params[:project_id])
  end
  
  def new 
  	@bug = Bug.new
    @bug.project_id = params[:project_id]
  end
  
  def create
    @bug = current_user.bugs.new(bug_params)
    if @bug.save
      redirect_to projects_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @bug.update(bug_params)
      redirect_to @bug
    else
      render 'edit'
    end
  end

  def show
  end

  def assign 
    if @bug.update_attribute(:assign_to,current_user.id)  
      redirect_to @bug , notice: "Assigned Successfully"
    else
      redirect_to @bug , notice: "Not Assigned"
    end
  end

  def start_working 
    if @bug.update_attribute(:status,'started')
      redirect_to @bug , notice: "Started Successfully"
    else
      redirect_to @bug , notice: "Not Started"
    end
  end

  def work_done 
    status = (@bug.bug_type == 'feature')? 'completed' : 'resolved' 
    if @bug.update_attribute(:status,status)
      redirect_to @bug , notice: "Started Successfully"
    else
      redirect_to @bug , notice: "Not Started"
    end
  end

  def destroy
    @bug.destroy
    redirect_to bugs_path
  end  

  private 
 
  def find_bug
    @bug ||= Bug.find(params[:id])
  end

  def bug_params
    params.require(:bug).permit(:title,:deadline,:bug_type,:status,:screen_shot,:description,:project_id)
  end
  
  def authorize_bug
    if @bug.present?
      authorize @bug
    else
      authorize Bug
    end
  end
end
