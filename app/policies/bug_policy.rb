class BugPolicy < ApplicationPolicy

  def index?
    @user.developer?
  end
  
  def create?
  	@user.qa?
  end

  def assign?
  	@user.user_type=='developer'
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
