class BugPolicy < ApplicationPolicy

  def index?
    @user.developer?
  end
  class Scope < Scope
    def resolve
      scope.all
    end
  end


end
