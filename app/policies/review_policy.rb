# frozen_string_literal: true

class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    @user.role == 'user'
  end

  def destroy?
    @user.role == 'admin'
  end
end
