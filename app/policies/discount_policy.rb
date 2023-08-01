class DiscountPolicy < ApplicationPolicy

#     def index?
#           @user.present? && @user.admin?
#     end
#     def create?
#           @user.present? && @user.admin? # Only admin users can create discounts
#     end
#     def update?
#           @user.present? && @user.admin? # Only admin users can update discounts
#     end
#     def destroy?
#           @user.present? && @user.admin? # Only admin users can delete discounts
#     end

    def new?
      @user.present? && @user.admin?
    end

    def update?
      @user.present? && @user.admin?
    end

    def destroy?
      @user.present? && @user.admin?
    end
  end