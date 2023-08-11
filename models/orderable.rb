class Orderable < ApplicationRecord
  include DiscountPriceModule

  belongs_to :product
  belongs_to :cart

  validate :validate_age_restriction_for_product

  def total
    product.price * quantity
  end

  private

  def validate_age_restriction_for_product
    if product.age_restricted?
      min_age_required = product.min_age_required
      customer_age = calculate_customer_age

      if customer_age < min_age_required
        errors.add(:base, "You must be at least #{min_age_required} years old to purchase #{product.name}.")
      end
    end
  end

  def calculate_customer_age
    return 0 unless user.profile&.date_of_birth

    current_year = Time.current.year
    birth_year = user.profile.date_of_birth.year
    current_year - birth_year
  end

  def user
    user=User.find_by(id: @current_user.id)
  end
end