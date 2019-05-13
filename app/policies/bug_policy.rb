class BugPolicy < ApplicationPolicy

  def index?
    @user.developer?
  end
  
  def create?
  	@user.qa?
  end
  
  def show?
    (@user.developer?) && ((@user.projects.ids).include? @record.project_id)
  end

  def assign?
  	(@user.developer?) && ((@user.projects.ids).include? @record.project_id)
  end 

  def start_working?
  	@user.id == @record.assign_to
  end 

  def work_done?
  	@user.id == @record.assign_to
  end 

  class Scope < Scope
    def resolve
      scope.all
    end
  end


end
