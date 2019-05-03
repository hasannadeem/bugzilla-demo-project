class BugsController < ApplicationController
  before_action :find_bug, only: [:show, :edit, :update, :destroy] 
  
  def index
  	if(current_user.user_type == 'Developer')
  	  @bugs = Bug.where(assign_to:current_user.id)
  	else
  	  @bugs = Bug.all
  	end
  end
  
  def new
  	@bug = Bug.new
  end
  
  def create
    @bug = current_user.bugs.new(bug_params)
    if @bug.save
      redirect_to @bug
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
      render 'update'
    end
  end

  def show
  end

  def destroy
    @bug.destroy
    redirect_to bugs_path
  end  

  private 

 
  def find_bug
    @bug = Bug.find(params[:id])
  end

  def bug_params
    params.require(:bug).permit(:title,:deadline,:type,:status,:screen_shot)
  end

end
