# frozen_string_literal: true

class CartPolicy < ApplicationPolicy

  def index?
    @user.present? && @user.manager?
  end
end
