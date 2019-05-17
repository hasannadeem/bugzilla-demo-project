class ProjectPolicy < ApplicationPolicy
  
  def index?
    true
  end
  def create?
    @user.manager?
  end

  def show?
    @record.created_by == @user.id
  end

  def update?
    show?
  end

  def destroy?
    show?
  end

  def add_user?
    show?
  end

  def remove_user?
    show?
  end

  class Scope < Scope
    def resolve
      if @user.manager?
      	scope.where(created_by: @user.id)
      elsif @user.qa? 
      	scope.all
      elsif @user.developer?
      	scope = @user.projects
      end	
    end
  end
  
end
