# frozen_string_literal: true

class CartPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    @user.role == 'manager'
  end
end
