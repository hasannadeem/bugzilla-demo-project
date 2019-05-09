class ProjectPolicy < ApplicationPolicy
  
  def index?
    @user
  end
  def create?
    @record.created_by == @user.id
  end

  def update?
    @record.created_by == @user.id
  end

  def show?
    @record.created_by == @user.id
  end

  def destroy?
    @record.created_by == @user.id
  end



  class Scope < Scope
    def resolve
      if @user.manager?
      	scope.where(created_by:@user.id)
      elsif @user.qa? 
      	scope.all
      elsif @user.developer?
      	scope = @user.projects
      end	
    end
  end
  
end
