# frozen_string_literal: true

class ReviewPolicy < ApplicationPolicy

  def create?
    @user.present? && @user.admin?
  end

  def destroy?
    @user.present? && @user.admin?
  end

