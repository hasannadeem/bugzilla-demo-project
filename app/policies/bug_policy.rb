class BugPolicy < ApplicationPolicy

  def index?
   show?
  end
  
  def create?
  	@user.qa?
  end
  
  def show?
    (@user.developer?) && ((@user.projects.ids).include? @record.project_id)
  end

  def assign?
  	show?
  end 

  def start_working?
  	@user.id == @record.assign_to
  end 

  def work_done?
  	start_working?
  end 

  class Scope < Scope
    def resolve
      scope.all
    end
  end




end
