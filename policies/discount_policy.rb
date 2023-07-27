class DiscountPolicy < ApplicationPolicy

    def index?
        @user.role == 'admin'
    end
    def create?
         @user.role == 'admin' # Only admin users can create discounts
    end
    def update?
         @user.role == 'admin' # Only admin users can update discounts
    end
    def destroy?
         @user.role == 'admin' # Only admin users can delete discounts
    end

  end